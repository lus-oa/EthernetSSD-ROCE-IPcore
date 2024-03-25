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
#pragma once

#include <hls_stream.h>
#include "ap_int.h"
#include <stdint.h>
#include <iostream>
#include <fstream>
#include <iomanip>

//Adaptation of ap_axiu<>

/*template <int D>
struct axis
{
	ap_uint<D>		data;
	ap_uint<D/8>	keep;
	ap_uint<1>		last;
	axis() {}
	axis(ap_uint<D> data, ap_uint<D/8> keep, ap_uint<1> last)
		:data(data), keep(keep), last(last) {}
};*/

template <int D>
struct net_axis
{
	ap_uint<D>		data;
	ap_uint<D/8>	keep;
	ap_uint<1>		last;
	net_axis() {}
	net_axis(ap_uint<D> data, ap_uint<D/8> keep, ap_uint<1> last)
		:data(data), keep(keep), last(last) {}
};

template <int D, int R=1>
struct routed_net_axis
{
	ap_uint<D>		data;
	ap_uint<D/8>	keep;
	ap_uint<1>		last;
	ap_uint<R>		dest;
	routed_net_axis() {}
	routed_net_axis(net_axis<D> w, ap_uint<R> r)
		:data(w.data), keep(w.keep), last(w.last), dest(r) {}
};

template<int D>
ap_uint<D> reverse(const ap_uint<D>& w)
{
	ap_uint<D> temp;
	for (int i = 0; i < D/8; i++)
	{
		#pragma HLS UNROLL
		temp(i*8+7, i*8) = w(D-(i*8)-1, D-(i*8)-8);
	}
	return temp;
}

template<int D>
ap_uint<D> reverse_bits(const ap_uint<D>& w)
{
	ap_uint<D> temp;
	for (int i = 0; i < D; i++)
	{
		#pragma HLS UNROLL
		temp[i] = w[D-i-1];
	}
	return temp;
}

template<int D>
bool scan(std::istream& inputFile, ap_uint<D>& data)
{
	uint16_t temp;
	for (int i = 0; i < D/8; i++)
	{
		if (inputFile >> std::hex >> temp)
		{
			data(i*8+7, i*8) = temp;
		}
		else
		{
			//std::cerr << "[ERROR]: could not scan input" << std::endl;
			return false;
		}
	}
	return (bool) inputFile;
}

template<int D>  // D=128
bool scan(std::istream& inputFile, net_axis<D>& word)  // D的大小由word决定,传进来的参数显示D=128
{
	uint16_t temp;
	uint32_t keepTemp;
	uint16_t lastTemp;
	// input file全都读进来了
	for (int i = 0; i < D/8; i++)  // 循环16次，每次读进来一个字节
	{	
		/************第1轮*************/
		// temp = 0x45 = 0100 0101
		// word[7:0]   = 0100 0101
		/************第2轮*************/
		// temp = 0x00 = 0000 0000
		// word[15:8]  = 0000 0000     word[15:0] = 0000 0000 0100 0101 = 0x0045
		/************第3轮*************/
		// temp = 0x00 = 0000 0000
		// word[23:16] = 0000 0000     word[23:0] = 0000 0000 0000 0000 0100 0101 = 0x00_00_45
		/************第4轮*************/
		// temp = 0x7c = 0111 1100
		// word[31:24] = 0111 1100     word[31:0] = 0111 1100 0000 0000 0000 0000 0100 0101 = 0x7c_00_00_45--->在内存中的存储顺序
		// 但是我打印word，出来的结果却是45 00 00 7c
		// 是这样的，整数类型默认采用本机字节顺序，在x86架构的计算机中，字节顺序是小端存储，即较低的字节被存储在内存的低地址处，较高的字节存储在内存的高地址处，因此打印0x7c000045时，看到的实际上时小端字节存储的内存中的值，字节顺序从低到高分别是45 00 00 7c
		// 在进行数据打印的时候，则从低字节处开始打印，也就是先打印45，再打印00，再打印00，再打印00
		if (inputFile >> std::hex >> temp)  // 从输入流中读取数据并将其存储在变量temp中,是一个输入流操纵符（manipulator），它指定了输入流的进制数表示方式为十六进制。这意味着后续从输入流中读取的数据会被解释为十六进制数。
		{
			word.data(i*8+7, i*8) = temp;   //每次向word中写入1字节的数据，这个for循环结束，这一行的前16个字节也就写入了data中
		}
		else
		{
			//std::cerr << "[ERROR]: could not scan input" << std::endl;
			return false;
		}
	}
	// /*************************************************/
	// std::cout << "word= ";
	// print(std::cout,word.data);
	// std::cout << std::endl;
	/*************************************************/
	inputFile >> keepTemp;  // 将16字节数据后的ffff写入keepTemp中
	inputFile >> lastTemp;  // 将16字节数据以及ffff写入keepTemp中后，再将lastTemp标志位写入lastTemp作为最后标志位，标志着写完了
	/*************************************************/
	// std::string line;
	// while(std::getline(inputFile,line))
	// {
	// 	std::cout << line << std::endl;
	// }
	// std::cout << "word= ";
	// print(std::cout,word);
	// std::cout << "sizeof word= "<< sizeof(word)<<std::endl;
	// std::cout << "keeptemp= "<< keepTemp << std::endl;
	// std::cout << "lastTemp= "<< lastTemp << std::endl;
	/*************************************************/
	word.keep = keepTemp;  
	word.last = lastTemp;  
	//if (!inputFile)
	//	std::cerr << "[ERROR]: could not scan input" << std::endl;
	return (bool) inputFile;
}

template<int D>
bool scanLE(std::istream& inputFile, ap_uint<D>& data)
{
	uint16_t temp;
	for (int i = (D/8)-1; i >= 0; i--)
	{
		if (inputFile >> std::hex >> temp)
		{
			data(i*8+7, i*8) = temp;
		}
		else
		{
			//std::cerr << "[ERROR]: could not scan input" << std::endl;
			return false;
		}
	}
	return (bool) inputFile;
}

template<int D>
bool scanLE(std::istream& inputFile, net_axis<D>& word)
{
	uint16_t temp;
	uint32_t keepTemp;
	uint16_t lastTemp;
	for (int i = (D/8)-1; i >= 0; i--)
	{
		if (inputFile >> std::hex >> temp)
		{
			word.data(i*8+7, i*8) = temp;
		}
		else
		{
			//std::cerr << "[ERROR]: could not scan input" << std::endl;
			return false;
		}
	}
	inputFile >> keepTemp;
	inputFile >> lastTemp;
	word.keep = keepTemp;
	word.last = lastTemp;
	return (bool) inputFile;
}

template<int D>
void print(std::ostream& output, ap_uint<D> data)
{
	output << std::hex;
	output << std::setfill('0');
	for (int i = 0; i < D/8; i++)
	{
		output << std::noshowbase << std::setw(2) << (uint16_t) data(i*8+7, i*8) << " ";
	}
}

template<int D>
void print(std::ostream& output, net_axis<D>& word)
{
#ifndef __SYNTHESIS__
	output << std::hex;
	output << std::setfill('0');
	for (int i = 0; i < D/8; i++)
	{
		output << std::noshowbase << std::setw(2) << (uint16_t) word.data(i*8+7, i*8) << " ";
	}
	output << std::setw(D/8/4) << (uint64_t) word.keep << " ";
	output << std::setw(1) << (uint16_t)word.last;
#endif
}

template<int D>
void printLE(std::ostream& output, ap_uint<D>& data)
{
#ifndef __SYNTHESIS__
	output << std::hex;
	output << std::setfill('0') ;
	for (int i = (D/8)-1; i >= 0; i--)
	{
		output << std::noshowbase << std::setw(2) << (uint16_t) data(i*8+7, i*8) << " ";
	}
#endif
}

template<int D>
void printLE(std::ostream& output, net_axis<D>& word)
{
#ifndef __SYNTHESIS__
	output << std::hex;
	output << std::setfill('0') ;
	for (int i = (D/8)-1; i >= 0; i--)
	{
		output << std::noshowbase << std::setw(2) << (uint16_t) word.data(i*8+7, i*8) << " ";
	}
	output << std::setw(D/8/4) << (uint64_t) word.keep << " ";
	output << std::setw(1) << (uint16_t)word.last;
#endif
}

template<int D, int R>
void printLE(std::ostream& output, routed_net_axis<D, R>& word)
{
#ifndef __SYNTHESIS__
	output << std::hex;
	output << std::setfill('0') ;
	for (int i = (D/8)-1; i >= 0; i--)
	{
		output << std::noshowbase << std::setw(2) << (uint16_t) word.data(i*8+7, i*8) << " ";
	}
	output << std::setw(D/8/4) << (uint64_t) word.keep << " ";
	output << std::setw(1) << (uint16_t)word.last;
	output << std::setw(R) << " TDEST:" << (uint16_t)word.dest;
#endif
}
// 该函数被别的函数调用的时候，只要程序还在跑，count和net_axis被赋的值不会自动被清零，因为他们是静态变量
template <int W, int D, int DUMMY>  // W=128，D=4
void increaseStreamWidth(hls::stream<net_axis<W> >& input, hls::stream<net_axis<W*D> >&output)
{
#pragma HLS INLINE

	static int count = 0;

	static net_axis<W*D> temp;  // 定义一个net_axis类型的临时对象temp，temp里面的成员变量的位数由W*D决定

	if (!input.empty())
	{
		net_axis<W> currWord = input.read();  // 定义一个net_axis类型的临时对象currWord，用来暂存input的数据
		temp.data((W*count)+W-1, (W*count)) = currWord.data;  // temp.data(127,0) = currWord.data
		temp.keep(((W/8)*count+(W/8)-1), ((W/8)*count)) = currWord.keep;  // temp.keep(15,0) = currWord.keep
		temp.last = currWord.last;                            // temp.last = currWord.last

		count++;
		if (currWord.last || count == D)     // 如果是数据包里面最后一个数据 或者 count==4,即temp.data里面已经存满了512bit数据，才会将其赋予给output.data
		{
			output.write(temp);              // 将temp写到output里面
			count = 0;                       // count归零 
#ifndef __SYNTHESIS__
			temp.data = 0;                   // temp.data清零
#endif
			temp.keep = 0;                   // temp.keep清零
		}
	}
	// /*******************************************/
	// std::cout << "count= "<< count << std::endl;  // 打印当前count的值
	// std::cout << "temp.data= ";
	// print(std::cout,temp.data);                   // 打印当前temp的值
	// std::cout<<std::endl;
	// /*******************************************/

}

template <int W, int D, int DUMMY>
void reduceStreamWidth(hls::stream<net_axis<W> >& input, hls::stream<net_axis<W/D> >&output)
{
#pragma HLS INLINE

	enum fsmStateType {FIRST, SECOND};
	static fsmStateType fsmState = FIRST;
	static int count = 0;

	static net_axis<W> currWord;
	net_axis<W/D> temp;

	switch (fsmState)
	{
		case FIRST:
			if (!input.empty())
			{
				input.read(currWord);
				temp.data = currWord.data((W/D)-1, 0);
				temp.keep = currWord.keep(((W/D)/8)-1, 0);
				temp.last = (currWord.keep[(W/8)/D] == 0); //(currWord.keep((W/8)-1, (W/8)/2) == 0);
				output.write(temp);

				if (currWord.keep[(W/8)/D])
				{
					count = 1;
					fsmState = SECOND;
				}

				//shift word
				currWord.data(W-(W/D)-1, 0) = currWord.data(W-1, W/D);
				currWord.keep((W/8)-((W/8)/D)-1, 0) = currWord.keep((W/8)-1, (W/8)/D);
				currWord.keep((W/8)-1, (W/8)-((W/8)/D)) = 0;
			}
			break;
		case SECOND:
			temp.data = currWord.data((W/D)-1, 0);
			temp.keep = currWord.keep(((W/D)/8)-1, 0);
			if (count < D-1)
			{
				temp.last = (currWord.keep[(W/8)/D] == 0); //(currWord.keep((W/8)-1, (W/8)/2) == 0);
			}
			else
			{
				temp.last = currWord.last;
			}
			output.write(temp);
			//shift word
			currWord.data(W-(W/D)-1, 0) = currWord.data(W-1, W/D);
			currWord.keep((W/8)-((W/8)/D)-1, 0) = currWord.keep((W/8)-1, (W/8)/D);
			currWord.keep((W/8)-1, (W/8)-((W/8)/D)) = 0;


			count++;
			if (count == D || temp.last)
			{
				
				fsmState = FIRST;
			}
			break;
	}
}

template <int W, int DUMMY>
void convertStreamWidth(hls::stream<net_axis<W> >& input, hls::stream<net_axis<W> >&output)
{
#pragma HLS PIPELINE II=1
#pragma HLS INLINE off

	if (!input.empty())
	{
		output.write(input.read());
	}
}

template <int W, int DUMMY>
void convertStreamWidth(hls::stream<net_axis<W> >& input, hls::stream<net_axis<W*2> >&output)
{
#pragma HLS PIPELINE II=1
#pragma HLS INLINE off

	increaseStreamWidth<W,2,DUMMY>(input, output);
}

template <int W, int DUMMY>  //假设DATA_WIDTH=512，则会调用该函数，W=128
void convertStreamWidth(hls::stream<net_axis<W> >& input, hls::stream<net_axis<W*4> >&output)
{
#pragma HLS PIPELINE II=1
#pragma HLS INLINE off

	increaseStreamWidth<W,4,DUMMY>(input, output);
}

template <int W, int DUMMY>
void convertStreamWidth(hls::stream<net_axis<W> >& input, hls::stream<net_axis<W*8> >&output)
{
#pragma HLS PIPELINE II=1
#pragma HLS INLINE off

	increaseStreamWidth<W,8,DUMMY>(input, output);
}

template <int W, int DUMMY>
void convertStreamWidth(hls::stream<net_axis<W> >& input, hls::stream<net_axis<W/2> >&output)
{
#pragma HLS PIPELINE II=1
#pragma HLS INLINE off

	reduceStreamWidth<W,2,DUMMY>(input, output);
}

template <int W, int DUMMY>
void convertStreamWidth(hls::stream<net_axis<W> >& input, hls::stream<net_axis<W/4> >&output)
{
#pragma HLS PIPELINE II=1
#pragma HLS INLINE off

	reduceStreamWidth<W,4,DUMMY>(input, output);
}

template <int W, int DUMMY>
void convertStreamWidth(hls::stream<net_axis<W> >& input, hls::stream<net_axis<W/8> >&output)
{
#pragma HLS PIPELINE II=1
#pragma HLS INLINE off

	reduceStreamWidth<W,8,DUMMY>(input, output);
}


template <class T>
void assignDest(T& d, T& s) {}

template <>
void assignDest<routed_net_axis<64> >(routed_net_axis<64>& d, routed_net_axis<64>& s);
template <>
void assignDest<routed_net_axis<128> >(routed_net_axis<128>& d, routed_net_axis<128>& s);
template <>
void assignDest<routed_net_axis<256> >(routed_net_axis<256>& d, routed_net_axis<256>& s);
template <>
void assignDest<routed_net_axis<512> >(routed_net_axis<512>& d, routed_net_axis<512>& s);

// The 2nd template parameter is a hack to use this function multiple times
// offset->((BTH_SIZE%WIDTH)/8)= (96%512)/8 = 96/8 = 12->in
// input->解析出BTH后的input数据->in
// output->rx_shift2exhFifo
// T=net_axis<WIDTH>
// WIDTH=512
template <typename T, int W, int whatever>
void rshiftWordByOctet(	uint16_t offset,
						hls::stream<T>& input,
						hls::stream<T>& output)
{
#pragma HLS inline off
#pragma HLS pipeline II=1 //TODO this has a bug, the bug might come from how it is used

	enum fsmStateType {PKG, REMAINDER};          // 定义一个状态机，包含两种状态，PKG状态与REMAINDER状态
	static fsmStateType fsmState = PKG;          // 初始状态设置为PKG状态，即包处理状态
	static bool rs_firstWord = (offset != 0);    // 用于标记是否为第一个处理的数据包，初始值为 (offset != 0)成立，rs_firstWord为true
	static T prevWord;                           // 定义一个静态变量用于存储已经处理过的数据段

	T currWord;
	T sendWord;                                  // 定义要传出去的数据段
 
 	sendWord.last = 0;                              
	switch (fsmState)  
	{
	case PKG:                                    // 初始时进入PKG状态
		if (!input.empty())                      // 如果输入数据段不为空
		{
			
			input.read(currWord);                // 将输入数据段读取至currWord中
			if (!rs_firstWord)                   // 当第二个及以后的数据段进来时
			{
				if (offset == 0)                 // 512bit的数据段的话offset永远不为0
				{
					sendWord = currWord;
				}
				else
				{   
					// sendWord.data(415,0) = prevWord(511,96)
					// sendWord.data(511,416) = currWord(95,0)
					// 其实就是将BTH头移走，将完整的报文流出来
					sendWord.data((W-1)-(8*offset), 0) = prevWord.data((W-1), 8*offset);
					sendWord.data((W-1), W-(8*offset)) = currWord.data((8*offset)-1, 0);
					// sendWord.keep(51,0) = prevWord.keep(63,12)
					// sendWord.keep(63,52) = currWord(11,0)
					sendWord.keep((W/8-1)-offset, 0) = prevWord.keep((W/8-1), offset);
					sendWord.keep((W/8-1), (W/8)-offset) = currWord.keep(offset-1, 0);
					// 判断currWord.keep(64,12)是否全为0，因为低12byte用于填充上一个Send报文了，因此如果keep(64,12)位0的话，表明当前SendWord无法从下一个数据段中汲取到有效信息，因此该SendWord就是最后一个数据段
					sendWord.last = (currWord.keep((W/8-1), offset) == 0);
					//sendWord.dest = currWord.dest;未执行有效操作
					assignDest(sendWord, currWord);
				}//else offset
				output.write(sendWord);
			}

			prevWord = currWord;                // 将已处理的数据段存放至prvWord中 
			rs_firstWord = false;               // 第一个数据段处理时rs_firstWord为true，即不会进入上面的if语句，但是到这句时，rs_firstWord置为false，也就是下一个512bit数据段来了后，可以进入上面的if语句开始执行
			if (currWord.last)                  // 如果当前被处理的数据段是最后一格数据段
			{
				rs_firstWord = (offset != 0);   // rs_firstWord复位变为true，即下一个数据段就是新数据包的新的数据段
				//rs_writeRemainder = (sendWord.last == 0);
				if (!sendWord.last)             // 如果sendWord的last标志位未被置1，即当前数据包中可能有13及以上的byte是有效数据
				{ 
					fsmState = REMAINDER;       // 跳转至REMAINDER状态
				}
			}
			//}//else offset
		}
		break;
	case REMAINDER:
		sendWord.data((W-1)-(8*offset), 0) = prevWord.data((W-1), 8*offset);  // 当前SendWord必定是最后一个数据段，那就直接走数据复制就行
		sendWord.data((W-1), W-(8*offset)) = 0;
		sendWord.keep((W/8-1)-offset, 0) = prevWord.keep((W/8-1), offset);
		sendWord.keep((W/8-1), (W/8)-offset) = 0;
		sendWord.last = 1;
		//sendWord.dest = prevWord.dest;
		assignDest(sendWord, currWord);

		output.write(sendWord);
		fsmState = PKG;
		break;
	}
}

// The 2nd template parameter is a hack to use this function multiple times
template <int W, int whatever>
void lshiftWordByOctet(	uint16_t offset,
						hls::stream<net_axis<W> >& input,
						hls::stream<net_axis<W> >& output)
{
#pragma HLS inline off
#pragma HLS pipeline II=1
	static bool ls_firstWord = true;
	static bool ls_writeRemainder = false;
	static net_axis<W> prevWord;

	net_axis<W> currWord;
	net_axis<W> sendWord;

	//TODO use states
	if (ls_writeRemainder)
	{
		sendWord.data((8*offset)-1, 0) = prevWord.data((W-1), W-(8*offset));
		sendWord.data((W-1), (8*offset)) = 0;
		sendWord.keep(offset-1, 0) = prevWord.keep((W/8-1), (W/8)-offset);
		sendWord.keep((W/8-1), offset) = 0;
		sendWord.last = 1;

		output.write(sendWord);
		ls_writeRemainder = false;
	}
	else if (!input.empty())
	{
		input.read(currWord);

		if (offset == 0)
		{
			output.write(currWord);
		}
		else
		{

			if (ls_firstWord)
			{
				sendWord.data((8*offset)-1, 0) = 0;
				sendWord.data((W-1), (8*offset)) = currWord.data((W-1)-(8*offset), 0);
				sendWord.keep(offset-1, 0) = 0xFFFFFFFF;
				sendWord.keep((W/8-1), offset) = currWord.keep((W/8-1)-offset, 0);
				sendWord.last = (currWord.keep((W/8-1), (W/8)-offset) == 0);
			}
			else
			{
				sendWord.data((8*offset)-1, 0) = prevWord.data((W-1), W-(8*offset));
				sendWord.data((W-1), (8*offset)) = currWord.data((W-1)-(8*offset), 0);

				sendWord.keep(offset-1, 0) = prevWord.keep((W/8-1), (W/8)-offset);
				sendWord.keep((W/8-1), offset) = currWord.keep((W/8-1)-offset, 0);

				sendWord.last = (currWord.keep((W/8-1), (W/8)-offset) == 0);

			}
			output.write(sendWord);

			prevWord = currWord;
			ls_firstWord = false;
			if (currWord.last)
			{
				ls_firstWord = true;
				ls_writeRemainder = !sendWord.last;
			}
		} //else offset
	}

}

//TODO move to utils
template <typename T>
void stream_merger(hls::stream<T>& in1, hls::stream<T>& in2, hls::stream<T>& out)
{
#pragma HLS PIPELINE II=1
#pragma HLS inline off

	if (!in1.empty())
	{
		out.write(in1.read());
	}
	else if (!in2.empty())
	{
		out.write(in2.read());
	}
}

template <typename T>
void stream_merger(	hls::stream<ap_uint<1> >&	originIn,
					hls::stream<T>&	input0,
					hls::stream<T>&	input1,
					hls::stream<T>&	output)
{
#pragma HLS PIPELINE II=1
#pragma HLS INLINE off

	enum stateType {IDLE, FWD0, FWD1};
	static stateType state = IDLE;
	T word;
	ap_uint<1> origin;

	switch (state)
	{
	case IDLE:
		if (!originIn.empty())
		{
			originIn.read(origin);
			if (origin == 0)
			{
				if (!input0.empty())
				{
					input0.read(word);
					output.write(word);
				}
				else
				{
					state = FWD0;
				}
			}
			else
			{
				if (!input1.empty())
				{
					input1.read(word);
					output.write(word);
				}
				else
				{
					state = FWD1;
				}
			}
		}
		break;
	case FWD0:
		if (!input0.empty())
		{
			input0.read(word);
			output.write(word);
			state = IDLE;
		}
		break;
	case FWD1:
		if (!input1.empty())
		{
			input1.read(word);
			output.write(word);
			state = IDLE;
		}
		break;
	}//switch
}

template <class T, int DUMMY>
void fair_merger(hls::stream<T>& in0, hls::stream<T>& in1, hls::stream<T>& out)
{
#pragma HLS PIPELINE II=1
#pragma HLS INLINE off

	static bool merge_pref = true;

	if (merge_pref)
	{
		if (!in0.empty())
		{
			out.write(in0.read());
			merge_pref = false;
		}
		else if(!in1.empty())
		{
			out.write(in1.read());
		}
	}
	else
	{
		if(!in1.empty())
		{
			out.write(in1.read());
			merge_pref = true;
		}
		else if (!in0.empty())
		{
			out.write(in0.read());
		}
	}
}

template <int W>
void fair_pkg_merger(hls::stream<net_axis<W> >& in0, hls::stream<net_axis<W> >& in1, hls::stream<net_axis<W> >& out)
{
#pragma HLS PIPELINE II=1
#pragma HLS INLINE off

	enum fpmStateType{IDLE, FWD0, FWD1};
	static fpmStateType state = IDLE;
	static bool merge_pref = true;
	net_axis<W> currWord;

	currWord.last = 0;
	switch (state)
	{
	case IDLE:
		if (merge_pref)
		{
			if (!in0.empty())
			{
				in0.read(currWord);
				out.write(currWord);
				state = FWD1;

			}
			else if(!in1.empty())
			{
				in1.read(currWord);
				out.write(currWord);
				state = FWD1;
			}
		}
		else
		{
			if(!in1.empty())
			{
				in1.read(currWord);
				out.write(currWord);
				state = FWD1;

			}
			else if (!in0.empty())
			{
				in0.read(currWord);
				out.write(currWord);
				state = FWD0;
			}
		}
		if (currWord.last)
		{
			state = IDLE;
		}
		break;
	case FWD0:
		if (!in0.empty())
		{
			in0.read(currWord);
			out.write(currWord);
			if (currWord.last)
			{
				merge_pref = false;
				state = IDLE;
			}
		}
		break;
	case FWD1:
		if (!in1.empty())
		{
			in1.read(currWord);
			out.write(currWord);
			if (currWord.last)
			{
				merge_pref = true;
				state = IDLE;
			}
		}
		break;
	}//switch
}

template <int W>
void stream_pkg_merger(	hls::stream<ap_uint<1> >&	originIn,
						hls::stream<net_axis<W> >&	input0,
						hls::stream<net_axis<W> >&	input1,
						hls::stream<net_axis<W> >&	output)
{
#pragma HLS PIPELINE II=1
#pragma HLS INLINE off

	enum stateType {IDLE, FWD0, FWD1};
	static stateType state = IDLE;
	net_axis<W> currWord;
	ap_uint<1> origin;

	switch (state)
	{
	case IDLE:
		if (!originIn.empty())
		{
			originIn.read(origin);
			if (origin == 0)
			{
				if (!input0.empty())
				{
					input0.read(currWord);
					output.write(currWord);
					if (!currWord.last)
					{
						state = FWD0;
					}
				}
				else
				{
					state = FWD0;
				}
			}
			else
			{
				if (!input1.empty())
				{
					input1.read(currWord);
					output.write(currWord);
					if (!currWord.last)
					{
						state = FWD1;
					}
				}
				else
				{
					state = FWD1;
				}
			}
		}
		break;
	case FWD0:
		if (!input0.empty())
		{
			input0.read(currWord);
			output.write(currWord);
			if (currWord.last)
			{
				state = IDLE;
			}
		}
		break;
	case FWD1:
		if (!input1.empty())
		{
			input1.read(currWord);
			output.write(currWord);
			if (currWord.last)
			{
				state = IDLE;
			}
		}
		break;
	}//switch
}

template <int W>
void stream_pkg_splitter(	hls::stream<ap_uint<1> >&	destIn,
							hls::stream<net_axis<W> >&	input,
							hls::stream<net_axis<W> >&	output0,
							hls::stream<net_axis<W> >&	output1)
{
#pragma HLS PIPELINE II=1
#pragma HLS INLINE off

	enum stateType {IDLE, FWD0, FWD1};
	static stateType state = IDLE;
	net_axis<W> currWord;
	ap_uint<1> dest;

	switch (state)
	{
	case IDLE:
		if (!destIn.empty())
		{
			destIn.read(dest);
			state = (dest == 0) ? FWD0 : FWD1;
			if (!input.empty())
			{
				input.read(currWord);
				if (dest == 0)
				{
					output0.write(currWord);
				}
				else
				{
					output1.write(currWord);

				}
				if (currWord.last)
				{
					state = IDLE;
				}
			}
		}
		break;
	case FWD0:
		if (!input.empty())
		{
			input.read(currWord);
			output0.write(currWord);
			if (currWord.last)
			{
				state = IDLE;
			}
		}
		break;
	case FWD1:
		if (!input.empty())
		{
			input.read(currWord);
			output1.write(currWord);
			if (currWord.last)
			{
				state = IDLE;
			}
		}
		break;
	}//switch
}


template <int W>
void pass_valid_pkg(hls::stream<bool>&				pkgValidIn,
					hls::stream<net_axis<W> >&		input,
					hls::stream<net_axis<W> >&		output)
{
	#pragma HLS PIPELINE II=1
	#pragma HLS INLINE off

	enum fsmStateType {VALID, FWD, DROP};
	static fsmStateType state = VALID;

	switch (state)
	{
	case VALID:
		if (!pkgValidIn.empty() && !input.empty())
		{
			bool valid = pkgValidIn.read();
			net_axis<W> word = input.read();

			if (valid)
			{
				output.write(word);
				if (!word.last)
				{
					state = FWD;
				}
			}
			else
			{
				if (!word.last)
				{
					state = DROP;
				}
			}
			
		}
		break;
	case FWD:
		if (!input.empty())
		{
			net_axis<W> word = input.read();
			output.write(word);
			if (word.last)
			{
				state = VALID;
			}
		}
		break;
	case DROP:
		if (!input.empty())
		{
			net_axis<W> word = input.read();
			if (word.last)
			{
				state = VALID;
			}
		}
		break;
	} //switch
}


template <class T>
void toe_duplicate_stream(	hls::stream<T>&	in,
								hls::stream<T>&	out0,
								hls::stream<T>& 	out1)
{
	#pragma HLS PIPELINE II=1
	#pragma HLS INLINE off

	if (!in.empty())
	{
		T item = in.read();
		out0.write(item);
		out1.write(item);
	}
}

template <class T>
void ip_handler_duplicate_stream(	hls::stream<T>&	in,
								hls::stream<T>&	out0,
								hls::stream<T>& 	out1)
{
	#pragma HLS PIPELINE II=1
	#pragma HLS INLINE off

	if (!in.empty())
	{
		T item = in.read();
		out0.write(item);
		out1.write(item);
	}
}


ap_uint<64> lenToKeep(ap_uint<6> length);
ap_uint<8> keepToLen(ap_uint<64> keepValue);

template<int WIDTH>
net_axis<WIDTH> alignWords(ap_uint<6> offset, net_axis<WIDTH>	prevWord, net_axis<WIDTH> currWord)
{

   net_axis<WIDTH> alignedWord;

		alignedWord.data(WIDTH-1, WIDTH - (offset*8)) = currWord.data(offset*8-1, 0);
		alignedWord.keep(WIDTH/8-1, WIDTH/8 - offset) = currWord.keep(offset - 1, 0);
		alignedWord.data(WIDTH - (offset*8) -1, 0) = prevWord.data(WIDTH-1, offset*8);
		alignedWord.keep(WIDTH/8 - offset - 1, 0)  = prevWord.keep(WIDTH/8-1, offset);
		//alignedWord.last = (currWord.keep[offset] == 0);

   return alignedWord;
}


// SOLUTION NEEDED --------------------------------------------------------------------------------------------------------------------------------------------------

// The 2nd template parameter is a hack to use this function multiple times
template <int W, int whatever>
void udp_lshiftWordByOctet(	uint16_t offset,
						hls::stream<net_axis<W> >& input,
						hls::stream<net_axis<W> >& output)
{
#pragma HLS inline off
#pragma HLS pipeline II=1
	static bool ls_firstWord = true;
	static bool ls_writeRemainder = false;
	static net_axis<W> prevWord;

	net_axis<W> currWord;
	net_axis<W> sendWord;

	//TODO use states
	if (ls_writeRemainder)
	{
		sendWord.data((8*offset)-1, 0) = prevWord.data((W-1), W-(8*offset));
		sendWord.data((W-1), (8*offset)) = 0;
		sendWord.keep(offset-1, 0) = prevWord.keep((W/8-1), (W/8)-offset);
		sendWord.keep((W/8-1), offset) = 0;
		sendWord.last = 1;

		output.write(sendWord);
		ls_writeRemainder = false;
	}
	else if (!input.empty())
	{
		input.read(currWord);

		if (offset == 0)
		{
			output.write(currWord);
		}
		else
		{

			if (ls_firstWord)
			{
				sendWord.data((8*offset)-1, 0) = 0;
				sendWord.data((W-1), (8*offset)) = currWord.data((W-1)-(8*offset), 0);
				sendWord.keep(offset-1, 0) = 0xFFFFFFFF;
				sendWord.keep((W/8-1), offset) = currWord.keep((W/8-1)-offset, 0);
				sendWord.last = (currWord.keep((W/8-1), (W/8)-offset) == 0);
			}
			else
			{
				sendWord.data((8*offset)-1, 0) = prevWord.data((W-1), W-(8*offset));
				sendWord.data((W-1), (8*offset)) = currWord.data((W-1)-(8*offset), 0);

				sendWord.keep(offset-1, 0) = prevWord.keep((W/8-1), (W/8)-offset);
				sendWord.keep((W/8-1), offset) = currWord.keep((W/8-1)-offset, 0);

				sendWord.last = (currWord.keep((W/8-1), (W/8)-offset) == 0);

			}
			output.write(sendWord);

			prevWord = currWord;
			ls_firstWord = false;
			if (currWord.last)
			{
				ls_firstWord = true;
				ls_writeRemainder = !sendWord.last;
			}
		} //else offset
	}

}

// The 2nd template parameter is a hack to use this function multiple times
template <int W, int whatever>
void mac_lshiftWordByOctet(	uint16_t offset,
						hls::stream<net_axis<W> >& input,
						hls::stream<net_axis<W> >& output)
{
#pragma HLS inline off
#pragma HLS pipeline II=1
	static bool ls_firstWord = true;
	static bool ls_writeRemainder = false;
	static net_axis<W> prevWord;

	net_axis<W> currWord;
	net_axis<W> sendWord;

	//TODO use states
	if (ls_writeRemainder)
	{
		sendWord.data((8*offset)-1, 0) = prevWord.data((W-1), W-(8*offset));
		sendWord.data((W-1), (8*offset)) = 0;
		sendWord.keep(offset-1, 0) = prevWord.keep((W/8-1), (W/8)-offset);
		sendWord.keep((W/8-1), offset) = 0;
		sendWord.last = 1;

		output.write(sendWord);
		ls_writeRemainder = false;
	}
	else if (!input.empty())
	{
		input.read(currWord);

		if (offset == 0)
		{
			output.write(currWord);
		}
		else
		{

			if (ls_firstWord)
			{
				sendWord.data((8*offset)-1, 0) = 0;
				sendWord.data((W-1), (8*offset)) = currWord.data((W-1)-(8*offset), 0);
				sendWord.keep(offset-1, 0) = 0xFFFFFFFF;
				sendWord.keep((W/8-1), offset) = currWord.keep((W/8-1)-offset, 0);
				sendWord.last = (currWord.keep((W/8-1), (W/8)-offset) == 0);
			}
			else
			{
				sendWord.data((8*offset)-1, 0) = prevWord.data((W-1), W-(8*offset));
				sendWord.data((W-1), (8*offset)) = currWord.data((W-1)-(8*offset), 0);

				sendWord.keep(offset-1, 0) = prevWord.keep((W/8-1), (W/8)-offset);
				sendWord.keep((W/8-1), offset) = currWord.keep((W/8-1)-offset, 0);

				sendWord.last = (currWord.keep((W/8-1), (W/8)-offset) == 0);

			}
			output.write(sendWord);

			prevWord = currWord;
			ls_firstWord = false;
			if (currWord.last)
			{
				ls_firstWord = true;
				ls_writeRemainder = !sendWord.last;
			}
		} //else offset
	}

}

// The 2nd template parameter is a hack to use this function multiple times
template <int W, int whatever>
void ipv4_lshiftWordByOctet(	uint16_t offset,
						hls::stream<net_axis<W> >& input,
						hls::stream<net_axis<W> >& output)
{
#pragma HLS inline off
#pragma HLS pipeline II=1
	static bool ls_firstWord = true;
	static bool ls_writeRemainder = false;
	static net_axis<W> prevWord;

	net_axis<W> currWord;
	net_axis<W> sendWord;

	//TODO use states
	if (ls_writeRemainder)
	{
		sendWord.data((8*offset)-1, 0) = prevWord.data((W-1), W-(8*offset));
		sendWord.data((W-1), (8*offset)) = 0;
		sendWord.keep(offset-1, 0) = prevWord.keep((W/8-1), (W/8)-offset);
		sendWord.keep((W/8-1), offset) = 0;
		sendWord.last = 1;

		output.write(sendWord);
		ls_writeRemainder = false;
	}
	else if (!input.empty())
	{
		input.read(currWord);

		if (offset == 0)
		{
			output.write(currWord);
		}
		else
		{

			if (ls_firstWord)
			{
				sendWord.data((8*offset)-1, 0) = 0;
				sendWord.data((W-1), (8*offset)) = currWord.data((W-1)-(8*offset), 0);
				sendWord.keep(offset-1, 0) = 0xFFFFFFFF;
				sendWord.keep((W/8-1), offset) = currWord.keep((W/8-1)-offset, 0);
				sendWord.last = (currWord.keep((W/8-1), (W/8)-offset) == 0);
			}
			else
			{
				sendWord.data((8*offset)-1, 0) = prevWord.data((W-1), W-(8*offset));
				sendWord.data((W-1), (8*offset)) = currWord.data((W-1)-(8*offset), 0);

				sendWord.keep(offset-1, 0) = prevWord.keep((W/8-1), (W/8)-offset);
				sendWord.keep((W/8-1), offset) = currWord.keep((W/8-1)-offset, 0);

				sendWord.last = (currWord.keep((W/8-1), (W/8)-offset) == 0);

			}
			output.write(sendWord);

			prevWord = currWord;
			ls_firstWord = false;
			if (currWord.last)
			{
				ls_firstWord = true;
				ls_writeRemainder = !sendWord.last;
			}
		} //else offset
	}

}

// The 2nd template parameter is a hack to use this function multiple times
template <typename T, int W, int whatever>
void ip_handler_rshiftWordByOctet(	uint16_t offset,
						hls::stream<T>& input,
						hls::stream<T>& output)
{
#pragma HLS inline off
#pragma HLS pipeline II=1 //TODO this has a bug, the bug might come from how it is used

	enum fsmStateType {PKG, REMAINDER};
	static fsmStateType fsmState = PKG;
	static bool rs_firstWord = (offset != 0);
	static T prevWord;

	T currWord;
	T sendWord;

	sendWord.last = 0;
	switch (fsmState)
	{
	case PKG:
		if (!input.empty())
		{
			input.read(currWord);

			if (!rs_firstWord)
			{
				if (offset == 0)
				{
					sendWord = currWord;
				}
				else
				{
					sendWord.data((W-1)-(8*offset), 0) = prevWord.data((W-1), 8*offset);
					sendWord.data((W-1), W-(8*offset)) = currWord.data((8*offset)-1, 0);

					sendWord.keep((W/8-1)-offset, 0) = prevWord.keep((W/8-1), offset);
					sendWord.keep((W/8-1), (W/8)-offset) = currWord.keep(offset-1, 0);

					sendWord.last = (currWord.keep((W/8-1), offset) == 0);
					//sendWord.dest = currWord.dest;
					assignDest(sendWord, currWord);
				}//else offset
				output.write(sendWord);
			}

			prevWord = currWord;
			rs_firstWord = false;
			if (currWord.last)
			{
				rs_firstWord = (offset != 0);
				//rs_writeRemainder = (sendWord.last == 0);
				if (!sendWord.last)
				{
					fsmState = REMAINDER;
				}
			}
			//}//else offset
		}
		break;
	case REMAINDER:
		sendWord.data((W-1)-(8*offset), 0) = prevWord.data((W-1), 8*offset);
		sendWord.data((W-1), W-(8*offset)) = 0;
		sendWord.keep((W/8-1)-offset, 0) = prevWord.keep((W/8-1), offset);
		sendWord.keep((W/8-1), (W/8)-offset) = 0;
		sendWord.last = 1;
		//sendWord.dest = prevWord.dest;
		assignDest(sendWord, currWord);

		output.write(sendWord);
		fsmState = PKG;
		break;
	}
}

// The 2nd template parameter is a hack to use this function multiple times
// offset = (64%512)/8 = 8->in
// input即输入进来的512bit数据段->in
// output
// T = net_axis<512>
// W=512
template <typename T, int W, int whatever>
void udp_rshiftWordByOctet(	uint16_t offset,
						hls::stream<T>& input,
						hls::stream<T>& output)
{
#pragma HLS inline off
#pragma HLS pipeline II=1 //TODO this has a bug, the bug might come from how it is used

	enum fsmStateType {PKG, REMAINDER};              // 定义两个状态，PKG和REMAINDER
	static fsmStateType fsmState = PKG;              // 初始状态设置为PKG
	static bool rs_firstWord = (offset != 0);        // rs_firstWord=1，表明是否是数据包的第一个word，即是否是一个新的数据包的开始。如果是的话
	static T prevWord;                               // 定义一个net_axis<512>类型的对象，取名为prevWord，用来存储已经进来过的数据   

	T currWord;      
	T sendWord;

	sendWord.last = 0;                       
	switch (fsmState)
	{
	case PKG:
		if (!input.empty())                 // 如果输入不为空
		{
			input.read(currWord);           // 将input的512bit数据读取到currWord中	
			if (!rs_firstWord)              // 要进这个if语句，有两种情况，第一种情况是WIDTH<=64,第二种情况是WIDTH>64，而且必须是第2个数据段才能进来
			{
				if (offset == 0)            // 
				{
					sendWord = currWord;
				}
				else                        // 将UDP的头摘出来
				{
					sendWord.data((W-1)-(8*offset), 0) = prevWord.data((W-1), 8*offset);
					sendWord.data((W-1), W-(8*offset)) = currWord.data((8*offset)-1, 0);

					sendWord.keep((W/8-1)-offset, 0) = prevWord.keep((W/8-1), offset);
					sendWord.keep((W/8-1), (W/8)-offset) = currWord.keep(offset-1, 0);

					sendWord.last = (currWord.keep((W/8-1), offset) == 0);
					//sendWord.dest = currWord.dest;
					assignDest(sendWord, currWord);
				}//else offset
				output.write(sendWord);
			}

			prevWord = currWord;                 // 第一个数据段进来后先来这，将currWord赋给prevWord
			rs_firstWord = false;                // 将rs_firstWord设置为false
			if (currWord.last)                   // 如果到了最后一个数据段， 
			{
				rs_firstWord = (offset != 0);    // 如果WIDTH<=64，那他还是0，但如果不是的话，这个值就变1了 
				//rs_writeRemainder = (sendWord.last == 0);
				if (!sendWord.last)              // 
				{
					fsmState = REMAINDER;
				}
			}
			//}//else offset
		}
		break;
	case REMAINDER:
		sendWord.data((W-1)-(8*offset), 0) = prevWord.data((W-1), 8*offset);
		sendWord.data((W-1), W-(8*offset)) = 0;
		sendWord.keep((W/8-1)-offset, 0) = prevWord.keep((W/8-1), offset);
		sendWord.keep((W/8-1), (W/8)-offset) = 0;
		sendWord.last = 1;
		//sendWord.dest = prevWord.dest;
		assignDest(sendWord, currWord);

		output.write(sendWord);
		fsmState = PKG;
		break;
	}
}