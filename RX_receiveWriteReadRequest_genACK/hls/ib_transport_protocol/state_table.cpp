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
#include "state_table.hpp"
#include <rocev2_config.hpp> //defines MAX_QPS

/*
	1. 函数功能：初始化state_table
	2. 参数解析
		(1)rxIbh2stateTable_upd_req->rxIbh2stateTable_upd_req，
			e. 此时已经接收到IB报文，首先接受的是从rx_ibh_rsm函数中传递进来的local qpn与当前数据包是否为response
			g. 在rx_ibh_rsm判断所来的数据包是一个正常的数据包，未出现重复和invalid后，将local_qpn，remote_psn+numPkg(write=0，而在RDMA Read Request情况下会包含包的数量)以及当前包是否为response包传递进来，并将write设为true
			在执行完g操作后，更新state_table[qpn]中的数值，如果是write的情况，resp_epsn自加1,如果是read request，则自加需要request包的数量，并将etry_counter设为0x7
		(2)txIbh2stateTable_upd_req->txIbh2stateTable_upd_req，在执行write request返回ACK时调用，用来请求state_table[qpn]entry->in
		(3)qpi2stateTable_upd_req->qpi2stateTable_upd_req，接受qp_interface函数传递进来的参数->in
			a. 当IB报文来之前，首先接受来自qp_interface发送来的qpi2stateTable_upd_req请求，该请求中只包含local_qpn的值
			c. qp_interface函数接收到步骤b中返回stateTable2qpi_rsp后，再将local qpn，QP状态(READY_SEND)，remote PSN，local PSN传进来，并将write设为true
		(4)stateTable2rxIbh_rsp->stateTable2rxIbh_rsp
			f. 根据e中传递进来的qpn，将state_table[qpn]中的部分参数返回，包括epsn,oldest_outstanding_psn,max_forward,retryCounter
		(5)stateTable2txIbh_rsp->stateTable2txIbh_rsp,直接返回state_table[qpn]这个entry->out
		(6)stateTable2qpi_rsp->stateTable2qpi_rsp，回应qp_interface函数传递进来的参数->out
			b. 根据qp_interface传进来的qpn，本函数创建一个state_table entry:state_table[qpn]并存储在stateTable2qpi_rsp中，返回给qp_interface函数。
			d. 根据c中传递进来的参数，填充state_table[qpn]，包括resp_epsn等
*/
void state_table(	hls::stream<rxStateReq>& rxIbh2stateTable_upd_req,
						hls::stream<txStateReq>& txIbh2stateTable_upd_req,
						hls::stream<ifStateReq>& qpi2stateTable_upd_req,
						hls::stream<rxStateRsp>& stateTable2rxIbh_rsp,
						hls::stream<stateTableEntry>& stateTable2txIbh_rsp,
						hls::stream<stateTableEntry>& stateTable2qpi_rsp)
{
#pragma HLS PIPELINE II=1
#pragma HLS INLINE off

	static stateTableEntry state_table[MAX_QPS];                  // 定义一个state_table，stable大小为MAX_QPS，在本实例中其大小为500
	#pragma HLS RESOURCE variable=state_table core=RAM_2P_BRAM    

	rxStateReq rxRequest;                         // 定义一个rxStateReq类型的对象rxRequest
	txStateReq txRequest;                         // 定义一个txStateReq类型的对象txRequest
	ifStateReq ifRequest;                         // 定义一个ifStateReq类型的对象ifRequest

	if (!rxIbh2stateTable_upd_req.empty())        // 当rxIbh2stateTable_upd_req不为空时，也就是IB数据包经过了rx_ibh_fsm函数，将本地QPN与当前处理数据包是否是Response包解析出来
	{
		rxIbh2stateTable_upd_req.read(rxRequest); // 第二轮的时候，rx_ibh2fsm函数在处理正常的数据包时将write设为了true
		if (rxRequest.write)                     
		{
			if (rxRequest.isResponse)             // 如果是response包
			{
				state_table[rxRequest.qpn].req_old_unack = rxRequest.epsn;         // 如果是response包，说明本端是requester端，且此时处理完responder端返回的response，因此需要更新req_old_unack，
			}
			else    // 如果本端是responder，接受了requester端的Request，此时需要更新参数，包括epsn和retry counter
			{
				state_table[rxRequest.qpn].resp_epsn = rxRequest.epsn;             // 如果是write的情况，resp_epsn自加1,如果是read request，则自加需要request包的数量
				state_table[rxRequest.qpn].retryCounter = rxRequest.retryCounter;  // retryCounter设为0x7
				//state_table[rxRequest.qpn].sendNAK = rxRequest.epsn;
			}
		}
		else
		{
			stateTableEntry entry = state_table[rxRequest.qpn(15,0)];    // 利用qpn作为key，从qp_interface初始化的state_table中获取entry
			if (rxRequest.isResponse)     // 如果是response类型，本实例中发来的数据包中的OpCode为write，明显不是response类型
			{
				stateTable2rxIbh_rsp.write(rxStateRsp(entry.req_old_unack, entry.req_old_valid, entry.req_next_psn-1));
			}
			else  // 如果不是response类型
			{
				// rxStateRsp中有四个变量，分别是epsn,oldest_outstanding_psn,max_forward,retryCounter，此处前三个变量均被赋值为local qpn，最后一个值被赋为0xF
				// 将entry中已有的resp_epsn,resp_old_outstanding,resp_epsn,entry.retryCounter
				stateTable2rxIbh_rsp.write(rxStateRsp(entry.resp_epsn, entry.resp_old_outstanding, entry.resp_epsn, entry.retryCounter));
			}
		}
	}
	else if (!txIbh2stateTable_upd_req.empty())
	{
		txIbh2stateTable_upd_req.read(txRequest);
		if (txRequest.write)
		{
			state_table[txRequest.qpn].req_next_psn = txRequest.psn;
		}
		else
		{
			stateTable2txIbh_rsp.write(state_table[txRequest.qpn]);
		}
	}
	else if (!qpi2stateTable_upd_req.empty())     // qp_interface函数传进来的，第一次只包含了local qpn，第二次包含了local qpn，QP State,remote PSN，local PSN，和write有效位
	{
		// qp_interface第二次向state_table写数据，包含了local qpn，QP State,remote PSN，local PSN，和write有效位
		qpi2stateTable_upd_req.read(ifRequest);   // qpi2stateTable_upd_req读进ifRequest中，即interfaceRequest
		if (ifRequest.write)                      // 当qp_interface处理了本函数返回的stateTable2qpi_rsp后，便会对qpi2stateTable_upd_req进行新的赋值，包含local qpn，QP状态(READY_SEND)，remote PSN，local PSN，并将write设为true
		{
			// std::cout << "SETUP new connection, PSN: " << ifRequest.remote_psn << std::endl;  // rpsn是用来产生request时用的，来保证产生request的有序性
			//state_table[ifRequest.qpn].state = ifRequest.newState;
			//state_table[ifRequest.qpn].prevOpCode = RC_RDMA_WRITE_LAST;
			// resp_epsn指的是responder端的epsn
			// resp_old_outstanding指的是responder端的oldest outstanding PSN，即最老的还没来得及处理的PSN
			state_table[ifRequest.qpn].resp_epsn = ifRequest.local_psn;             // resp_epxn，epsn指的是expected PSN，即期望的PSN，这个PSN是host端发过来的，如果IB报文中PSN与这个值相同，则说明数据包是有效的，即保持了有序性
			state_table[ifRequest.qpn].resp_old_outstanding = ifRequest.local_psn;  // oldest outstanding psn，即最近的那个未执行的PSN，也等于local psn，
			// 此时是FPGA作为Request端时的概念
			// req_next_psn指的是先生成PSN，再生成response报文，再将nextPSN作为current PSN塞到报文的BTH中作为current PSN
			state_table[ifRequest.qpn].req_next_psn = ifRequest.remote_psn;         // remote_psn是在本端产生req请求时生成的
			state_table[ifRequest.qpn].req_old_unack = ifRequest.remote_psn;        // request端oldest的未生成ACK的报文的PSN
			state_table[ifRequest.qpn].req_old_valid = ifRequest.remote_psn;        // request端oldest的有效的报文的PSN  
			state_table[ifRequest.qpn].retryCounter = 0xF;                          
			//state_table[ifRequest.qpn].sendNAK = false;                             

			//state_table[ifRequest.qpn].r_key = ifRequest.r_key;
			//state_table[ifRequest.qpn].virtual_address = ifRequest.virtual_address;
		}
		// qp_interface第一次传进来的数据即local_qpn，进本函数执行，即生成一个state_table entry，这个entry由local qpn索引，随后生成response信号，传递回qp_interface
		else  
		{
			stateTable2qpi_rsp.write(state_table[ifRequest.qpn(15,0)]);  
		}
	}

}


