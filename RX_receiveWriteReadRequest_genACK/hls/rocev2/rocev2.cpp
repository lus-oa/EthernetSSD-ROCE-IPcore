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
#include "rocev2_config.hpp"
#include "rocev2.hpp"

#define PACKET_LEN 48
void printfbuffer(void *baseaddr)
{
	uint8_t *base = (uint8_t*)baseaddr;
	for(int i=1;i<=PACKET_LEN;i++)
	{
		printf("%02x ", base[i-1]);
		if(i%16==0)
		{
			printf("\n");;
		}
	}
	printf("\n");
}


//TODO is packet aligned to 32bytes??
//TODO move onto memory write path or where CRC is checked
/*
	1. 函数功能：抓出IP报文中的CRC校验值，并将输入的IP报文原封不动地返回
	2. 参数解析：
		（1)s_axis_rx_data->input，输入的512bit数据段
		（2)rx_crc2ipFifo，输出抓取出CRC后的512bit数据段
*/
template <int WIDTH>   // WIDTH=512bit，此时输入的数据是需要处理的数据报文
void extract_icrc(	stream<net_axis<WIDTH> >&		input,  
#ifndef DISABLE_CRC_CHECK
					stream<net_axis<WIDTH> >&		output)  // 如果disable了CRC——CHENK，就会直接将output输出出去
#else
					stream<net_axis<WIDTH> >&		output,
					stream<ap_uint<32> >&	rx_crcFifo)
#endif
{
#pragma HLS inline off
#pragma HLS pipeline II=1
	enum stateType {FIRST, PKG, LAST};      // 定义状态机的三个状态，FIRST,PKG和LAST
	static stateType ei_state = FIRST;      // 定义初始化状态为FIRST
	static net_axis<WIDTH> ei_prevWord;     // 定义一个512bit长度的ei_preWord用来存储已经处理过的数据，因为是静态变量，会在程序运行过程中会一直存在，直到人为释放
	ap_uint<32> crc;                        // 用来存储32位解析出来的CRC计算结果
	net_axis<WIDTH> currWord;               // 定义一个512bit长度的currWord来暂存数据

	switch (ei_state)
	{
	case FIRST:                             // 第一次进来
		if (!input.empty())                 // input不能为空
		{
			input.read(currWord);           // 首先将input中的数据读到currWord中
			ei_prevWord = currWord;         // 对ei_prevWord进行赋值，将currWord赋值到ei_prevWord中
			ei_state = PKG;                 // 状态跳转至PKG，即Packet包处理状态
			if (currWord.last)              // 如果是最后一段数据，也就是可能第一个包的长度不够512bit，那我传递进来的数据就是最后一段数据
			{ 
				ei_state = LAST;            // 直接跳转到LAST状态
			}
		}
		break;                              // 跳出switch
	case PKG:
		if (!input.empty())                 // 如果来了第二个包，此时状态已经跳转到PKG
		{
			input.read(currWord);           // 将input中的值赋到currWord中
			if (currWord.last)              // 如果是最后一个数据段
			{
				if (currWord.keep[4] == 0)        // 如果currWord的keep[4]=0,即keep= 0 1111，由于每一个keep的每一位表示的都是一个8bit的字节是否有效，因此如果第5位是0的话，即有效的字节数只有32位，那直接把这32位读取出来就行，因为最后32位就是CRC计算出的结果
				{
					ei_prevWord.last = 0x1;       // 表示上一个数据段就是最后一个有效的数据段？往下传的时候不需要CRC了？
					crc = currWord.data(31, 0);   // 直接将这32位数据当作CRC校验结果
#ifdef DISABLE_CRC_CHECK
					rx_crcFifo.write(crc);
#endif
					ei_state = FIRST;             // 状态恢复至FIRST，开始进行下一个数据段的处理
				}
				else
				{
					ei_state = LAST;              // 给出的实例中该位为1,此时跳入到LAST状态
				}
			}
			output.write(ei_prevWord);            // 先把上一次读取出来的512bit数据存放到output里
			ei_prevWord = currWord;               // ei_preWord再来存储这一次传进来的512bit数据
		}
		break;
	case LAST:
		ap_uint<64> keep = ei_prevWord.keep; // this is required to make the case statement work for all widths，这个keep是表示数据位是否有效，每一个字节分配一个keep位，如果有效的话则置为1
		switch(keep)                         // 此时不管input中有没有数据了，因为数据都搞完了，相当于流水线，while循环又加了一层，实例中keep=0x0fffffffffffffff
		{
		case 0xF:
			//This should not occur
			crc = ei_prevWord.data(31, 0);
			break;
		case 0xFF:
			crc = ei_prevWord.data(63, 32);
			ei_prevWord.keep(7,4) = 0x0;
			break;
		case 0xFFF:
			crc = ei_prevWord.data(95, 64);
			ei_prevWord.keep(11,8) = 0x0;
			break;
		case 0xFFFF:
			crc = ei_prevWord.data(127, 96);
			ei_prevWord.keep(15,12) = 0x0;
			break;
		case 0xFFFFF:
			crc = ei_prevWord.data(159, 128);
			ei_prevWord.keep(19,16) = 0x0;
			break;
		case 0xFFFFFF:
			crc = ei_prevWord.data(191, 160);
			ei_prevWord.keep(23,20) = 0x0;
			break;
		case 0xFFFFFFF:
			crc = ei_prevWord.data(223, 192);
			ei_prevWord.keep(27,24) = 0x0;
			break;
		case 0xFFFFFFFF:
			crc = ei_prevWord.data(255, 224);
			ei_prevWord.keep(31,28) = 0x0;
			break;
		case 0xFFFFFFFFF:
			crc = ei_prevWord.data(287, 256);
			ei_prevWord.keep(35,32) = 0x0;
			break;
		case 0xFFFFFFFFFF:
			crc = ei_prevWord.data(319, 288);
			ei_prevWord.keep(39,36) = 0x0;
			break;
		case 0xFFFFFFFFFFF:
			crc = ei_prevWord.data(351, 320);
			ei_prevWord.keep(43,40) = 0x0;
			break;
		case 0xFFFFFFFFFFFF:
			crc = ei_prevWord.data(383, 352);
			ei_prevWord.keep(47,44) = 0x0;
			break;
		case 0xFFFFFFFFFFFFF:
			crc = ei_prevWord.data(415, 384);
			ei_prevWord.keep(51,48) = 0x0;
			break;
		case 0xFFFFFFFFFFFFFF:
			crc = ei_prevWord.data(447, 416);
			ei_prevWord.keep(55,52) = 0x0;
			break;
		case 0xFFFFFFFFFFFFFFF:
			crc = ei_prevWord.data(479, 448);
			ei_prevWord.keep(59,56) = 0x0;
			break;
		case 0xFFFFFFFFFFFFFFFF:
			// 在本实例中进来了这
			crc = ei_prevWord.data(511, 480);  // 这个地方只是取出CRC校验结果
			ei_prevWord.keep(63,60) = 0x0;     // 
			break;
		} //switch
		output.write(ei_prevWord);             // 将新来的512bit数据传递给output，让他继续走下去
		// std::cout << "CRC: " << std::hex << crc << std::endl;
#ifdef DISABLE_CRC_CHECK
		rx_crcFifo.write(crc);
#endif
		ei_state = FIRST;
		break;
	}

}

/*
 * Append ICRC over GRH, IBA Headers & Payload
 * RoCEv2: Replace in IPv6: traffic class, flow label, hop_limit, udp checksum with '1'
 * BTH: ignore Resv8a
 * hop limit is always FF
 */

template <int WIDTH, int DUMMY>
void mask_header_fields_ipv6(stream<net_axis<WIDTH> >& input,
						stream<net_axis<WIDTH> >& dataOut,
						stream<net_axis<WIDTH> >& maskedDataOut)
{
#pragma HLS inline off
#pragma HLS pipeline II=1

	//mask containig all of these fields
	const static ap_uint<424> one_mask = 0;
	// traffic class
	one_mask(3, 0) = 0xF;
	one_mask(11, 8) = 0xF;
	// flow label
	one_mask(31, 12) = 0xFFFFF;
	// hop limit TODO: should already be xFF
	one_mask(63, 56) = 0xFF;

	// UDP checksum
	one_mask(383, 368) = 0xFFFF;
	// BTH Resv8a
	one_mask(423,416) = 0xFF;
	const static ap_uint<3> header_length = (424/WIDTH);
	static ap_uint<8> ai_wordCount = 0;

	net_axis<WIDTH> crcWord;
	net_axis<WIDTH> currWord;


	if (!input.empty())
	{
		input.read(currWord);
		crcWord = currWord;

		if (ai_wordCount < header_length)
		{
			//std::cout << "applied mask: " << ai_wordCount << ", range: (" << std::dec << (int) ((ai_wordCount+1)*WIDTH)-1 << "," << (int) (ai_wordCount*WIDTH) << ")" << std::endl;
			crcWord.data = crcWord.data | one_mask(((ai_wordCount+1)*WIDTH)-1, ai_wordCount*WIDTH);
		}
		else if (ai_wordCount == header_length)
		{
			//std::cout << "aaapplied mask: " << ai_wordCount << ", range: (" << std::dec << (int) 423 << "," << (int) (ai_wordCount*WIDTH) << ")" << std::endl;
			crcWord.data((424%WIDTH)-1 , 0) = crcWord.data((424%WIDTH)-1 , 0) | one_mask(423, ai_wordCount*WIDTH);
		}
		maskedDataOut.write(crcWord);
		dataOut.write(currWord);
		ai_wordCount++;
		if (currWord.last)
		{
			ai_wordCount = 0;
		}
	}
}


/*
	1. 函数功能：
	2. 参数解析：
		(1)input->tx_ip2crcFifo,存储带IPV4、UDP、BTH、AETH的512bit RC_ACK报文，一共20+8+12+4有效字节->in
		(2)dataOut->tx_crcDataFifo，将输入的带IPV4、UDP、BTH、AETH的512bit RC_ACK报文输出->out
		(3)maskedDataOut->tx_maskedDataFifo,将报文中IP头的Service Type，CheckSum，TTL，UDP的CheckSum以及BTH的reserved部分全部置为1->out
*/
template <int WIDTH, int DUMMY>
void mask_header_fields(stream<net_axis<WIDTH> >& input,
						stream<net_axis<WIDTH> >& dataOut,
						stream<net_axis<WIDTH> >& maskedDataOut)
{
#pragma HLS inline off
#pragma HLS pipeline II=1

	//mask containig all of these fields
	const static ap_uint<264> one_mask = 0;
	
	const static ap_uint<3> header_length = (264/WIDTH);
	static ap_uint<8> ai_wordCount = 0;

	net_axis<WIDTH> crcWord;
	net_axis<WIDTH> currWord;


	if (!input.empty())
	{

		input.read(currWord);        // 将带IPV4、UDP、BTH、AETH的512bit RC_ACK报文读取至crcWord中
		crcWord = currWord;

		// Service Type
		// std::cout << "********************************CRC generation********************************"<<std::endl;
		one_mask(15, 8) = 0xFF;
		// CheckSum
		one_mask(95, 80) = 0xFFFF;
		// TTL
		one_mask(71, 64) = 0xFF;

		// UDP checksum
		one_mask(223, 208) = 0xFFFF;
		// BTH Resv8a
		one_mask(263,256) = 0xFF;

		if (ai_wordCount < header_length)     
		{
			//std::cout << "applied mask: " << ai_wordCount << ", range: (" << std::dec << (int) ((ai_wordCount+1)*WIDTH)-1 << "," << (int) (ai_wordCount*WIDTH) << ")" << std::endl;
			crcWord.data = crcWord.data | one_mask(((ai_wordCount+1)*WIDTH)-1, ai_wordCount*WIDTH);
		}
		else if (ai_wordCount == header_length)  //进本函数处理
		{
			//std::cout << "aaapplied mask: " << ai_wordCount << ", range: (" << std::dec << (int) 423 << "," << (int) (ai_wordCount*WIDTH) << ")" << std::endl;
			// crcWord(263,0) = crcWord(263,0) | one_mask(263,0)
			crcWord.data((264%WIDTH)-1 , 0) = crcWord.data((264%WIDTH)-1 , 0) | one_mask(263, ai_wordCount*WIDTH);
			// std::cout << "Mask掉元数据的RC_ACK= ";
			// print(std::cout,crcWord);
			// std::cout << std::endl;
		}
		maskedDataOut.write(crcWord);   // 将被mask掉的数据写入maskedDataOut中，除了IP头的Service Type，CheckSum，TTL，UDP的CheckSum以及BTH的reserved部分修改为1
		dataOut.write(currWord);        // 将输入的512 bit ACK报文写入dataOut
		ai_wordCount++;
		if (currWord.last)
		{
			ai_wordCount = 0;
		}
	}
}


template <int WIDTH>
void drop_invalid_crc(	stream<net_axis<WIDTH> >& input,
						stream<ap_uint<32> >& crcFifo,
						stream<ap_uint<32> >& calcCrcFifo,
						stream<net_axis<WIDTH> >& output,
						ap_uint<32>& 	 regCrcDropPkgCount)
{
#pragma HLS inline off
#pragma HLS pipeline II=1

	enum fsmType {META, FWD, DROP};
	static fsmType state = META;
	static ap_uint<32> droppedPackts = 0;

	ap_uint<32> act_crc;
	ap_uint<32> calc_crc;
	net_axis<WIDTH> currWord;

	switch (state)
	{
		case META:
			if (!crcFifo.empty() && !calcCrcFifo.empty())
			{
				crcFifo.read(act_crc);
				calcCrcFifo.read(calc_crc);
				calc_crc = ~calc_crc;
				std::cout << std::hex << "actual crc: " << act_crc << " exp crc: " << calc_crc << std::endl;
				if (act_crc == calc_crc)
				{
					state = FWD;
				}
				else
				{
					droppedPackts++;
					regCrcDropPkgCount = droppedPackts;
					std::cout << "CRC PKG DROPED" << std::endl;
					state = FWD; ///TODO hack to avoid CRC drops
				}
			}
			break;
		case FWD:
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
		case DROP:
			if (!input.empty())
			{
				input.read(currWord);
				if (currWord.last)
				{
					state = META;
				}
			}
			break;
	} //switch
}

/*
	1. 函数功能：计算CRC，且计算奇数RC_ACK的CRC
	2. 参数解析：
		(1)input->tx_maskedDataFifo1->IP头的Service Type，CheckSum，TTL，UDP的CheckSum以及BTH的reserved部分全部置为1的RC_ACK报文->in
		(2)output->crcFifo1，计算得到的CRC值->out
*/
template <int WIDTH, int DUMMY>
void compute_crc32(	stream<net_axis<WIDTH> >& input,
					stream<ap_uint<32> >& output)
{
#pragma HLS inline off
#pragma HLS pipeline II=6

	enum crcFsmStateType {FIRST, SECOND};
	static crcFsmStateType crcState = FIRST;
	const unsigned int polynomial = 0xEDB88320; //Ethernet polynomial: 0x04C11DB7 reversed
	static unsigned int crc = 0xdebb20e3; // 8 bytes of 0xFF with init crc 0xFFFFFFFF
	//static unsigned int crc = 0xFFFFFFFF;
	static unsigned int mask = 0;

	static net_axis<WIDTH> currWord;

	switch (crcState)
	{
	case FIRST:
		if (!input.empty())
		{
			input.read(currWord);        
			for (int i = 0; i < (WIDTH/8/2); i++)  // 512/8/2 = 32
 			{
				// #pragma HLS UNROLL
				if (currWord.keep[i])   // 只处理了低32字节
				{
					crc ^= currWord.data(i*8+7, i*8);
					for (int j = 0; j < 8; j++)
					{
						// #pragma HLS UNROLL
						if(crc & 1)
						{
							crc = (crc >> 1) ^ (polynomial);
						}
						else
						{
							crc >>= 1; 
						}
					}
				}
			}
			crcState = SECOND;
		}
		break;
	case SECOND:
		for (int i = (WIDTH/8/2); i < (WIDTH/8); i++)  
		{
			// #pragma HLS UNROLL
			if (currWord.keep[i])  // 处理高32字节
			{
				crc ^= currWord.data(i*8+7, i*8);
				for (int j = 0; j < 8; j++)
				{
					// #pragma HLS UNROLL
					if(crc & 1)
					{
						crc = (crc >> 1) ^ (polynomial);
					}
					else
					{
						crc >>= 1; 
					}
				}
			}
		}
		if (currWord.last)
		{
			output.write(crc);
			std::cout << "CRC["<< DUMMY << "]: "<< std::hex << ~crc << std::endl;
			crc = 0xdebb20e3;
			mask = 0;
		}
		crcState = FIRST;
		break;
	} //switch

}


//packets are multiple of 4 bytes, crc is 4 bytes
/*
	1. 函数功能：在RC_ACK报文中插入计算好的CRC
	2. 参数解析：
		(1)crcIn->crcFifo,经过计算得到的CRC->in
		(2)input->tx_crcDataFifo,输入的带IPV4、UDP、BTH、AETH的512bit RC_ACK报文->in
		(3)output->m_axis_tx_data,插入CRC之后的RC_ACK->out
*/
template <int WIDTH>
void insert_icrc(
#ifndef DISABLE_CRC_CHECK
					stream<ap_uint<32> >& crcIn,
#endif
					stream<net_axis<WIDTH> >& input,
					stream<net_axis<WIDTH> >& output)
{
#pragma HLS inline off
#pragma HLS pipeline II=1

#ifndef DISABLE_CRC_CHECK
	enum fsmState {CRC, FWD, POST};
	static fsmState ii_state = CRC;    // 初始状态为CRC
#else
	enum fsmState {FWD, POST};
	static fsmState ii_state = FWD;
#endif

	static ap_uint<32> crc = 0xdeadbeef;  

	net_axis<WIDTH> currWord;
	net_axis<WIDTH> sendWord;

	switch(ii_state)
	{
#ifndef DISABLE_CRC_CHECK
	case CRC:
		if (!crcIn.empty())      // 如果计算得到了CRC
		{
			crcIn.read(crc);     // 直接把计算得到的CRC写入crc
			crc = ~crc;          // crc需要取反
			ii_state = FWD;      // 状态跳转至FWD
		}
		break;
#endif
	case FWD:
		if (!input.empty())
		{
			input.read(currWord);
			if (currWord.last)
			{
				//Check if word is full
				if (currWord.keep[(WIDTH/8)-1] == 1)  // 
				{
					currWord.last = 0;
					ii_state = POST;
				}
				else   // 将CRC嵌入至RC_ACK报文中
				{
#ifndef DISABLE_CRC_CHECK
					ii_state = CRC;
#endif
					ap_uint<64> keep = currWord.keep; //this is required to make the case statement work for all widths
					switch(keep)
					{
					case 0xF:
						currWord.data(63, 32) = crc;
						currWord.keep(7,4) = 0xF;
						break;
					case 0xFF:
						currWord.data(95, 64) = crc;
						currWord.keep(11,8) = 0xF;
						break;
					case 0xFFF:
						currWord.data(127, 96) = crc;
						currWord.keep(15,12) = 0xF;
						break;
					case 0xFFFF:
						currWord.data(159, 128) = crc;
						currWord.keep(19,16) = 0xF;
						break;
					case 0xFFFFF:
						currWord.data(191, 160) = crc;
						currWord.keep(23,20) = 0xF;
						break;
					case 0xFFFFFF:
						currWord.data(223, 192) = crc;
						currWord.keep(27,24) = 0xF;
						break;
					case 0xFFFFFFF:
						currWord.data(255, 224) = crc;
						currWord.keep(31,28) = 0xF;
						break;
					case 0xFFFFFFFF:
						currWord.data(287, 256) = crc;
						currWord.keep(35,32) = 0xF;
						break;
					case 0xFFFFFFFFF:
						currWord.data(319, 288) = crc;
						currWord.keep(39,36) = 0xF;
						break;
					case 0xFFFFFFFFFF:
						currWord.data(351, 320) = crc;
						currWord.keep(43,40) = 0xF;
						break;
					case 0xFFFFFFFFFFF:
						currWord.data(383, 352) = crc;
						currWord.keep(47,44) = 0xF;
						break;
					case 0xFFFFFFFFFFFF:
						currWord.data(415, 384) = crc;
						currWord.keep(51,48) = 0xF;
						break;
					case 0xFFFFFFFFFFFFF:
						currWord.data(447, 416) = crc;
						currWord.keep(55,52) = 0xF;
						break;
					case 0xFFFFFFFFFFFFFF:
						currWord.data(479, 448) = crc;
						currWord.keep(59,56) = 0xF;
						break;
					case 0xFFFFFFFFFFFFFFF:
						currWord.data(511, 480) = crc;
						currWord.keep(63,60) = 0xF;
						break;
					//case 0xFFFFFFFF:
						//TODO should not be reached
						//break;
					} //switch
				} //keep
			} //last
			output.write(currWord);
		}
		break;
	case POST:
		sendWord.data(31, 0) = crc;
		sendWord.data(WIDTH-1, 32) = 0;
		sendWord.keep(3, 0) = 0xF;
		sendWord.keep((WIDTH/8)-1, 4) = 0;
		sendWord.last = 1;
		output.write(sendWord);
#ifndef DISABLE_CRC_CHECK
		ii_state = CRC;
#else
		ii_state = FWD;
#endif
		break;
	} //switch
}
/*
	1. 函数功能：用于分流，假设来了多个RC ACK packet，则第奇数个packet的tx_maskedDataFifo直接通过tx_maskedDataFifo1输出，第偶数个tx_maskedDataFifo通过tx_maskedDataFifo2输出
	2. 参数解析：
		(1)in->tx_maskedDataFifo,需要被mask掉的元数据，除了IP头的Service Type，CheckSum，TTL，UDP的CheckSum以及BTH的reserved部分为1，其余均为0->in
		(2)out1->tx_maskedDataFifo1，假设来了第1/3/5/7...个RC ACK packet，则tx_maskedDataFifo1=tx_maskedDataFifo->out
		(3)out2->tx_maskedDataFifo2，假设来了第2/4/6/8...个RC ACK packet，则tx_maskedDataFifo2=tx_maskedDataFifo->out
*/
template <int WIDTH, int DUMMY>
void round_robin_arbiter(stream<net_axis<WIDTH> >& in,
						stream<net_axis<WIDTH> >& out1,
						stream<net_axis<WIDTH> >& out2)
{
#pragma HLS inline off
#pragma HLS pipeline II=1

	static bool one = true;  
	net_axis<WIDTH> currWord;

	if (!in.empty())
	{
		in.read(currWord);     
		if (one) 
		{
			out1.write(currWord);
		}
		else
		{
			out2.write(currWord);
		}
		if (currWord.last)     // 如果是最后一个packet，则将one设置为!one，也就是对输入的packet进行分流，
		{
			one = !one;
		}
	}
}

/*
	1. 函数功能：
	2. 参数解析：
		(1)in1->crcFifo1,奇数RC_ACK生成的CRC->in
		(2)in2->crcFifo2,偶数RC_ACK生成的CRC->in
		(3)out->crcFifo，输出CRC，奇数时=crcFifo1，偶数时=crcFifo2->out
*/
template <int DUMMY>
void round_robin_merger(stream<ap_uint<32> >& in1,
						stream<ap_uint<32> >& in2,
						stream<ap_uint<32> >& out)
{
#pragma HLS inline off
#pragma HLS pipeline II=1

	static bool one = true;

	if (one)
	{
		if (!in1.empty())
		{
			out.write(in1.read());
			one = !one;
		}
	}
	else
	{
		if (!in2.empty())
		{
			out.write(in2.read());
			one = !one;
		}
	}
}

template <int WIDTH>
void rocev2(hls::stream<net_axis<WIDTH> >&	s_axis_rx_data,                    // RX Path上，输入的512bit数据段->in

				hls::stream<txMeta>&	s_axis_tx_meta,                        // TX Path，接受来自主控端的元数据->none
				hls::stream<net_axis<WIDTH> >&	s_axis_tx_data,                // TX Path，接受来自主控端要发送的数据->none
				hls::stream<net_axis<WIDTH> >&	m_axis_tx_data,                // RX_ACK路径，带CRC的RC_ACK报文->out
				//Memory
				hls::stream<routedMemCmd>&		m_axis_mem_write_cmd,          // RX路径上，本端作为responder端从报文中解析出的内存写指令，即根据对端发来的RETH包，拆分出要写入的虚拟地址，payload长度以及路由方式：DMA，from rx_eth_fsm->out
				hls::stream<routedMemCmd>&		m_axis_mem_read_cmd,           // RX路径上，本端作为responder端从报文中解析出的内存读指令，没用到->none 
				hls::stream<routed_net_axis<WIDTH> >&	m_axis_mem_write_data, // RX路径上，本端作为responder端从报文中解析出的要往内存中写入的数据，即要往memory中写入的内容，针对WRITE_ONLY和WRITE_FIRST操作，m_axis_mem_write_data存储的是丢掉IB头和RETH头的报文->out   
				hls::stream<net_axis<WIDTH> >&	s_axis_mem_read_data,          // RX路径上，本端作为responder端从报文中解析出的要读取的内存中的数据，没用到->none 

				//Interface
				hls::stream<qpContext>&	s_axis_qp_interface,                   // QP Context的一些信息，包含QP状态、QPN、QP Remote和Local PSN、r_key和本端address
				hls::stream<ifConnReq>&	s_axis_qp_conn_interface,              // 双方connection的一些信息，包含本段QPN、对端QPN、对端IP地址和对端UDP端口 

				//pointer chasing
#if POINTER_CHASING_EN
				hls::stream<ptrChaseMeta>&	m_axis_rx_pcmeta,
				hls::stream<ptrChaseMeta>&	s_axis_tx_pcmeta,
#endif

				ap_uint<128>		local_ip_address,                          // 本地IP地址

				//Debug output
				ap_uint<32>& 	 regCrcDropPkgCount,                           // 被drop掉的包的数量    
				ap_uint<32>& 	 regInvalidPsnDropCount)                       // 被认为是Invalid的包的数量
{
#pragma HLS INLINE
#pragma region 
	//metadata fifos
	static stream<ipUdpMeta>	rx_ipUdpMetaFifo("rx_ipUdpMetaFifo");
	static stream<ipUdpMeta>	tx_ipUdpMetaFifo("tx_ipUdpMetaFifo");
	#pragma HLS STREAM depth=8 variable=rx_ipUdpMetaFifo
	#pragma HLS STREAM depth=2 variable=tx_ipUdpMetaFifo

	//IP
	static stream<net_axis<WIDTH> >		rx_crc2ipFifo("rx_crc2ipFifo");
	static stream<net_axis<WIDTH> >		rx_udp2ibFifo("rx_udp2ibFifo");
	static stream<net_axis<WIDTH> >		tx_ib2udpFifo("tx_ib2udpFifo");
	static stream<net_axis<WIDTH> >		tx_ip2crcFifo("tx_ip2crcFifo");
	#pragma HLS STREAM depth=2 variable=rx_crc2ipFifo
	#pragma HLS STREAM depth=2 variable=rx_udp2ibFifo
	#pragma HLS STREAM depth=2 variable=tx_ib2udpFifo
	#pragma HLS STREAM depth=2 variable=tx_ip2crcFifo

	static stream<ipMeta>	rx_ip2udpMetaFifo("rx_ip2udpMetaFifo");
	static stream<net_axis<WIDTH> >	rx_ip2udpFifo("rx_ip2udpFifo");
	//static stream<net_axis<WIDTH> >	rx_ip2udpFifo("rx_ip2udpFifo");
	static stream<ipMeta>	tx_udp2ipMetaFifo("tx_udp2ipMetaFifo");
	static stream<net_axis<WIDTH> >	tx_udp2ipFifo("tx_udp2ipFifo");
	#pragma HLS STREAM depth=2 variable=rx_ip2udpMetaFifo
	#pragma HLS STREAM depth=2 variable=rx_ip2udpFifo
	#pragma HLS STREAM depth=2 variable=tx_udp2ipMetaFifo
	#pragma HLS STREAM depth=2 variable=tx_udp2ipFifo
#pragma endregion
	/*
	 * IPv6 & UDP
	 */
#if IP_VERSION == 6
	ipv6(	rx_crc2ipFifo,
			rx_ip2udpMetaFifo,
			rx_ip2udpFifo,
			tx_udp2ipMetaFifo,
			tx_udp2ipFifo,
			tx_ip2crcFifo,
			local_ip_address);

	/*
	 * IPv4 & UDP
	 */
#else
	// extract_icrc(s_axis_rx_data, rx_crc2ipFifo);这个函数中，对rx_crc2ipFifo进行了赋值，而在ipv4函数中，如果rx_crc2ipFifo没有被赋值，则不会产生数据输出，而被ip连带着，UDP也不会有数据输出
	// 因此在DATA_WIDTH=512的情况下，在test_rocev2.cpp中，只有第二个for循环执行了四边，才会有s_asix_rx_data，也只有在第四遍for循环时，才会给rx_crc2ipFifo赋值，因此只有在第五遍for循环时，才能开始执行ipv4,而可能第十遍for循环的时候，才能到udp开始执行
	ipv4<WIDTH>(	rx_crc2ipFifo,          // RX Path，输入解析完CRC的512bit数据段
			rx_ip2udpMetaFifo,              // RX Path，输出IPV4的元数据,包括IPV4的源IP地址与IPV4 header+IPV4数据包的长度
			rx_ip2udpFifo,                  // RX Path，输出拆解掉IPV4头的数据包
			tx_udp2ipMetaFifo,              // RX_ACK Path，IP用到的元数据，包含remote_ip_address,与加上UDP头后ACK报文的有效长度即28字节->in
			tx_udp2ipFifo,                  // RX_ACK Path，返回512bit带UDP头的RC_ACK报文->in
			tx_ip2crcFifo,                  // RX_ACK Path，存储带IPV4头的512bit RC_ACK报文，一共20+8+12+4有效字节->out   
			local_ip_address(127,96),       // 输入数据，本地IP地址
			UDP_PROTOCOL);                  // 
	


#endif

	udp<WIDTH>(rx_ip2udpMetaFifo,           // RX Path，经过ipv4解析后的IP元数据,包括IPV4的源IP地址与IPV4 header+IPV4数据包的长度
			rx_ip2udpFifo,                  // RX Path，经过ipv4解析后的拆解掉IPV4头的UDP数据包
		rx_ipUdpMetaFifo,					// RX Path，将IP与UDP的元数据进行整合，包含将IP的源地址、UDP的对端port、UDP的本端port以及UDP头+UDP报文的长度
		rx_udp2ibFifo,                      // RX Path，经过ipv4和udp后被拆掉IPV4头和UDP头的报文，此时就只剩IB Transport层的内容了
		tx_ipUdpMetaFifo,                   // RX Path，ib_transport_protocol回ACK时包含的元数据，即继续下传至UDP/IP的元数据，包括remote_ip_address，remote_udp_port,RDMA_DEFAULT_PORT,len(BTH+AETH+ICRC=12+4+4=20字节)
		tx_ib2udpFifo,                      // RX_ACK Path，返回的512bit ACK Packet，其中前12字节为BTH，13-16字节为AETH
		tx_udp2ipMetaFifo,                  // RX_ACK Path，IP用到的元数据，包含remote_ip_address,与加上UDP头后ACK报文的有效长度即28字节->out
		tx_udp2ipFifo,                      // RX_ACK Path，返回512bit带UDP头的RC_ACK报文->out
		local_ip_address,                   // 本地的IP地址
		RDMA_DEFAULT_PORT);                 // 默认的本端的UDP Port


	/*
	 * IB PROTOCOL
	 */
	ib_transport_protocol<WIDTH>(		rx_ipUdpMetaFifo,  // RX Path上，接收来自IP/UDP等IP核中发送来的元数据，将IP与UDP的元数据进行整合，包含IP的源地址、UDP的对端port、UDP的本端port以及UDP头+UDP报文的长度->in
								rx_udp2ibFifo,             // RX Path上，接收经过ipv4和udp后被拆掉IPV4头和UDP头的报文，此时就只剩IB Transport层的内容了，数据大小为512bit->in
								//m_axis_rx_data,
								s_axis_tx_meta,            // TX Path，接受来自主控端的元数据->none
								s_axis_tx_data,            // TX Path，接受来自主控端要发送的数据->none
								tx_ipUdpMetaFifo,          // RX_ACK路径，返回ACK时包含的元数据，即继续下传至UDP/IP的元数据，包括remote_ip_address，remote_udp_port,RDMA_DEFAULT_PORT,len(BTH+AETH+ICRC=12+4+4=20字节)->out
								tx_ib2udpFifo,             // RX_ACK路径，返回ACK，存储的是512bit ACK Packet，其中前12字节为BTH，13-16字节为AETH，发送给UDP函数->out
								m_axis_mem_write_cmd,      // RX路径上，本端作为responder端从报文中解析出的内存写指令，即根据对端发来的RETH包，拆分出要写入的虚拟地址，payload长度以及路由方式：DMA，from rx_eth_fsm->out
								m_axis_mem_read_cmd,       // RX路径上，本端作为responder端从报文中解析出的内存读指令，没用到->none 
								//s_axis_mem_write_status,
								m_axis_mem_write_data,     // RX路径上，本端作为responder端从报文中解析出的要往内存中写入的数据，即要往memory中写入的内容，针对WRITE_ONLY和WRITE_FIRST操作，m_axis_mem_write_data存储的是丢掉IB头和RETH头的报文->out   
								s_axis_mem_read_data,      // RX路径上，本端作为responder端从报文中解析出的要读取的内存中的数据，没用到->none 
								s_axis_qp_interface,       // QP Context的一些信息，包含QP状态、QPN、QP Remote和Local PSN、r_key和本端address
								s_axis_qp_conn_interface,  // 双方connection的一些信息，包含本段QPN、对端QPN、对端IP地址和对端UDP端口
#if POINTER_CHASING_EN
								m_axis_rx_pcmeta,
								s_axis_tx_pcmeta,
#endif
								regInvalidPsnDropCount);
	
	
	/*
	 * Check ICRC of incoming packets
	 */
#ifndef DISABLE_CRC_CHECK
	static stream<net_axis<WIDTH> > rx_dataFifo("rx_dataFifo");
	static stream<net_axis<WIDTH> > rx_maskedDataFifo("rx_maskedDataFifo");
	static stream<net_axis<WIDTH> > rx_maskedDataFifo1("rx_maskedDataFifo1");
	static stream<net_axis<WIDTH> > rx_maskedDataFifo2("rx_maskedDataFifo2");
	static stream<net_axis<WIDTH> > rx_crcDataFifo("rx_crcDataFifo");
	static stream<ap_uint<32> > rx_crcFifo("rx_crcFifo");
	static stream<ap_uint<32> > rx_calcCrcFifo("rx_calcCrcFifo");
	static stream<ap_uint<32> > rx_calcCrcFifo1("rx_calcCrcFifo1");
	static stream<ap_uint<32> > rx_calcCrcFifo2("rx_calcCrcFifo2");
	#pragma HLS STREAM depth=4 variable=rx_dataFifo
	#pragma HLS STREAM depth=4 variable=rx_maskedDataFifo
	#pragma HLS STREAM depth=192 variable=rx_maskedDataFifo1 //TODO maybe increase for better TP
	#pragma HLS STREAM depth=192 variable=rx_maskedDataFifo2
	#pragma HLS STREAM depth=512 variable=rx_crcDataFifo // 1536 bytes, 48 for WIDTH = 256
	#pragma HLS STREAM depth=32 variable=rx_crcFifo
	 
	#pragma HLS STREAM depth=2 variable=rx_calcCrcFifo1
	#pragma HLS STREAM depth=2 variable=rx_calcCrcFifo2
#endif

#ifndef DISABLE_CRC_CHECK
	regCrcDropPkgCount = 0;
	/*
		1. 函数功能：抓出IP报文中的CRC校验值，并将输入的IP报文原封不动地返回
		2. 参数解析：
			（1)s_axis_rx_data->input，输入的512bit数据段
			（2)rx_crc2ipFifo，输出抓取出CRC后的512bit数据段
	*/
// if(!s_axis_rx_data.empty()) {
// 		net_axis<512> currWord;
// 		s_axis_rx_data.read(currWord);
// 		std::cout<<"11111111111111111111:    "<<currWord.data<<std::endl;
// 		std::cout<<"11111111111111111111:    "<<currWord.keep<<std::endl;
// 		std::cout<<"11111111111111111111:    "<<currWord.last<<std::endl;
// 	}
	extract_icrc(s_axis_rx_data, rx_crc2ipFifo);  // 函数的作用就是将crc拆出来，同时每处理完512bit的数据就在下一个始终周期将已处理完的512bit数据传递给rx_crc2ipFifo，继续进行IP数据的处理
	
//	net_axis<WIDTH> rx_crc2ip;
//	rx_crc2ipFifo.read(rx_crc2ip);
//        std::cout << "[rocev2] crc2ip: ";
//        print(std::cout, rx_crc2ip);
//        std::cout << std::endl;

#else
	extract_icrc(s_axis_rx_data, rx_dataFifo, rx_crcFifo);
	mask_header_fields<1>(rx_dataFifo, rx_crcDataFifo, rx_maskedDataFifo);
	round_robin_arbiter<1>(rx_maskedDataFifo, rx_maskedDataFifo1, rx_maskedDataFifo2);
	compute_crc32<1>(rx_maskedDataFifo1, rx_calcCrcFifo1);
	compute_crc32<2>(rx_maskedDataFifo2, rx_calcCrcFifo2);
	round_robin_merger<1>(rx_calcCrcFifo1, rx_calcCrcFifo2, rx_calcCrcFifo);
	drop_invalid_crc(rx_crcDataFifo, rx_crcFifo, rx_calcCrcFifo, rx_crc2ipFifo, regCrcDropPkgCount);
#endif

	/*
	 * Append ICRC after IPv6
	 */
#ifndef DISABLE_CRC_CHECK
	static stream<net_axis<WIDTH> > tx_maskedDataFifo("tx_maskedDataFifo");
	static stream<net_axis<WIDTH> > tx_maskedDataFifo1("tx_maskedDataFifo1");
	static stream<net_axis<WIDTH> > tx_maskedDataFifo2("tx_maskedDataFifo2");
	static stream<net_axis<WIDTH> > tx_crcDataFifo("tx_crcDataFifo");
	static stream<ap_uint<32> > crcFifo("crcFifo");
	static stream<ap_uint<32> > crcFifo1("crcFifo1");
	static stream<ap_uint<32> > crcFifo2("crcFifo2");
	#pragma HLS STREAM depth=4 variable=tx_maskedDataFifo
	#pragma HLS STREAM depth=128 variable=tx_maskedDataFifo1 //increase size for better TP
	#pragma HLS STREAM depth=128 variable=tx_maskedDataFifo2
	#pragma HLS STREAM depth=384 variable=tx_crcDataFifo // 1536 bytes, 48 for WIDTH = 256
	#pragma HLS STREAM depth=2 variable=crcFifo
	#pragma HLS STREAM depth=2 variable=crcFifo1
	#pragma HLS STREAM depth=2 variable=crcFifo2
#endif

#ifdef DISABLE_CRC_CHECK
	/*
		1. 函数功能：给RC_ACK最后面添加CRC
		2. 参数分析：
			(1)tx_ip2crcFifo->存储带IPV4、UDP、BTH、AETH的512bit RC_ACK报文，一共20+8+12+4有效字节->in
			(2)m_axis_tx_data->带CRC的RC_ACK报文->out
	*/
	// insert_icrc(tx_ip2crcFifo, m_axis_tx_data);
#else
	/*
		1. 函数功能：
		2. 参数解析：
			(1)input->tx_ip2crcFifo,存储带IPV4、UDP、BTH、AETH的512bit RC_ACK报文，一共20+8+12+4有效字节->in
			(2)dataOut->tx_crcDataFifo，将输入的带IPV4、UDP、BTH、AETH的512bit RC_ACK报文输出->out
			(3)maskedDataOut->tx_maskedDataFifo,将报文中IP头的Service Type，CheckSum，TTL，UDP的CheckSum以及BTH的reserved部分全部置为1->out
	*/
	mask_header_fields<WIDTH,2>(tx_ip2crcFifo, tx_crcDataFifo, tx_maskedDataFifo);
	/*
		1. 函数功能：用于分流，假设来了多个RC ACK packet，则第奇数个packet的tx_maskedDataFifo直接通过tx_maskedDataFifo1输出，第偶数个tx_maskedDataFifo通过tx_maskedDataFifo2输出
		2. 参数解析：
			(1)in->tx_maskedDataFifo,需要被mask掉的元数据，除了IP头的Service Type，CheckSum，TTL，UDP的CheckSum以及BTH的reserved部分为1，其余均为0->in
			(2)out1->tx_maskedDataFifo1，假设来了第1/3/5/7...个RC ACK packet，则tx_maskedDataFifo1=tx_maskedDataFifo->out
			(3)out2->tx_maskedDataFifo2，假设来了第2/4/6/8...个RC ACK packet，则tx_maskedDataFifo2=tx_maskedDataFifo->out
	*/
	// round_robin_arbiter<WIDTH,2>(tx_maskedDataFifo, tx_maskedDataFifo1, tx_maskedDataFifo2);
	/*
		1. 函数功能：计算CRC，且计算奇数RC_ACK的CRC
		2. 参数解析：
			(1)input->tx_maskedDataFifo1->IP头的Service Type，CheckSum，TTL，UDP的CheckSum以及BTH的reserved部分全部置为1的RC_ACK报文->in
			(2)output->crcFifo1，计算得到的CRC值->out
	*/
	compute_crc32<WIDTH,3>(tx_maskedDataFifo, crcFifo1);
	/*
		1. 函数功能：计算CRC，且计算偶数RC_ACK的CRC
		2. 参数解析：
			(1)input->tx_maskedDataFifo1->IP头的Service Type，CheckSum，TTL，UDP的CheckSum以及BTH的reserved部分全部置为1的RC_ACK报文->in
			(2)output->crcFifo1，计算得到的CRC值->out
	*/
	// compute_crc32<WIDTH,4>(tx_maskedDataFifo2, crcFifo2);
	/*
		1. 函数功能：CRC分流
		2. 参数解析：
			(1)in1->crcFifo1,奇数RC_ACK生成的CRC->in
			(2)in2->crcFifo2,偶数RC_ACK生成的CRC->in
			(3)out->crcFifo，输出CRC，奇数时=crcFifo1，偶数时=crcFifo2->out
	*/
	// round_robin_merger<2>(crcFifo1, crcFifo2, crcFifo);
	/*
		1. 函数功能：在RC_ACK报文中插入计算好的CRC
		2. 参数解析：
			(1)crcIn->crcFifo,经过计算得到的CRC->in
			(2)input->tx_crcDataFifo,输入的带IPV4、UDP、BTH、AETH的512bit RC_ACK报文->in
			(3)output->m_axis_tx_data,插入CRC之后的RC_ACK->out
	*/
	insert_icrc(crcFifo1, tx_crcDataFifo, m_axis_tx_data);
	// if(!m_axis_tx_data.empty())
	// {
	// 	net_axis<512> currWord;
	// 	m_axis_tx_data.read(currWord);
	// 	std::cout<<"添加CRC后的ACK报文为： ";
	// 	print(std::cout,currWord);
	// 	std::cout<<std::endl;
	// 	std::cout << "********************************CRC ending********************************"<<std::endl;
	// }
	

#endif
}

void rocev2_top(	
				stream<net_axis<DATA_WIDTH> >&	s_axis_rx_data,     // 上游下来的网络数据包
				//stream<net_axis<DATA_WIDTH> >&	m_axis_rx_data,

				stream<txMeta>&	s_axis_tx_meta,
				stream<net_axis<DATA_WIDTH> >&	s_axis_tx_data,
				stream<net_axis<DATA_WIDTH> >&	m_axis_tx_data,
				//Memory
				stream<routedMemCmd>&		m_axis_mem_write_cmd,
				stream<routedMemCmd>&		m_axis_mem_read_cmd,
				//stream<mmStatus>&	s_axis_mem_write_status,
				stream<routed_net_axis<DATA_WIDTH> >&	m_axis_mem_write_data,
				stream<net_axis<DATA_WIDTH> >&	s_axis_mem_read_data,

				//Interface
				stream<qpContext>&	s_axis_qp_interface,            // QP的一些控制信息，比如说QPN等信息
				stream<ifConnReq>&	s_axis_qp_conn_interface,       // 双方交换的一些信息，比如virtual address等 

				//pointer chasing
#if POINTER_CHASING_EN
				stream<ptrChaseMeta>&	m_axis_rx_pcmeta,
				stream<ptrChaseMeta>&	s_axis_tx_pcmeta,
#endif

				ap_uint<128>		local_ip_address,               // 本地IP地址

				//Debug output
				ap_uint<32>& 	 regCrcDropPkgCount,
				ap_uint<32>& 	 regInvalidPsnDropCount)
{
#pragma HLS DATAFLOW disable_start_propagation
#pragma HLS INTERFACE ap_ctrl_none port=return

	//DATA
	#pragma HLS INTERFACE axis register port=s_axis_rx_data
	#pragma HLS INTERFACE axis register port=s_axis_tx_data
	#pragma HLS INTERFACE axis register port=s_axis_tx_data
	#pragma HLS INTERFACE axis register port=m_axis_tx_meta
	#pragma HLS INTERFACE axis register port=m_axis_tx_data
	#pragma HLS DATA_PACK variable=s_axis_tx_meta

	//MEMORY
	#pragma HLS INTERFACE axis register port=m_axis_mem_write_cmd
	#pragma HLS INTERFACE axis register port=m_axis_mem_read_cmd
	#pragma HLS INTERFACE axis register port=m_axis_mem_write_data
	#pragma HLS INTERFACE axis register port=s_axis_mem_read_data

	//CONTROL
	#pragma HLS INTERFACE axis register port=s_axis_qp_interface
	#pragma HLS INTERFACE axis register port=s_axis_qp_conn_interface
	#pragma HLS DATA_PACK variable=s_axis_qp_interface
	#pragma HLS DATA_PACK variable=s_axis_qp_conn_interface

	//Pointer chasing
#if POINTER_CHASING_EN
	#pragma HLS INTERFACE axis register port=m_axis_rx_pcmeta
	#pragma HLS INTERFACE axis register port=s_axis_tx_pcmeta
	#pragma HLS DATA_PACK variable=m_axis_rx_pcmeta
	#pragma HLS DATA_PACK variable=s_axis_tx_pcmeta
#endif

	#pragma HLS INTERFACE ap_none register port=local_ip_address

	//DEBUG
	#pragma HLS INTERFACE ap_vld port=regCrcDropPkgCount

   rocev2<DATA_WIDTH>(s_axis_rx_data,
								s_axis_tx_meta,
								s_axis_tx_data,
								m_axis_tx_data,
								m_axis_mem_write_cmd,
								m_axis_mem_read_cmd,
								m_axis_mem_write_data,
								s_axis_mem_read_data,
								s_axis_qp_interface,
								s_axis_qp_conn_interface,
								local_ip_address,
								regCrcDropPkgCount,
								regInvalidPsnDropCount);
}
