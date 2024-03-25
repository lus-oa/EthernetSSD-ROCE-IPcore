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
#ifndef PACKET_HPP
#define PACKET_HPP

#include "stdint.h"
#include "axi_utils.hpp"

using namespace hls;

// W = 512
// IPV4 Header Size = 160
template <int W, int HEADER_SIZE>  // 
class packetHeader {
public:
	bool ready;
	uint16_t idx;
	ap_uint<HEADER_SIZE> header;   // 定义header成员变量 

public:
	packetHeader()
		:ready(false), idx(0) {}   // 默认构造函数，用于初始化类的对象，在构造对象时，会将 ready 初始化为 false，idx 初始化为 0。
	packetHeader& operator=(const packetHeader& other)  
	{
		ready = other.ready;
		idx = other.idx;
		header = other.header;
		return *this;
	}

	void parseWord(ap_uint<W>& w)
	{
		if (ready)                     
			return;

		if (idx*W+W < HEADER_SIZE)            // 如果Header的大小超过了传进来的DATA_WIDTH的大小，也就是我一次性填不满这个header，因此需要多次往里面些，因此大括号里面没有将ready设为true，也就是下次来的数据还是会到这被进行拆包
		{
			header(idx*W+W-1, idx*W) = w;     // 假设W=64，header(65，0)=input1,header(127,64)=input2,header(160,128)=input3,需要往里面传三次数据
		}
		else //(idx*W+W >= HEADER_SIZE)       // 如果header的大小没有传进来的DATA_WIDTH大，也就是说我传一次数据就能把header填满
		{
			header(HEADER_SIZE-1, idx*W) = w; // 直接对header从低位到高位进行赋值
			ready = true;                     // ready设为true，也就是说header我已经分出来了，下个数据段来的时候就不需要再进行协议头的拆分了
		}
		idx++;                                // 这个应该主要用在上上种情况，即我传进来的数据段填不满header，需要多次填冲
		/*(header(idx*W+W-1, idx*W) = w;
		if (idx*W+W >= HEADER_SIZE)
		{
			ready = true;
		}*/
	}
	ap_uint<8> consumeWord(ap_uint<W>& w)
	{
		if ((idx+1)*W <= HEADER_SIZE)
		{
			w = header(((idx+1)*W)-1, idx*W);
			idx++;
			return ((HEADER_SIZE - (idx*W)) / 8);
		}
		else if (idx*W < HEADER_SIZE)
		{
			w((HEADER_SIZE%W)-1, 0) = header(HEADER_SIZE-1, idx*W);
			idx++;
			return 0;//(HEADER_SIZE - (idx*W));
		}
		return 0;
	}
	/*bool consumeWord(ap_uint<W>& w)
	{
		if ((idx+2)*W <= HEADER_SIZE)
		{
			w = header(((idx+1)*W)-1, idx*W);
			idx++;
			return false;
			/*if ((idx+1)*W > HEADER_SIZE)
			{
				return true;
			}
			else
			{
				return false;
			}*//*
		}
		else if ((idx+1)*W <= HEADER_SIZE)
		{
			w = header(((idx+1)*W)-1, idx*W);
			idx++;
			return true;
		}
		return true;
	}*/
	/*void consumePartialWord(ap_uint<W>& w)
	{
		if (idx*W < HEADER_SIZE)
		{
			w((HEADER_SIZE%AXI_WIDTH)-1, 0) = header(HEADER_SIZE-1, idx*W);
			idx++;
		}
		//return true;
	}
	/*bool consumeWord(ap_uint<W>& w)
	{
		if ((idx+1)*W <= HEADER_SIZE)
		{
			w = header(((idx+1)*W)-1, idx*W);
			idx++;
			return true;
		}
		return false;
	}
	bool consumePartialWord(ap_uint<W>& w)
	{
		if (idx*W < HEADER_SIZE)
		{
			w((HEADER_SIZE%AXI_WIDTH)-1, 0) = header(HEADER_SIZE-1, idx*W);
			idx++;
			return true;
		}
		return false;
	}*/
	void setRawHeader(ap_uint<HEADER_SIZE> h)
	{
		header = h;
	}
	ap_uint<HEADER_SIZE> getRawHeader()
	{
		return header;
	}
	bool isReady()
	{
		return ready;
	}

	void clear()
	{
#pragma HLS pipeline II=1
		//header = 0;
		ready = false;
		idx = 0;
	}
};

#endif
