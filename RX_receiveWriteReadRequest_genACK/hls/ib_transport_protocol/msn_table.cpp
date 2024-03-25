/************************************************
Copyright (c) 2019, Systems Group, ETH Zurich.
All rights reserved.

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice,
this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors
may be used to endorse or promote products derived from this software
without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
************************************************/
#include "msn_table.hpp"
#include <rocev2_config.hpp> //defines MAX_QPS

/*
	1. 函数功能：
	2. 参数解析：
		（1)rxExh2msnTable_upd_req->rxExh2msnTable_upd_req,更新MSN table的请求，from rx_eth_fsm->in
			a. rx_exh_fsm将local qpn发过来，此时write标志位设为false
			c. 当rx_exh_fsm处理了RETH头，并为memoryWriteCmd赋值之后，更新一下msn_table[qpn]，将msn数量+1，当再来一个数据包要进行存储时初始的虚拟地址就变成了rdmaHeader.getVirtualAddress()+payLoadLength，当前报文剩余报文的长度，并将write设为true
		（2)txExh2msnTable_req->txExh2msnTable_req,
		（3)if2msnTable_init->if2msnTable_init,存储context中的local qpn，remote_key, from qp_interface->in
			此时未传进IB报文，msn函数根据传递进来的qpn与r_key初始化一个msn_table entry，msn_table[qpn],包含msn、vaddr、dma_length和r_key,除了r_key，其余的值被初始化为0,此时并未产生
		（4)msnTable2rxExh_rsp->msnTable2rxExh_rsp,向rx_eth_fsm函数返回msnTable2rxExh_rsp
			b. 返回初始化的，msn_table表项，msn_table[qpn]
		（5)msnTable2txExh_rsp->msnTable2txExh_rsp
*/
void msn_table(hls::stream<rxMsnReq>&		rxExh2msnTable_upd_req,
					hls::stream<ap_uint<16> >&	txExh2msnTable_req,
					hls::stream<ifMsnReq>&	if2msnTable_init,
					hls::stream<dmaState>&		msnTable2rxExh_rsp,
					hls::stream<txMsnRsp>&	msnTable2txExh_rsp)
{
#pragma HLS PIPELINE II=1
#pragma HLS INLINE off

	static dmaState  msn_table[MAX_QPS];
	#pragma HLS RESOURCE variable=msn_table core=RAM_2P_BRAM

	rxMsnReq rxRequest;
	ifMsnReq ifRequest;
	ap_uint<16> qpn;

	//TODO init channel

	if (!rxExh2msnTable_upd_req.empty())         // 从rx_exh_fsm中接受rxExh2msnTable_upd_req
	{
		rxExh2msnTable_upd_req.read(rxRequest);  // 将rxExh2msnTable_upd_req读取到rxRequest中
		if (rxRequest.write)                     // 第一次的时候rxRequest.write为false
		{
			msn_table[rxRequest.qpn].msn = rxRequest.msn;    // 进来的时候会对以下内容进行更新
			msn_table[rxRequest.qpn].vaddr = rxRequest.vaddr;
			msn_table[rxRequest.qpn].dma_length= rxRequest.dma_length;
		}
		else                                      
		{
			msnTable2rxExh_rsp.write(dmaState(msn_table[rxRequest.qpn]));  // 
		}
	}
	else if (!txExh2msnTable_req.empty())
	{
		txExh2msnTable_req.read(qpn);
		msnTable2txExh_rsp.write(txMsnRsp(msn_table[qpn].msn, msn_table[qpn].r_key));
	}
	else if (!if2msnTable_init.empty()) //move up??  // 第一轮时根据qp_interface函数中传递进来的qpn与r_key初始化一个msn_table entry，msn_table[qpn]
	{
		if2msnTable_init.read(ifRequest);
		// std::cout << "MSN init for QPN: " << ifRequest.qpn << std::endl;
		msn_table[ifRequest.qpn].msn = 0;
		msn_table[ifRequest.qpn].vaddr = 0; //TODO requried?
		msn_table[ifRequest.qpn].dma_length = 0;  //TODO requried?
		msn_table[ifRequest.qpn].r_key = ifRequest.r_key;
	}
}
