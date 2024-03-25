/*
 * Copyright (c) 2019, Systems Group, ETH Zurich
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation
 * and/or other materials provided with the distribution.
 * 3. Neither the name of the copyright holder nor the names of its contributors
 * may be used to endorse or promote products derived from this software
 * without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 * IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
#include "udp_config.hpp"
#include "udp.hpp"
/** UDP Header
 * [15, 0] = srcPort;
 * [31, 16] = dstPort;
 * [47, 32] = length;
 * [63, 48] = checksum;
 */
template <int WIDTH>
void process_udp(	stream<net_axis<WIDTH> >& input,     // 经过ipv4解析后的拆解掉IPV4头的数据包->in
					stream<udpMeta>& metaOut,             
					stream<net_axis<WIDTH> >& output,
               ap_uint<16>       regListenPort)          // 注册好的udp port
{
#pragma HLS inline off
#pragma HLS pipeline II=1

	static udpHeader<WIDTH> pu_header;       // 定义一个udpHeader,UDP header的大小为64bit，即8byte
	static bool metaWritten = false;         // 定义标志位metaWritten 
	net_axis<WIDTH> currWord;                // 定义一个net_axis类型的对象，用来暂存数据

	if (!input.empty())
	{
		input.read(currWord);                // 将input数据读取到currWord中 

		/*std::cout << "UDP: ";
		print(std::cout, currWord);
		std::cout << std::endl;*/

		pu_header.parseWord( currWord.data);  // 将UDP Header解析出来，暂存到currWord.data中

		
		if (metaWritten && pu_header.getDstPort() == regListenPort && WIDTH <= UDP_HEADER_SIZE)  // 如果metaWritten为true，分析出来的Destination Port地址与本段UDP地址相同且WIDTH<=UDP头的大小，即WIDTH<=64的情况，
		{
			output.write(currWord);                                                              // 不晓得有什么作用，不是第一次进来，还能取到DstPort?
		}

		if (pu_header.isReady())                                        // 如果成功将UDP的头抓出来了
		{
			//Check Dst Port
			ap_uint<16> dstPort = pu_header.getDstPort();               // 分析Dst的头 
			if (dstPort == regListenPort && WIDTH > UDP_HEADER_SIZE)    // 判断Dst的头和本地头是否相同，同时判断数据段位宽大于UDP头大小
			{
				output.write(currWord);                                 // 将currWord赋给output
			}
			if (!metaWritten)                                           // 第一次进来
			{
				// std::cout << "UDP dst Port: " << (uint16_t)dstPort << std::endl;   // 输出本段UDP port，此处设置为12b7
				metaOut.write(udpMeta(pu_header.getSrcPort(), dstPort, pu_header.getLength(), dstPort == regListenPort));  // metaOut包括UDP的源端口，UDP的目的端口，UDP头+UDP报文的长度，此处为0x68，即104，正好与IP头里面的IP Length对起来，那个值是124，及IP Header与IP报文的长度为124，而IP头长度为20，正好对起来
				metaWritten = true;                                     // 标志位设置为True，即不是第一次进来了
			}
		}
		if (currWord.last)
		{
			metaWritten = false;           // 如果是最后一个数据段，则将metaWritten标志位复位
			pu_header.clear();             // pu_header清0
		}
	}
}
/*
	1. 函数功能：生成UDP头并添加到RC ACK报文中
	2. 参数解析：
		(1)metaIn->tx_udpMetaFifo,UDP用到的元数据，包含remote_udp_port，本端RDMA_DEFAULT_PORT与加上UDP头后ACK报文的有效长度即28字节->in
		(2)input->tx_shift2udpFifo,512bit ACK Packet，其中前8字节为全0的UDP，9-20字节为BTH，21-24字节为AETH->in
		(3)output->m_axis_tx_data，带UDP头的RC_ACK报文->out
*/
template <int WIDTH>
void generate_udp(	stream<udpMeta>& metaIn,
					stream<net_axis<WIDTH> >& input,
					stream<net_axis<WIDTH> >& output)
{
#pragma HLS inline off
#pragma HLS pipeline II=1

	enum fsmState {META, HEADER, PARTIAL_HEADER, BODY};    // 设置四个状态META, HEADER, PARTIAL_HEADER, BODY
	static fsmState state = META;                          // 初始状态为MRTA 
	static udpHeader<WIDTH> header; //TODO meta or header??

	udpMeta meta;
	net_axis<WIDTH> currWord;

	switch (state)
	{
	case META:
		if (!metaIn.empty())           // 初始处理时进来这里
		{
			
			metaIn.read(meta);                   // 将元数据读取至meta中，含remote_udp_port，本端RDMA_DEFAULT_PORT与加上UDP头后ACK报文的有效长度即28字节
			header.clear();
			header.setDstPort(meta.my_port);     // 设置UDP头中的目的端口为本端UDP Port，这个地方是Linux协议栈特定的
			header.setSrcPort(meta.their_port);  // 设置UDP头中的源端口为目的UDP Port，这个地方是Linux协议栈特定的
			header.setLength(meta.length);       // 设置UDP头中的总长度为加上UDP头后ACK报文的有效长度即28字节
			if (UDP_HEADER_SIZE >= WIDTH)
			{
				state = HEADER;
			}
			else
			{
				state = PARTIAL_HEADER;          // 状态跳转至PARTICAL_HEADER
			}
		}
		break;
	case HEADER:
		if (header.consumeWord(currWord.data) < (WIDTH/8))
		{
			state = PARTIAL_HEADER;
		}
		currWord.keep = 0xFFFFFFFF; //TODO, set as much as required
		currWord.last = 0;
		output.write(currWord);
		break;
	case PARTIAL_HEADER:
		if (!input.empty())                       
		{
			input.read(currWord);
			header.consumeWord(currWord.data);   // 将UDP头添加至512Bit的RC_ACK报文中
			output.write(currWord);
			state = BODY;
			if (currWord.last)
			{
				state = META;
			}
		}
		break;
	case BODY:
		if (!input.empty())
		{
			input.read(currWord);
			output.write(currWord);
			if (currWord.last)
			{
				state = META;
			}
		}
		break;
	}
}

/*void check_udp_checksum(	stream<net_axis<WIDTH> >& input,
						stream<net_axis<WIDTH> >& output)
{
}*/

/*
	1. 函数功能：对ib_transport_protocol函数传入的元数据进行拆分
	2. 参数解析：
		(1)metaIn->s_axis_tx_meta,ib_transport_protocol函数传入的元数据，包括remote_ip_address，remote_udp_port,RDMA_DEFAULT_PORT,len(BTH+AETH+ICRC=12+4+4=20字节)->in
		(2)metaOut0->m_axis_tx_meta，IP用到的元数据，包含remote_ip_address,与加上UDP头后ACK报文的有效长度即28字节->out
		(3)metaOut1->tx_udpMetaFifo，UDP用到的元数据，包含remote_udp_port，本端RDMA_DEFAULT_PORT与加上UDP头后ACK报文的有效长度即28字节->out
*/
//TODO compact ipMeta
void split_tx_meta(	stream<ipUdpMeta>&	metaIn,
					stream<ipMeta>&		metaOut0,
					stream<udpMeta>&	metaOut1)
{
#pragma HLS PIPELINE II=1
#pragma HLS INLINE off

	ipUdpMeta meta;
	if (!metaIn.empty())
	{
		metaIn.read(meta);   // 将metaIn中的元数据读取至meta中
		//Add 8 bytes for UDP header
		ap_uint<16> tempLen = meta.length+8;    // 
		metaOut0.write(ipMeta(meta.their_address, tempLen));
		metaOut1.write(udpMeta(meta.their_port, meta.my_port, tempLen));
	}
}
// ipMetaIn,经过ipv4解析后的IP元数据,包括IPV4的源IP地址与IPV4 header+IPV4数据包的长度->in
// udpMetaOut,经过解析过后的UDP元数据，包括UDP的源端口，UDP的目的端口，UDP头+UDP报文的长度与UDP目的端口是否与本机设置端口相同->in
// MetaOut，将IP与UDP的元数据进行整合，包含将IP的源地址、UDP的对端port、UDP的本端port以及UDP头+UDP报文的长度->out 
void merge_rx_meta(	stream<ipMeta>&		ipMetaIn,
					stream<udpMeta>&	udpMetaIn,
					stream<ipUdpMeta>&	metaOut)
{
#pragma HLS PIPELINE II=1
#pragma HLS INLINE off
	
	ipMeta meta0;           // 定义一个ipMeta类型的对象meta0
	udpMeta meta1;          // 定义一个udpMeta类型的变量meta1

	if (!ipMetaIn.empty() && !udpMetaIn.empty())
	{
		ipMetaIn.read(meta0);    // 将IP元数据读进meta0
		udpMetaIn.read(meta1);   // 将UDP元数据读进meta1
		if (meta1.valid)         // 如果metal是空的
		{
			// 将IP的源地址、UDP的对端port、UDP的本端port以及UDP头+UDP报文的长度读进metaout里面
			metaOut.write(ipUdpMeta(meta0.their_address, meta1.their_port, meta1.my_port, meta1.length));
		}
	}
}


template <int WIDTH>
void udp(		hls::stream<ipMeta>&		s_axis_rx_meta,      // RX Path，经过ipv4解析后的IP元数据,包括IPV4的源IP地址与IPV4 header+IPV4数据包的长度->in
				hls::stream<net_axis<WIDTH> >&	s_axis_rx_data,  // RX Path，经过ipv4解析后的拆解掉IPV4头的数据包->in
				hls::stream<ipUdpMeta>&	m_axis_rx_meta,          // RX Path，将IP与UDP的元数据进行整合，包含将IP的源地址、UDP的对端port、UDP的本端port以及UDP头+UDP报文的长度
				hls::stream<net_axis<WIDTH> >&	m_axis_rx_data,  // RX Path，经过ipv4和udp后，被拆掉IPV4头和UDP头的报文，此时就只剩IB Transport层的内容了 
				hls::stream<ipUdpMeta>&	s_axis_tx_meta,          // RX Path，ib_transport_protocol回ACK时包含的元数据，即继续下传至UDP/IP的元数据，包括remote_ip_address，remote_udp_port,RDMA_DEFAULT_PORT,len(BTH+AETH+ICRC=12+4+4=20字节)
				hls::stream<net_axis<WIDTH> >&	s_axis_tx_data,  // RX Path，返回的512bit ACK Packet，其中前12字节为BTH，13-16字节为AETH
				hls::stream<ipMeta>&		m_axis_tx_meta,      // RX Path，IP用到的元数据，包含remote_ip_address,与加上UDP头后ACK报文的有效长度即28字节
				hls::stream<net_axis<WIDTH> >&	m_axis_tx_data,  // RX Path，返回512bit带UDP头的RC_ACK报文
				ap_uint<128>		reg_ip_address,
				ap_uint<16>			reg_listen_port)            // upd port，const ap_uint<16> RDMA_DEFAULT_PORT = 0x12B7; //4791 --> 0x12B7->in
{
#pragma HLS INLINE
	/*
	 * RX PATH
	 */
	static hls::stream<net_axis<WIDTH> >	rx_udp2shiftFifo("rx_udp2shiftFifo");
	static hls::stream<udpMeta>	rx_udpMetaFifo("rx_udpMetaFifo");
	#pragma HLS STREAM depth=2 variable=rx_udp2shiftFifo
	#pragma HLS STREAM depth=2 variable=rx_udpMetaFifo
	#pragma HLS DATA_PACK variable=rx_udpMetaFifo
	// s_axis_rx_data->input,经过ipv4解析后的拆解掉IPV4头的数据包->in
	// rx_udpMetaFifo->metaOut,UDP的源端口，UDP的目的端口，UDP头+UDP报文的长度与UDP目的端口是否与本机设置端口相同->out
	// rx_udp2shiftFifo->output,解析完UDP头后的input
	// reg_listen_port->regListenPort,注册的UDP端口，固定值是0x12b7->in
	process_udp<WIDTH>(s_axis_rx_data, rx_udpMetaFifo, rx_udp2shiftFifo, reg_listen_port);

	// offset->((UDP_HEADER_SIZE%WIDTH)/8) = (64%512)/8 = 8->in
	// input->rx_udp2shiftFifo，即输入进来的512bit数据段->in
	// output->m_axis_rx_data->拆掉了UDP头的报文，此时已经将IB Transport层露出来了
	udp_rshiftWordByOctet<net_axis<WIDTH>, WIDTH, 2>(((UDP_HEADER_SIZE%WIDTH)/8), rx_udp2shiftFifo, m_axis_rx_data);
	
	// ipMetaIn->s_axis_rx_meta,经过ipv4解析后的IP元数据,包括IPV4的源IP地址与IPV4 header+IPV4数据包的长度->in
	// udpMetaOut->rx_udpMetaFifo,经过解析过后的UDP元数据，包括UDP的源端口，UDP的目的端口，UDP头+UDP报文的长度与UDP目的端口是否与本机设置端口相同->in
	// MetaOut->m_axis_rx_meta,将IP与UDP的元数据进行整合，包含将IP的源地址、UDP的对端port、UDP的本端port以及UDP头+UDP报文的长度->out 
	merge_rx_meta(s_axis_rx_meta, rx_udpMetaFifo, m_axis_rx_meta);

	/*
	 * TX PATH
	 */
	static hls::stream<net_axis<WIDTH> >	tx_shift2udpFifo("tx_shift2udpFifo");
	static hls::stream<net_axis<WIDTH> >	tx_udp2shiftFifo("tx_udp2shiftFifo");
	static hls::stream<udpMeta>	tx_udpMetaFifo("tx_udpMetaFifo");
	#pragma HLS STREAM depth=2 variable=tx_shift2udpFifo
	#pragma HLS STREAM depth=2 variable=tx_udp2shiftFifo
	#pragma HLS STREAM depth=2 variable=tx_udpMetaFifo
	/*
		1. 函数功能：对ib_transport_protocol函数传入的元数据进行拆分
		2. 参数解析：
			(1)metaIn->s_axis_tx_meta,ib_transport_protocol函数传入的元数据，包括remote_ip_address，remote_udp_port,RDMA_DEFAULT_PORT,len(BTH+AETH+ICRC=12+4+4=20字节)->in
			(2)metaOut0->m_axis_tx_meta，IP用到的元数据，包含remote_ip_address,与加上UDP头后ACK报文的有效长度即28字节->out
			(3)metaOut1->tx_udpMetaFifo，UDP用到的元数据，包含remote_udp_port，本端RDMA_DEFAULT_PORT与加上UDP头后ACK报文的有效长度即28字节->out
	*/
	split_tx_meta(s_axis_tx_meta, m_axis_tx_meta, tx_udpMetaFifo);

	/*
		1. 函数功能：对ib_transport_protocol传进来的报文再右移8个字节，给udp头腾出空间
		2. 参数解析：
			(1)s_axis_tx_data,ib_transport_protocol函数返回的512bit ACK Packet，其中前12字节为BTH，13-16字节为AETH->in
			(2)tx_udpMetaFifo,s_axis_tx_data右移8字节后的512bit ACK Packet，其中前8字节为全0的UDP，9-20字节为BTH，21-24字节为AETH->out
	*/
	udp_lshiftWordByOctet<WIDTH, 1>(((UDP_HEADER_SIZE%WIDTH)/8), s_axis_tx_data, tx_shift2udpFifo);
	/*
		1. 函数功能：生成UDP头并添加到RC ACK报文中
		2. 参数解析：
			(1)metaIn->tx_udpMetaFifo,UDP用到的元数据，包含remote_udp_port，本端RDMA_DEFAULT_PORT与加上UDP头后ACK报文的有效长度即28字节->in
			(2)input->tx_shift2udpFifo,512bit ACK Packet，其中前8字节为全0的UDP，9-20字节为BTH，21-24字节为AETH->in
			(3)output->m_axis_tx_data，带UDP头的RC_ACK报文->out
	*/
	generate_udp<WIDTH>(tx_udpMetaFifo, tx_shift2udpFifo, m_axis_tx_data);
}

void udp_top(	hls::stream<ipMeta>&		s_axis_rx_meta,
				hls::stream<net_axis<DATA_WIDTH> >&	s_axis_rx_data,
				hls::stream<ipUdpMeta>&	m_axis_rx_meta,
				hls::stream<net_axis<DATA_WIDTH> >&	m_axis_rx_data,
				hls::stream<ipUdpMeta>&	s_axis_tx_meta,
				hls::stream<net_axis<DATA_WIDTH> >&	s_axis_tx_data,
				hls::stream<ipMeta>&		m_axis_tx_meta,
				hls::stream<net_axis<DATA_WIDTH> >&	m_axis_tx_data,
				ap_uint<128>		reg_ip_address,
				ap_uint<16>			reg_listen_port)

{
#pragma HLS DATAFLOW disable_start_propagation
#pragma HLS INTERFACE ap_ctrl_none port=return

#pragma HLS INTERFACE axis register port=s_axis_rx_meta
#pragma HLS INTERFACE axis register port=s_axis_rx_data
#pragma HLS INTERFACE axis register port=m_axis_rx_meta
#pragma HLS INTERFACE axis register port=m_axis_rx_data
#pragma HLS INTERFACE axis register port=s_axis_tx_meta
#pragma HLS INTERFACE axis register port=s_axis_tx_data
#pragma HLS INTERFACE axis register port=m_axis_tx_meta
#pragma HLS INTERFACE axis register port=m_axis_tx_data
#pragma HLS DATA_PACK variable=s_axis_rx_meta
#pragma HLS DATA_PACK variable=m_axis_rx_meta
#pragma HLS DATA_PACK variable=s_axis_tx_meta
#pragma HLS DATA_PACK variable=m_axis_tx_meta
#pragma HLS INTERFACE ap_stable register port=reg_ip_address
#pragma HLS INTERFACE ap_stable register port=reg_listen_port


   udp<DATA_WIDTH>(s_axis_rx_meta,
                   s_axis_rx_data,
                   m_axis_rx_meta,
                   m_axis_rx_data,
                   s_axis_tx_meta,
                   s_axis_tx_data,
                   m_axis_tx_meta,
                   m_axis_tx_data,
                   reg_ip_address,
                   reg_listen_port);
}

