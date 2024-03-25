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
// IPV4地址的组成：
/**
 * [7:4] = version;            // IP协议的版本，是V4还是V6
 * [3:0] = IHL;                // IP Header Length,IP头的长度，每4个byte计数1
 * [13:8] = DSCP;
 * [15:14] = ECN;
 * [31:16] = length;           // IPV4 Header+IP数据的总长度，单位是byte
 * [47:32] = Idendification;   
 * [50:48] = Flags;
 * [63:51] = fragment offset;
 * [71:64] = TTL;
 * [79:72] = Protocol;
 * [95:80] = HeaderChecksum;
 * [127:96] = SrcAddr;
 * [159:128] = DstAddr;
 * [...] = IHL;
 */
#include "ipv4_config.hpp"
#include "ipv4.hpp"
/*
	1. 函数功能：计算IPV4的checksum，针对512bit的数据报文
	2. 参数解析：
		(1)dataIn,输入的512bit RC_ACK报文->in
		(2)dataOut,输入的512bit RC_ACK报文，原路返回->out
		(3)subSumFiFoOut
		(4)skipChecksum
*/
void compute_ipv4_checksum_xk(	hls::stream<net_axis<512> >&	dataIn,        // 输入的512bit报文数据
							hls::stream<net_axis<512> >&	dataOut)
{
	#pragma HLS PIPELINE II=1
	#pragma HLS INLINE off

	static ap_uint<4> cics_ipHeaderLen;
	static bool cics_firstWord = true;

	ap_uint<16> temp;
	ap_uint<20> tempChecksum=0;
	ap_uint<16> checksum;

	if (!dataIn.empty())
	{
		net_axis<512> currWord;
		dataIn.read(currWord);       // 将512bit报文数据读取至currWord中
		
		if (cics_firstWord)
		{
			cics_ipHeaderLen = currWord.data(3, 0);  //读取IPV4头的长度，即5字节

			for (int i = 0; i < 10; i++)             // IPV4一共20个字节，每两个字节组成一个16bit的字，因此一共要加10次
			{
				#pragma HLS unroll
				temp = reverse((ap_uint<16>) currWord.data(i*16+15, i*16));  // 每2个字节组成一个16bit的字并相加
				// std::cout<<"每一个16bit的字为： "<<temp<<std::endl;
				tempChecksum += temp;
				// std::cout<<"checksum为： "<<tempChecksum<<std::endl;
			}
			checksum = (tempChecksum & 0xFFFF) + (tempChecksum >> 16);
			// std::cout<<"checksum为： "<<checksum<<std::endl;
			checksum = ~checksum;
			// std::cout<<"checksum为： "<<checksum(15,0)<<std::endl;
			checksum = reverse(checksum);

			currWord.data(95,80) = checksum(15,0);
			cics_firstWord = false;
			// dataOut.write(currWord);
		}
		dataOut.write(currWord);

		// if (!cics_firstWord)
		// {
		// 	dataOut.write(currWord);
		if(currWord.last)
		{
			cics_firstWord = true;
		}
		// }
	}
}

template <int WIDTH>
void process_ipv4(	stream<net_axis<WIDTH> >&		dataIn,
					stream<ap_uint<4> >&	process2dropLengthFifo,
					stream<ipv4Meta>&			MetaOut,
					stream<net_axis<WIDTH> >&		dataOut)
{
#pragma HLS INLINE off
#pragma HLS pipeline II=1
	
	static ipv4Header<WIDTH> header;
	static ap_uint<4> headerWordsDropped = 0;
	static bool metaWritten = false;

	net_axis<WIDTH> currWord;
	// 传进来512的数据
	if (!dataIn.empty())
	{
		dataIn.read(currWord);                // 
		header.parseWord(currWord.data);      // 将读取的第一个数据段中的IP头拆出来，共160bit，一旦拆分出来IPV4头，则接下来再来的数据就不会被再进行拆分 

		if (header.isReady())                 // IPV4头拆分出来后，ready位有效
		{
			dataOut.write(currWord);          // 将输入数据赋值到输出数据接口
			if (!metaWritten)                 // 打印信息 
			{
				// 首先输出IP的源地址，也就是谁发给我的，地址长度是多少
				// std::cout << "IP HEADER: src address: " << header.getSrcAddr() << ", length: " << header.getLength() << std::endl;
				// process2dropLengthFifo存储的是IPV4 Header的长度，即20字节
				process2dropLengthFifo.write(header.getHeaderLength() - headerWordsDropped);
				// MetaOut中存储的是IPV4源地址与IPV4 Header+IP数据的总长度
				MetaOut.write(ipv4Meta(header.getSrcAddr(), header.getLength()));
				metaWritten = true;           // 写完数据后，metaWritten标志位置1，即当前数据包对于IPV4的处理不再进行
			}
		}

		headerWordsDropped += (WIDTH/32);     // headerWordsDropped += 512/32(16)
		if (currWord.last)                    // 当传进来最后一个数据段时
		{
			metaWritten = false;              // 标志位置0，好处理下一个数据包  
			header.clear();
			headerWordsDropped = 0;           
		}
	}
}

template <int WIDTH>
void generate_ipv4( stream<ipv4Meta>&		txEng_ipMetaDataFifoIn,
					stream<net_axis<WIDTH> >&	tx_shift2ipv4Fifo,
					stream<net_axis<WIDTH> >&	m_axis_tx_data,
					ap_uint<32>			local_ipv4_address,
					ap_uint<8>			protocol)
{
#pragma HLS INLINE off
#pragma HLS pipeline II=1

	enum fsmStateType {META, HEADER, PARTIAL_HEADER, BODY};
	static fsmStateType gi_state=META;
	static ipv4Header<WIDTH> header;

	ipv4Meta meta;
	net_axis<WIDTH> currWord;
	ap_uint<16>  length;
	ap_uint<16>  authentication	= 0x0002; 

	switch (gi_state)
	{
	case META:
		if (!txEng_ipMetaDataFifoIn.empty())
		{
			txEng_ipMetaDataFifoIn.read(meta);
			header.clear();

			length = meta.length + 20;
			header.setLength(length);
			header.setDstAddr(meta.their_address);
			header.setSrcAddr(local_ipv4_address);
			header.setProtocol(protocol);
			// header.setAuthentication(authentication);
			if (IPV4_HEADER_SIZE >= WIDTH)
			{
				gi_state = HEADER;
			}
			else
			{
				gi_state = PARTIAL_HEADER;
			}
		}
		break;
	case HEADER:
		if (header.consumeWord(currWord.data) < (WIDTH/8))
		{
			/*currWord.keep = 0xFFFFFFFF; //TODO, set as much as required
			currWord.last = 0;
			m_axis_tx_data.write(currWord);*/
			gi_state = PARTIAL_HEADER;
		}
		//else
		{
			currWord.keep = 0xFFFFFFFF; //TODO, set as much as required
			currWord.last = 0;
			m_axis_tx_data.write(currWord);
			//gi_state = PARTIAL_HEADER;
		}
		break;
	case PARTIAL_HEADER:
		if (!tx_shift2ipv4Fifo.empty())
		{
			tx_shift2ipv4Fifo.read(currWord);
			header.consumeWord(currWord.data);
			m_axis_tx_data.write(currWord);
			gi_state = BODY;

			if (currWord.last)
			{
				gi_state = META;
			}
		}
		break;
	case BODY:
		if (!tx_shift2ipv4Fifo.empty())
		{
			tx_shift2ipv4Fifo.read(currWord);
			m_axis_tx_data.write(currWord);
			if (currWord.last)
			{
				gi_state = META;
			}
		}
		break;
	}
}
/*
	1. 函数功能：为RC_ACK报文添加IPV4头
	2. 参数解析：
		(1)	txEng_ipMetaDataFifoIn->s_axis_tx_meta,IP用到的元数据，包含remote_ip_address,与加上UDP头后ACK报文的有效长度即28字节->in
		(2) tx_shift2ipv4Fifo->tx_shift2ipv4Fifo,右移20字节后的ACK报文，IP头当前值全为0->in
		(3) m_axis_tx_data->m_axis_tx_data，存储带IPV4头的512bit RC_ACK报文，一共20+8+12+4有效字节->out
		(4) local_ipv4_address->local_ipv4_address
		(5) protocol->protocol
*/
template <int WIDTH>
void ipv4_generate_ipv4( stream<ipv4Meta>&		txEng_ipMetaDataFifoIn,
					stream<net_axis<WIDTH> >&	tx_shift2ipv4Fifo,
					stream<net_axis<WIDTH> >&	m_axis_tx_data,
					ap_uint<32>			local_ipv4_address,
					ap_uint<8>			protocol)
{
#pragma HLS INLINE off
#pragma HLS pipeline II=1
	
	enum fsmStateType {META, HEADER, PARTIAL_HEADER, BODY};  // 设置四种状态META, HEADER, PARTIAL_HEADER, BODY
	static fsmStateType gi_state=META;
	static ipv4Header<WIDTH> header;

	ipv4Meta meta;
	net_axis<WIDTH> currWord;
	ap_uint<16>  length;

	switch (gi_state)
	{
	case META:
		if (!txEng_ipMetaDataFifoIn.empty())      // 初始状态时进入该函数
		{
			txEng_ipMetaDataFifoIn.read(meta);    // IP用到的元数据，包含remote_ip_address,与加上UDP头后ACK报文的有效长度即28字节
			header.clear();                       

			length = meta.length + 20;            // 数据长度再加20，因为IPV4头长20字节
			header.setLength(length);              // 设置长度
			header.setDstAddr(meta.their_address); // 设置Destination Addr = remote_ip_address
			header.setSrcAddr(local_ipv4_address); // 设置源地址 = local_ipv4_address
			header.setProtocol(protocol);          // 设置协议版本 = protocol
			if (IPV4_HEADER_SIZE >= WIDTH)
			{
				gi_state = HEADER;
			}
			else
			{
				gi_state = PARTIAL_HEADER;         // 状态跳转至PARTIAL_HEADER状态
			}
		}
		break;
	case HEADER:
		if (header.consumeWord(currWord.data) < (WIDTH/8))
		{
			/*currWord.keep = 0xFFFFFFFF; //TODO, set as much as required
			currWord.last = 0;
			m_axis_tx_data.write(currWord);*/
			gi_state = PARTIAL_HEADER;
		}
		//else
		{
			currWord.keep = 0xFFFFFFFF; //TODO, set as much as required
			currWord.last = 0;
			m_axis_tx_data.write(currWord);
			//gi_state = PARTIAL_HEADER;
		}
		break;
	case PARTIAL_HEADER:
		if (!tx_shift2ipv4Fifo.empty())
		{
			tx_shift2ipv4Fifo.read(currWord);  
			header.consumeWord(currWord.data);  // 将IPV4头嵌入至512bit RC_ACK报文中
			m_axis_tx_data.write(currWord);     // m_axis_tx_data中存储带IPV4头的RC_ACK报文  
			gi_state = BODY;

			if (currWord.last)
			{
				gi_state = META;
			}
		}
		break;
	case BODY:
		if (!tx_shift2ipv4Fifo.empty())
		{
			tx_shift2ipv4Fifo.read(currWord);
			m_axis_tx_data.write(currWord);
			if (currWord.last)
			{
				gi_state = META;
			}
		}
		break;
	}
}


template <int WIDTH>
void ipv4(		hls::stream<net_axis<WIDTH> >&	s_axis_rx_data,    // 输入的网络包数据 -> in
				hls::stream<ipv4Meta>&		m_axis_rx_meta,        // IPV4的元数据,包括IPV4的源IP地址与IPV4 header+IPV4数据包的长度 -> out 
				hls::stream<net_axis<WIDTH> >&	m_axis_rx_data,    // 输出的是去掉了IPV4头的报文 -> out
				hls::stream<ipv4Meta>&		s_axis_tx_meta,        // RX_ACK Path，IP用到的元数据，包含remote_ip_address,与加上UDP头后ACK报文的有效长度即28字节->in    
				hls::stream<net_axis<WIDTH> >&	s_axis_tx_data,    // RX_ACK Path，512bit带UDP头的RC_ACK报文->in
				hls::stream<net_axis<WIDTH> >&	m_axis_tx_data,    // RX_ACK Path，存储带IPV4头的512bit RC_ACK报文，一共20+8+12+4有效字节->out  
				ap_uint<32>			local_ipv4_address,            // 输出路径时用，用来给输出报文里面加自己的IP地址    
				ap_uint<8>			protocol) 
{
#pragma HLS INLINE


	/*
	 * FIFOs
	 */
	static hls::stream<ap_uint<4> > rx_process2dropLengthFifo("rx_process2dropLengthFifo");
	static hls::stream<net_axis<WIDTH> > rx_process2dropFifo("rx_process2dropFifo");
	static hls::stream<net_axis<WIDTH> > tx_shift2ipv4Fifo("tx_shift2ipv4Fifo");
	static hls::stream<net_axis<WIDTH> > ip2checksum("ip2checksum");
	#pragma HLS STREAM depth=2 variable=rx_process2dropLengthFifo
	#pragma HLS STREAM depth=8 variable=rx_process2dropFifo
	#pragma HLS STREAM depth=8 variable=tx_shift2ipv4Fifo
	#pragma HLS STREAM depth=8 variable=ip2checksum

	/*
	 * RX PATH，输入路径，解析数据包
	 */
	/*
		1. 函数功能： 解析出IPV4报文中的IPV4 Header长度、IPV4源地址即报文发送端地址以及IPV4报文的总长度
		2. 参数解析：
			（1)s_axis_rx_data->dataIn，输入的512bit数据段->in
			（2)rx_process2dropLengthFifo->process2dropLengthFifo，存储的是IPV4 Header的长度->out
			（3)m_axis_rx_meta->MetaOut，存储的是IPV4源地址与IPV4 Header+IP数据的总长度->out
			（4)rx_process2dropFifo->dataOut,输出输入的512bit数据段->out
	*/
	process_ipv4(s_axis_rx_data, rx_process2dropLengthFifo, m_axis_rx_meta, rx_process2dropFifo);
	//Assumes for WIDTH > 64 no optional fields
	/*
		1. 函数功能：取出IPV4头，解析出UDP报文
		2. 参数解析：
			（1)rx_process2dropLengthFifo->process2dropLengthFifo，存储的是IPV4 Header的长度->in
			（2)rx_process2dropFifo->process2dropFifo,存储的是输入的512bit数据->in
			（3)m_axis_rx_data-> dataOut,存储丢掉IPV4头之后的UDP报文 

	*/
	ipv4_drop_optional_ip_header(rx_process2dropLengthFifo, rx_process2dropFifo, m_axis_rx_data);

	/*
	 * TX PATH,输出路径
	 */
	/*
		1. 函数功能：将输入的包含UDP、BTH、AETH头的512bit数据右移20字节，为IPV4头腾位置
		2. 参数解析：
			(1)s_axis_tx_data,512bit带UDP、BTH、AETH头的RC_ACK报文
			(2)tx_shift2ipv4Fifo，右移20字节后的ACK报文，IP头当前值全为0
	*/
	ipv4_lshiftWordByOctet<WIDTH, 2>(((IPV4_HEADER_SIZE%WIDTH)/8), s_axis_tx_data, tx_shift2ipv4Fifo);
	/*
		1. 函数功能：为RC_ACK报文添加IPV4头
		2. 参数解析：
			(1)	txEng_ipMetaDataFifoIn->s_axis_tx_meta,IP用到的元数据，包含remote_ip_address,与加上UDP头后ACK报文的有效长度即28字节->in
			(2) tx_shift2ipv4Fifo->tx_shift2ipv4Fifo,右移20字节后的ACK报文，IP头当前值全为0->in
			(3) m_axis_tx_data->ip2checksum，存储带IPV4头的512bit RC_ACK报文，一共20+8+12+4有效字节->out
			(4) local_ipv4_address->local_ipv4_address
			(5) protocol->protocol
	*/
	ipv4_generate_ipv4(s_axis_tx_meta, tx_shift2ipv4Fifo, ip2checksum, local_ipv4_address, protocol);
	
	compute_ipv4_checksum_xk(ip2checksum,m_axis_tx_data);
	
}

void ipv4_top(		hls::stream<net_axis<DATA_WIDTH> >&	s_axis_rx_data,
				hls::stream<ipv4Meta>&		m_axis_rx_meta,
				hls::stream<net_axis<DATA_WIDTH> >&	m_axis_rx_data,
				hls::stream<ipv4Meta>&		s_axis_tx_meta,
				hls::stream<net_axis<DATA_WIDTH> >&	s_axis_tx_data,
				hls::stream<net_axis<DATA_WIDTH> >&	m_axis_tx_data,
				ap_uint<32>			local_ipv4_address,
				ap_uint<8>			protocol)
{
#pragma HLS DATAFLOW disable_start_propagation
#pragma HLS INTERFACE ap_ctrl_none register port=return

#pragma HLS INTERFACE axis register port=s_axis_rx_data
#pragma HLS INTERFACE axis register port=m_axis_rx_meta
#pragma HLS INTERFACE axis register port=m_axis_rx_data
#pragma HLS INTERFACE axis register port=s_axis_tx_meta
#pragma HLS INTERFACE axis register port=s_axis_tx_data
#pragma HLS INTERFACE axis register port=m_axis_tx_data
#pragma HLS DATA_PACK variable=m_axis_rx_meta
#pragma HLS DATA_PACK variable=s_axis_tx_meta
#pragma HLS INTERFACE ap_stable register port=local_ipv4_address
#pragma HLS INTERFACE ap_stable register port=protocol

   ipv4<DATA_WIDTH>(s_axis_rx_data,
        m_axis_rx_meta,
        m_axis_rx_data,
        s_axis_tx_meta,
        s_axis_tx_data,
        m_axis_tx_data,
        local_ipv4_address,
		protocol);

};


