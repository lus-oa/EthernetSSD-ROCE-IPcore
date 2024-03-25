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

#include "ib_transport_protocol.hpp"
#include <rocev2_config.hpp>
#include "conn_table.hpp"
#include "state_table.hpp"
#include "msn_table.hpp"
#include "transport_timer.hpp"
#include "retransmitter/retransmitter.hpp"
#include "read_req_table.hpp"
#include "multi_queue/multi_queue.hpp"
/**
 * BaseTransportHeader
 * header(7, 0) = op_code; // OpCode (8bit), IBA packet type, which extension headers follow
 * header[8] = solicited_event;
 * header[9] = mig_req;
 * header(11,10) = pad_count;
 * header(15, 12) = t_ver;
 * header(31, 16) = partition_key;
 * header[32] = fr;
 * header[33] = br;
 * header(39, 34) = reserved_var;
 * header(63, 40) = reverse(dest_qp);
 * header[71] = ack_req;
 * header(70, 64) = reserved;
 * header(95, 72) = reverse(psn);
 */
// input->s_axis_rx_data,经过ipv4和udp后被拆掉IPV4头和UDP头的报文，此时就只剩IB Transport层的内容了->in
// metaOut->rx_ibh2fsm_MetaFifo，ibh到fsm的元数据，包括requester端指定的OpCode，P_KEY，Destination QP和PSN->out
// metaOut2->rx_ibh2exh_MetaFifo，ibh到EXH的元数据，包括OpCode->out
// output->rx_ibh2shiftFifo，ibh到shift的元数据，即input数据->out
template <int WIDTH>
void rx_process_ibh(stream<net_axis<WIDTH>> &input,
					stream<ibhMeta> &metaOut,
					stream<ibOpCode> &metaOut2,
					stream<net_axis<WIDTH>> &output)
{
#pragma HLS inline off
#pragma HLS pipeline II = 1

	static BaseTransportHeader<WIDTH> bth; // 定义一个BaseTransportHeader类型的对象bth，该对象继承了一个成员变量header
	static bool metaWritten = false;	   // 定义一个标志位metaWritten，表示header头中的元数据是否被完全写出

	net_axis<WIDTH> currWord; // 定义一个net_axis类别的对象currWord来暂存输入数据

	if (!input.empty())
	{
		input.read(currWord);		  // 将input中的512bit数据读到currWord中
		bth.parseWord(currWord.data); // 将BTH头从512bit报文中拆解出来，该头大小为12byte

		if (bth.isReady()) // 如果已經成功拆分处BTH头
		{
			output.write(currWord); // 将当前数据段写入至output中
			if (!metaWritten)
			{

				metaOut.write(ibhMeta(bth.getOpCode(), bth.getPartitionKey(), bth.getDstQP(), bth.getPsn(), true)); // metaOut中填入OpCode，P_KEY,对端制定的R_QPN即本端的L_QPN,对端指定的PSN，即对端制定的当前packet的PSN，也就是本端接收到的R_PSN
				// std::cout << "PROCESS IBH opcode: " << bth.getOpCode() << std::endl;
				metaOut2.write(bth.getOpCode()); // metaOut2中填充当前报文中指定的OpCode
				metaWritten = true;
			}
		}
		if (currWord.last) // 如果是最后一个数据段
		{
			bth.clear(); // 清空bth中的内容
			metaWritten = false;
		}
	}
}
/*
	此函数用于解析EXT头，在RoCE_V2 RC服务类型中，只使用到了两种EXH头，分别时RETH和AETH，因此就需要根据包的类型对EXH包进行解析。从RETH中抓出来的元数据主要是DMA Length，从AETH中抓出来的元数据主要是NAK/ACK判定
	涉及到RETH头的指令RDMA WRITE FIRST/RDMA WRITE only/RDMA WRITE only with immediate(本项目不支持)/RDMA READ Request
	涉及到AETH头的指令RDMA READ response First/RDMA READ response Last/RDMA READ response only/Acknowledge
	不需要ETH头的指令RDMA WRITE Middle/RDMA WRITE Last/RDMA READ response Middle
	1. 参数功能： 该函数主要是解析EXH头，抓取出对应元数据
	2. 参数解析：
		(1)input->rx_shift2exhFifo，移走BTH头后的数据，数据大小为512bit，即从下一个数据段中取高96bit数据进行了填充->in
		(2)metaIn->rx_ibh2exh_MetaFifo，ibh到EXH的元数据，包括OpCode->in
		(3)exhMetaFifo->rx_exhMetaFifo，从ETH中抓取出的元数据->out
			a. 如果处理的是RETH头，且处理的指令类型是RDMA Read Request，则exhMetaFifo中存储"该包不是NAK包并存储要读取数据的长度能填满多少个packet"；如果不是RDMA Read Request类型的指令，则只存储该包不是NAK包
			b. 如果处理的是AETH头，则将AETH头中的是否是NAK包标志位赋值给exhMetaFifo
			c. 如果处理的报文中没有ETH头，则在exhMetaFifo中写入该包不是NAK包
		(4)metaOut->rx_exh2drop_MetaFifo，存储ETH头的内容->out
			a. 如果处理的是RETH包，metaOut中存储RETH包的全部8byte内容
			b. 如果处理的是AETH包，metaOut中存储AETH包的全部4byte内容
			c. 如果处理的报文中没有ETH头，metaOut被初始化一个空的对象
		(5)output->rx_exh2dropFifo->out，存储经过处理的数据报文->out
			a. 如果处理的是RETH头且为write或part类型指令，则直接将解析完ETH头后的IB报文写入output中
			b. 如果处理的是AETH头且为RDMA READ response First/RDMA READ response Last/RDMA READ response only这几种情况，即牵扯到数据传输的，则给output赋值IB报文内容，如果为RC ACK，就不需要对output进行赋值了
			c. 如果处理的报文中没有ETH头，则直接将输入赋值给output，即payload
*/
template <int WIDTH>
void rx_process_exh(stream<net_axis<WIDTH>> &input,
					stream<ibOpCode> &metaIn,
					stream<exhMeta> &exhMetaFifo,
					stream<ExHeader<WIDTH>> &metaOut,
					stream<net_axis<WIDTH>> &output)
{
#pragma HLS inline off
#pragma HLS pipeline II = 1

	enum fsmStateType
	{
		META,
		ACK_HEADER,
		RETH_HEADER,
		NO_HEADER,
		RPCH_HEADER
	};								  // 定义状态机状态，META, ACK_HEADER, RETH_HEADER, NO_HEADER, RPCH_HEADER（RC_RDMA_READ_POINTER_REQUEST，不用理会，用不到）
	static fsmStateType state = META; // 初始状态机状态为META
	/**
	 *   see page 167
	 *	ap_uint<64> virtual_address;
	 *	ap_uint<32> r_key;
	 *	ap_uint<32> dma_len;
	 */
	static RdmaExHeader<WIDTH> rdmaHeader; // 定义RdmaExHeader,即RETH
	/**
	 * AETH, see page 254, page format on 337, NAK codes page 338
	 * [7:0] syndrome, indicates if this is an ACK or NAK
	 * [31:8] msn, number of last message completed
	 */
	static AckExHeader<WIDTH> ackHeader; // 定义AckExHeader，即AETH
	// static RdmaPointerChaseHeader<WIDTH> pointerChasingHeader;
	static bool metaWritten = false; // 定义一个标志位用来标识是否已經对元数据处理完毕

	net_axis<WIDTH> currWord;
	static ibOpCode opCode; // 定义ibOpCode类型对象opCode，用来暂存IB报文中的操作码

	switch (state)
	{
	case META: // 初始时，进入META状态，主要用于判断Request类型
		if (!metaIn.empty())
		{
			metaIn.read(opCode); // 从MetaIn中将对端发来的OpCode读取至opCode中
			metaWritten = false;
			if (checkIfAethHeader(opCode)) // 检查opCode类型，查看是否包含AETH头
			{
				state = ACK_HEADER;
			}
			else if (checkIfRethHeader(opCode)) // 检查opCode类型，查看是否包含RETH头
			{
				state = RETH_HEADER;
			}
#if POINTER_CHASING_EN
			else if (opCode == RC_RDMA_READ_POINTER_REQUEST)
			{
				state = RPCH_HEADER;
			}
#endif
			else
			{
				state = NO_HEADER; // 没有头的IB报文，即直接是Payload，比如说RDMA WRITE Middle、RDMA WRITE Last等，BTH后面直接跟的就是payload
			}
		}
		break;
	// 用到AETH的操作：RDMA READ response First/RDMA READ response Last/RDMA READ response only/Acknowledge
	case ACK_HEADER:
		if (!input.empty())
		{
			input.read(currWord);				// 将IB报文读取至currWord中
			ackHeader.parseWord(currWord.data); // 解析出AETH头

			if (ackHeader.isReady()) // 如果已经成功解析出AETH头
			{
				if (opCode != RC_ACK) // 如果opCode不等于RC ACK，那就是RDMA READ response First/RDMA READ response Last/RDMA READ response only这几种情况
				{
					output.write(currWord); // 直接将解析出AETH头的数据段赋值给output
				}
				if (!metaWritten)
				{
					exhMetaFifo.write(exhMeta(ackHeader.isNAK())); // exhMetaFifo主要是存储当前当前包是否为NAK包
					metaOut.write(ExHeader<WIDTH>(ackHeader));	   // metaOut负责存储整个AETH头
					metaWritten = true;							   // 元数据书写完成
				}
			}
			if (currWord.last)
			{
				ackHeader.clear();
				state = META;
			}
		}
		break;
	// 用到RETH_HEADER的操作：RDMA WRITE FIRST/RDMA WRITE only/RDMA WRITE only with immediate(本项目不支持)/RDMA READ Request
	case RETH_HEADER: // 如果是RETH头，则进入当前处理函数
		if (!input.empty())
		{
			input.read(currWord);				 // 首先将去除了IBH的IB报文读取到currWord中
			rdmaHeader.parseWord(currWord.data); // 从IB报文中解析出RETH头

			if (metaWritten && WIDTH <= RETH_SIZE) // 如果metaWritten标志位书写完成且WIDTH<=RETH_SIZE，即我的数据段宽度还没有一个RETH头大，基本上是不会进来这里的
			{
				output.write(currWord); // 将currWord写进output中，一般不会进来
			}

			if (rdmaHeader.isReady()) // 如果成功解析出RETH
			{
				if (!metaWritten) // 如果还没有对RETH中的元数据进行操作
				{
					if (opCode == RC_RDMA_READ_REQUEST || opCode == RC_RDMA_READ_CONSISTENT_REQUEST) // 如果对端发来的命令是RC_RDMA_READ_REQUEST或者RC_RDMA_READ_CONSISTENT_REQUEST
					{
						// struct exhMeta
						// {
						// 	bool		isNak;
						// 	ap_uint<22> numPkg; //TODO how many bits does this need?
						// };
						exhMetaFifo.write(exhMeta(false, (rdmaHeader.getLength() + (PMTU - 1)) / PMTU)); // 首先表示不是NAK，其次获得他要读取多少个packet
					}
					else
					{
						exhMetaFifo.write(exhMeta(false)); // 如果是别的操作，就直接表示这条指令不是NAK就行
					}
					metaOut.write(ExHeader<WIDTH>(rdmaHeader)); // 直接将rdmaHeader放置到metaOut中
					metaWritten = true;							// metaWritten设为true，表示已将RETH头中的元数据取出
				}
				if (checkIfWriteOrPartReq(opCode) && WIDTH > RETH_SIZE) // 检查是否为Write类型指令或Part类型指令，且数据段宽度大于RETH长度
				{
					output.write(currWord); // 将currWord写进output中
				}
			}
			if (currWord.last) // 如果当前数据段是最后一个数据段
			{
				rdmaHeader.clear();
				state = META;
			}
		}
		break;
#if POINTER_CHASING_EN
	case RPCH_HEADER:
		if (!input.empty())
		{
			input.read(currWord);
			pointerChasingHeader.parseWord(currWord.data);

			if (pointerChasingHeader.isReady())
			{
				if (!metaWritten)
				{
					// if (opCode == RC_RDMA_READ_REQUEST)
					{
						exhMetaFifo.write(exhMeta(false, (pointerChasingHeader.getLength() + (PMTU - 1)) / PMTU));
					}
					/*else
					{
						exhMetaFifo.write(exhMeta(false));
					}*/
					metaOut.write(ExHeader<WIDTH>(pointerChasingHeader));
					metaWritten = true;
				}
				// This works together with disabling the RightShift, Assumes WIDTH == 64
				else
				{
					// output.write(currWord);
				}
			}
			if (currWord.last)
			{
				pointerChasingHeader.clear();
				state = META;
			}
		}
		break;
#endif
	case NO_HEADER: // 则说明BTH后面直接跟的是Payload，即牵扯到RDMA WRITE Middle/RDMA WRITE Last/RDMA READ response Middle这三种情况
		if (!input.empty())
		{
			input.read(currWord); // 将数据报文读取到currWord中
			// std::cout << "EXH NO HEADER: ";
			// print(std::cout, currWord);
			// std::cout << std::endl;
			output.write(currWord); // 直接将报文写入到output中
			if (!metaWritten)
			{
				exhMetaFifo.write(exhMeta(false)); // exhMetaFifo表明当前输入包不是NAK包
				metaOut.write(ExHeader<WIDTH>());  // metaOut初始化一个空的
				metaWritten = true;
			}
			if (currWord.last)
			{
				state = META;
			}
		}
		break;
	} // switch
}

/**
 * PSN handling page
 * page 298, responser receiving requests
 * page 346, requester receiving responses
 *
 * NAK processing, NAK has to be in-order
 * Responder: - send NAK do not update PSN
 * page 336   - do not send futher ACKs or NAKs until valid PKG is received
 * Requester: - retransmit data
 * page 349   - do not increment epsn
 */
// TODO check if RC_ACK is a NAK
// TODO validate response is consistent with request
// TODO actually any response in Unack region is valid, not just the next one.

/*
	1. 函数功能：
	2. 参数解析
		（1)metaIn->rx_ibh2fsm_MetaFifo，ibh到fsm的元数据，包括requester端指定的OpCode，P_KEY，Destination QPN，PSN以及表明PSN有效的布尔变量true->in
		（2)exhMetaFifo->rx_exhMetaFifo,从ETH中抓取出的元数据
			（1)如果处理的是RETH头，且处理的指令类型是RDMA Read Request，则exhMetaFifo中存储"该包不是NAK包并存储要读取的packet的数量"；如果不是RDMA Read Request类型的指令，则只存储该包不是NAK包,numPkg默认为1
			（2)如果处理的是AETH头，则将AETH头中的是否是NAK包标志位赋值给exhMetaFifo，numPkg默认为1
			（3)如果处理的报文中没有ETH头，则在exhMetaFifo中写入该包不是NAK包,numPkg默认为1
		（3)stateTable_rsp->stateTable2rxIbh_rsp
			b. state_table函数根据a发送过去的数据返回epsn,oldest_outstanding_psn,max_forward,retryCounter
		（4)stateTable_upd_req->rxIbh2stateTable_upd_req,存储本地QPN与当前处理数据包是否是Response包，即如下包类型RC_RDMA_READ_RESP_FIRST || RC_RDMA_READ_RESP_MIDDLE || RC_RDMA_READ_RESP_LAST || RC_RDMA_READ_RESP_ONLY || RC_ACK
			a. 首先将local qpn与当前数据包是否为response作为request，发送给state_table函数
			c. 在判断所来的数据包是一个正常的数据包，未出现重复和invalid后，将local_qpn，remote_psn+numPkg(write=1，而在RDMA Read Request情况下会包含包的数量)以及当前包是否为response包再发送给state_table，并将write设为ture，retry_counter设为0x7
		（5)metaOut->rx_fsm2exh_MetaFifo，包含OpCode，P_KEY，L_QPN，R_PSN以及表明PSN有效的布尔变量true->out
		（6)ibhEventFifo->rx_ibhEventFifo->out
		（7)ibhDropFifo->rx_ibhDropFifo，判定是否有包需要drop->out
			(1)如果接受的包是有效的且有序的，不需要drop的话，返回一个false
			(2)如果接受的包是duplicate包，且为RDMA Read请求的话，根据Infiniband协议需要重新执行该协议，因此返回一个false
			(3)如果接收的包是duplicate包，且为RDMA Write请求的话，我们只需要返回一个ACK即可，该包不需要被执行，因此该包被drop掉即可
		（8)ibhDropMetaFifo->rx_ibhDropMetaFifo,包含两个参数isDrop和ackOnly->out
			该参数主要应用于后续的ipUdpMetaHandler函数中，作为if语句中的判断条件，判断是否需要将若干元数据提取出来，提取的条件是：isDrop==True && ackOnly==True，只要任何一个条件不满足都不行
			(1)如果当前包是in-order，均置为false->out
			(2)如果当前包是duplicate的状态，则设置为
		（9)regInvalidPsnDropCount->regInvalidPsnDropCount，记录被drop掉的包的数量->out
			(1)duplicate包的条件判断中被应用到，当接收的Packet是write请求的duplicate包时，按照Infiniband协议，我们只需要返回一个ACK，不需要执行Request，因此该包被drop掉
*/

void rx_ibh_fsm(stream<ibhMeta> &metaIn,
				stream<exhMeta> &exhMetaFifo,
				stream<rxStateRsp> &stateTable_rsp,
				stream<rxStateReq> &stateTable_upd_req,
				stream<ibhMeta> &metaOut,
				stream<ackEvent> &ibhEventFifo,
				stream<bool> &ibhDropFifo,
				stream<fwdPolicy> &ibhDropMetaFifo,
#if RETRANS_EN

				stream<rxTimerUpdate> &rxClearTimer_req,
				stream<retransRelease> &rx2retrans_release_upd,
#endif
				ap_uint<32> &regInvalidPsnDropCount)
{
#pragma region
#pragma HLS inline off
#pragma HLS pipeline II = 1

	enum fsmStateType
	{
		LOAD,
		PROCESS
	};									 // 定义两个状态，LOAD和PROCESS
	static fsmStateType fsmState = LOAD; // 定义初始状态为LOAD

	static ibhMeta meta;				   // 定义ibhMeta类型的对象meta
	static exhMeta emeta;				   // 定义exhMeta类型的对象emeta
	static bool isResponse;				   // 定义布尔类型变量isResponse
	static ap_uint<32> droppedPackets = 0; // 定义一个ap_unit类型的变量droppedPackets
	rxStateRsp qpState;					   // stateTable Response的内容

	switch (fsmState)
	{
	case LOAD:
		if (!metaIn.empty() && !exhMetaFifo.empty()) // 如果metaIn和exhMetaFifo不为空，也就是IB头和ETH头都被解析出来了
		{
			metaIn.read(meta);							// 将metaIn中的数据读取到meta中去，包含Requester端发送的OpCode，P_KEY，Destination QPN，R_PSN以及表明PSN有效的布尔变量true
			exhMetaFifo.read(emeta);					// 将exhMetaFifo中的数据读取到emeta中，主要用来标记是否为NAK包与Read时需要读取的数据的长度
			isResponse = checkIfResponse(meta.op_code); // 根据meta中的opcode判断该包是否是response包，即如下包类型RC_RDMA_READ_RESP_FIRST || RC_RDMA_READ_RESP_MIDDLE || RC_RDMA_READ_RESP_LAST || RC_RDMA_READ_RESP_ONLY || RC_ACK
			// stateTable update request? stateTable主要是用来存储PSN的，利用QPN作为key，来查询PSN
			stateTable_upd_req.write(rxStateReq(meta.dest_qp, isResponse)); // 将meta中的dest_qp变量，也就是本端的loacl qpn和是否是response包写入stateTable_upd_req中
			fsmState = PROCESS;												// 状态调整为PROCESS状态
		}
		break;
	case PROCESS:
		// TODO TIME-WAIT
		// TODO consider opCode??                        // 当包没有产生任何异常，即重复和无效时，进这个if语句
		if (!stateTable_rsp.empty()) // 当第二轮执行时，已经获取了stateTable_entry[qpn]了，这其中主要包括了epsn(resp_epsn),oldest_outstanding_psn(resp_old_outstanding), max_forward(resp_epsn), retryCounter(retryCounter）四个选项
		{
			stateTable_rsp.read(qpState); // 将state_table返回的内容读至qpState中
			// ap_uint<24> oldest_outstanding_psn = qpState.epsn- 8388608;
			// TODO compute or store oldest outstanding??
			// TODO also increment oldest outstanding
			// Check if in order
			// TODO Update oldest_oustanding_psn
			// TODO this is not working with coalescing ACKs
			//  std::cout << "epsn: " << qpState.epsn << ", packet psn: " << meta.psn << std::endl;  // 期待的PSN与实际的数据包中传送进来的PSN
			//  For requests we require total order, for responses, there is potential ACK coalescing, see page 299
			//  For requests, max_forward == epsn
			// TODO how to deal with other responses if they are not in order??
			/*
				1. 第一个条件：qpState.epsn == meta.psn指的是本端作为RX路径上的responder端，通过判断接受到的packet中的BTH->PSN与本端state_table[qpn]中存储的ePSN是否相同;或者本端作为requester端，接收responder端返回的read response
				2. 第二个条件：meta.op_code == RC_ACK && ((qpState.epsn <= meta.psn && meta.psn <= qpState.max_forward) || ((qpState.epsn <= meta.psn || meta.psn <= qpState.max_forward) && qpState.max_forward < qpState.epsn))拆分如下：
				（1）meta.op_code == RC_ACK &&
				（2）(qpState.epsn <= meta.psn && meta.psn <= qpState.max_forward) ||
				（3）(qpState.epsn <= meta.psn || meta.psn <= qpState.max_forward) && qpState.max_forward < qpState.epsn
				也就是在满足条件(1)的前提下，满足条件(2)或者条件(3)就行，接下来进行逐条件解析
				3. 条件二的逐条解析
				前提条件：当时requester端的response时，传递回来的参数应该是req_old_unack,req_old_valid,req_next_psn-1,retryCounter(0)，但是这三个参数分别对应着：qpState.epsn,qpState.oldest_outstanding_psn,qpState.max_forward，即：
					qpState.epsn->req_old_unack
					qpState.oldest_outstanding_psn->req_old_valid
					qpState.max_forward->req_next_psn-1
				（1）meta.op_code == RC_ACK，表明当前我是作为requester，接收responder返回的response
				（2）req_old_unack <= meta.psn && meta.psn <= req_next_psn-1
					a. 当前的response psn处于一个范围内，即[Oldest unacknowledged request psn, excepted response of most recently sent request packet psn]
				（3）(req_old_unack <= meta.psn || meta.psn <= req_next_psn-1) && req_next_psn-1 < req_old_unack
					a. 由于PSNmodel是一个循环列表，有时候会出现	Maximum Forward Prgress（req_next_psn-1）小，Oldest valid request大的情况，
					b. 我感觉这里有问题，没有考虑的很全面，有可能req_old_unack和req_next_psn-1都在左边，都小于req_old_valid
			*/
			if (qpState.epsn == meta.psn || (meta.op_code == RC_ACK && ((qpState.epsn <= meta.psn && meta.psn <= qpState.max_forward) || ((qpState.epsn <= meta.psn || meta.psn <= qpState.max_forward) && qpState.max_forward < qpState.epsn))))
			// if ((qpState.epsn <= meta.psn && meta.psn <= qpState.max_forward)
			//		|| ((qpState.epsn <= meta.psn || meta.psn <= qpState.max_forward) && qpState.max_forward < qpState.epsn))
			{
				// std::cout << "NOT DROPPING PSN:" << meta.psn << std::endl;   // 表明不需要丟包，正常执行
				// regNotDropping = 1;
				// 如果不是RC_ACK的包或者任何RDMA Read的包
				if (meta.op_code != RC_ACK && meta.op_code != RC_RDMA_READ_REQUEST && meta.op_code != RC_RDMA_READ_POINTER_REQUEST && meta.op_code != RC_RDMA_READ_CONSISTENT_REQUEST) // TODO do length check instead
				{
					ibhDropFifo.write(false); // 表明接受的包是有序的，不需要drop掉他
				}
				ibhDropMetaFifo.write(fwdPolicy(false, false)); // ibhDropMetaFifo，包含两个参数isDrop和ackOnly，此处均置为false
				// TODO more meta for ACKs
				metaOut.write(meta); // TODO also send for non successful packets，将meta数据写入metaOut中，包含OpCode，P_KEY，L_QPN，R_PSN以及表明PSN有效的布尔变量true
				// Update psn
				// TODO for last param we need vaddr here!
				if (!emeta.isNak) // 如果不是一个NAK的包，再生成一个stateTable_upd_req，用于更新state_stable[qpn]表项，包含epsn和retryCounter
				{
					// emeta就是ETH Meta，ETH有两种，一种是AETH，一种是RETH
					// （1)如果处理的是RETH头，且处理的指令类型是RDMA Read Request，则exhMetaFifo中存储"该包不是NAK包并存储要读取的packet的数量"；如果不是RDMA Read Request类型的指令，则只存储该包不是NAK包,numPkg默认为1
					// （2)如果处理的是AETH头，则将AETH头中的是否是NAK包标志位赋值给exhMetaFifo，numPkg默认为1，RDMA Read Response也是一个一个回来的
					// （3)如果处理的报文中没有ETH头，则在exhMetaFifo中写入该包不是NAK包,numPkg默认为1
					stateTable_upd_req.write(rxStateReq(meta.dest_qp, meta.psn + emeta.numPkg, isResponse)); // 再生成一个stateTable_upd_req请求，包含local_qpn，remote_psn+numPkg(write=1，而在RDMA Read Request情况下会包含包的数量) 以及当前包是否为response包，并将write设为ture
				}
#if RETRANS_EN

				// CASE Requester: Update oldest-unacked-reqeust
				if (isResponse && !emeta.isNak)
				{
					std::cout << "retrans release, psn: " << meta.psn << std::endl;
					rx2retrans_release_upd.write(retransRelease(meta.dest_qp, meta.psn));
				}
				// CASE Requester: Check if no oustanding requests -> stop timer
				if (isResponse && meta.op_code != RC_RDMA_READ_RESP_MIDDLE)
				{
					rxClearTimer_req.write(rxTimerUpdate(meta.dest_qp, meta.psn == qpState.max_forward));
#ifndef __SYNTHESIS__
					if (meta.psn == qpState.max_forward)
					{
						std::cout << "clearing transport timer at psn: " << meta.psn << std::endl;
					}
#endif
				}
#endif
			}
			// Check for duplicates
			// For response: epsn = old_unack, old_oustanding = old_valid
			/*
				一、如果我是responder端，即接收requester端发来的request，符合该if语句内第1、2种情况
				1. qpState.oldest_outstanding_psn < qpState.epsn && meta.psn < qpState.epsn && meta.psn >= qpState.oldest_outstanding_psn
				（1）这种情况指的是Duplicate region区域是连续的，且来的request psn位于duplicate区域内
				2. qpState.oldest_outstanding_psn > qpState.epsn && (meta.psn < qpState.epsn || meta.psn >= qpState.oldest_outstanding_psn
				（1）这是第二种情况，即Duplication不连续，左一半右一半且当前PSN位于duplicate region内
				二、如果我是requester端，即接收responder端传回来的response，符合该if语句内的第3种情况
				（1）如果我是requester端，接收到的response是duplicate的话，如果不是ACK包，那就是RDMA Read Response情况，则直接drop掉
				（2）如果是ACK，则将ibhDropMetaFifo的isDrop和ackOnly设置为True，False

			*/
			else if ((qpState.oldest_outstanding_psn < qpState.epsn && meta.psn < qpState.epsn && meta.psn >= qpState.oldest_outstanding_psn) || (qpState.oldest_outstanding_psn > qpState.epsn && (meta.psn < qpState.epsn || meta.psn >= qpState.oldest_outstanding_psn)))
			{
				// Read request re-execute
				// 按照Infiniband协议，如果是RDMA Read请求的话，需要重新执行一遍Read请求
				if (meta.op_code == RC_RDMA_READ_REQUEST || meta.op_code == RC_RDMA_READ_POINTER_REQUEST || meta.op_code == RC_RDMA_READ_CONSISTENT_REQUEST)
				{
					std::cout << "DUPLICATE READ_REQ PSN:" << meta.psn << std::endl;
					ibhDropFifo.write(false);
					ibhDropMetaFifo.write(fwdPolicy(false, false)); // isDrop设置为false，ackonly设置为false，表明该数据包还需要继续执行
					metaOut.write(meta);
					// No release required
					// stateTable_upd_req.write(rxStateReq(meta.dest_qp, meta.psn, meta.partition_key, 0)); //TODO always +1??
				}
				// Write requests acknowledge, see page 313
				//  按照Infiniband协议，如果是RDMA Write请求，无需执行Write Request中的指令，只需要返回一个ACK就行，因此需要drop这个包，不需要再执行了
				else if (checkIfWriteOrPartReq(meta.op_code))
				{
					// Send out ACK
					ibhEventFifo.write(ackEvent(meta.dest_qp)); // TODO do we need PSN???
					std::cout << "DROPPING DUPLICATE PSN:" << meta.psn << std::endl;
					droppedPackets++;						 // drop包数量+1
					regInvalidPsnDropCount = droppedPackets; // 记录drop包的数量
					ibhDropFifo.write(true);				 // 标记当前包需要被drop掉
					// Meta is required for ACK, TODO no longer
					ibhDropMetaFifo.write(fwdPolicy(false, true)); // isDrop设置为false，ackonly设置为true，只要不是全false，在ipUdpMetaHandler函数中就不会触发元数据的提取
				}
				// TODO what about duplicate responses
				// drop them
				else
				{
					// Case Requester: Valid ACKs -> reset timer TODO
					// for now we just drop everything
					if (meta.op_code != RC_ACK) // TODO do length check instead
					{
						ibhDropFifo.write(true);
					}
					ibhDropMetaFifo.write(fwdPolicy(true, false));
				}
			}
			/*
				此处判断接收到的包是invalid，即其PSN位于Invalid的范围内
				一、
			*/
			else // completely invalid
			{
				// behavior, see page 313
				std::cout << "DROPPING INVALID PSN:" << meta.psn << std::endl;
				droppedPackets++;
				regInvalidPsnDropCount = droppedPackets;
				ibhDropMetaFifo.write(fwdPolicy(true, false)); // 如果是invalid包的话ibhDropMetaFifo设置为true，false
				// Issue NAK TODO NAK has to be in sequence
				if (meta.op_code != RC_ACK) // 如果接受的不是ACK包
				{
					ibhDropFifo.write(true); // 直接Drop掉
					// Do not generate further ACK/NAKs until we received a valid pkg
					if (qpState.retryCounter == 0x7) // 如果retryCounter是0x7的话，即为无限retry，
					{
						if (isResponse) // 如果是RDMA Read的Response
						{
							ibhEventFifo.write(ackEvent(meta.dest_qp, meta.psn, true));
						}
						else
						{
							// Setting NAK to epsn, since otherwise epsn-1 is used
							ibhEventFifo.write(ackEvent(meta.dest_qp, qpState.epsn, true));
						}
						qpState.retryCounter--;
					}
					// We do not increment PSN
					stateTable_upd_req.write(rxStateReq(meta.dest_qp, qpState.epsn, qpState.retryCounter, isResponse));
				}
			}

			fsmState = LOAD;
		}
		break;
	}
#pragma endregion
}

// Currently not used!!
/*
	1. 函数功能：根据drop标志位判断是继续当前数据包的解析还是丢掉当前数据包。如果drop为false，则表明需要继续向前执行当前数据包，output就是输入的IB报文；如果drop为true的话，则说明当前包需要被丢掉，因此output值为空
	2. 参数解析
		（1)input->rx_exh2dropFifo,（带各种IB头的）IB报文，from rx_process_exh->in
			a. 如果处理的是RETH头且为write或part类型指令，则直接将解析完ETH头后的IB报文写入output中
			b. 如果处理的是AETH头且为RDMA READ response First/RDMA READ response Last/RDMA READ response only这几种情况，即牵扯到数据传输的，则给output赋值报文内容，如果为RC ACK，就不需要对output进行赋值了
			c. 如果处理的报文中没有ETH头，则直接将输入赋值给output，即payload
		（2)metaIn->rx_ibhDropFifo,判定是否有包需要drop，即接受的包是否有效的且有序的。如果不需要drop的话，该值为false
		（3)output->rx_ibhDrop2exhFifo,如果drop为false，则表明需要继续向前执行当前数据包，output就是输入的IB报文；如果drop为true的话，则说明当前包需要被丢掉，因此output值为空
*/
template <int WIDTH>
void drop_ooo_ibh(stream<net_axis<WIDTH>> &input,
				  stream<bool> &metaIn,
				  stream<net_axis<WIDTH>> &output)
{
#pragma HLS inline off
#pragma HLS pipeline II = 1

	enum fsmType
	{
		META,
		FWD,
		DROP
	};							 // 定义三个状态，META，FWD(forward)和DROP
	static fsmType state = META; // 初始状态定位META

	bool drop;
	net_axis<WIDTH> currWord;

	switch (state)
	{
	case META:
		if (!metaIn.empty()) // 判断输入报文是否为空
		{
			metaIn.read(drop); // 将metaIn中存储的是否要对包进行drop写进布尔变量drop中
			if (drop)
			{
				state = DROP; // 如果需要对该包进行drop，则跳转至drop状态，否则跳转至forward状态
			}
			else
			{
				state = FWD;
			}
		}
		break;
	case FWD:
		if (!input.empty()) // 如果不需要对包进行drop
		{
			input.read(currWord);
			output.write(currWord); // 则直接将输入的IB报文写到output中
			if (currWord.last)		// 如果是最后一个数据段，state重新变为META状态
			{
				state = META;
			}
		}
		break;
	case DROP:
		if (!input.empty())
		{
			input.read(currWord); // 如果需要对包进行drop，则不往下继续传递这个数据包了
			if (currWord.last)	  // 如果是最后一个数据段，state重新变为META状态
			{
				state = META;
			}
		}
		break;
	} // switch
}

// Followed by ICRC TODO remove ICRC
/* For reliable connections, page 246, 266, 269
 * RDM WRITE ONLY: RETH, PayLd
 * RDMA WRITE FIRST: RETH, PayLd
 * RDMA WRITE MIDDLE: PayLd
 * RDMA WRITE LAST: PayLd
 * RDMA READ REQUEST: RETH
 * RDMA READ RESPONSE ONLY: AETH, PayLd
 * RDMA READ RESPONSE FIRST: AETH, PayLd
 * RDMA READ RESPONSE MIDDLE: PayLd
 * RDMA READ RESPONSE LAST: AETH, PayLd
 * ACK: AETH
 */
/*
	1. 函数功能：解析RETH包，获取报文长度、当前数据包长度，初始化并根据相应参数更新msn_table[qpn]等
	2. 参数解析：
		(1)metaIn->rx_fsm2exh_MetaFifo,包含OpCode，P_KEY，L_QPN，R_PSN以及表明PSN有效的布尔变量true,from rx_ibh_fsm->in
		(2)udpLengthFifo->exh_lengthFifo,存储UDP头+UDP报文的长度,from ipUdpMetaHandler->in
		(3)msnTable2rxExh_rsp->msnTable2rxExh_rsp,from msn_table->in
			b. msn_table函数根据步骤a中发送的local_qpn返回初始化的msn_table表项，msn_table[qpn]
		(4)rx_readReqAddr_pop_rsp->rx_readReqAddr_pop_rsp，只有RDMA Read Resp only/first时才有用，此处没用到->in
		(5)headerInput->rx_drop2exhFsm_MetaFifo,存储ETH头的内容,from ipUdpMetaHandler->in
			如果处理的是RETH包，metaOut中存储RETH包的全部8byte内容;如果处理的是AETH包，metaOut中存储AETH包的全部4byte内容;如果处理的报文中没有ETH头，metaOut被初始化一个空的对象
		(6)memoryWriteCmd->m_axis_mem_write_cmd，生成的Memory Write指令，包括从RETH中抓出来的要写入的虚拟地址，payload长度以及路由方式：DMA->out
		(7)readRequestFifo->rx_readRequestFifo，生成readRequest，包括qpn,RETH.vaddr,RETH.DMA_Length,IBH.psn.ROUTE_DMA->out
		(8)rxExh2msnTable_upd_req->rxExh2msnTable_upd_req, to msn_table->out
			a. 将meta中的dest_qp部分即local qpn打包成一个rxExh2msnTable_upd_req发给msn_table，此时write标志位设为false
			c. 当为RDMA Write First/Only时，msn_table[qpn].msn += 1
										   msn_table[qpn].vaddr = RETH.vaddr+payloadLength  // 如果时RDMA First，也就是还会有RDMA Middle或Last，是同一个写操作，因此下次来的时候就从新的地址开始写了
										   msn_table[qpn].dma_length = remainingLength      // 还未写完的数据的长度
			   当为RDMA Write Middle/Last时，msn_table[qpn].msn += 1
											msn_table[qpn].vaddr = msn_table[qpn].vaddr+payloadLength  // 直接在上次的地址上相加就好
											msn_table[qpn].dma_length = remainingLength
			   当为RDMA Read Request时， msn_table[qpn].msn=msn_table[qpn].msn+1
										msn_table[qpn].vaddr=0
										msn_table[qpn].dma_length=0
		(9)readReqTable_upd_req->rx_readReqTable_upd_req,未在此函数中出现
		(10)rx_readReqAddr_pop_req->rx_readReqAddr_pop_req，如果数据报文中的操作类型是RC_RDMA_READ_RESP_ONLY或RC_RDMA_READ_RESP_FIRST，则将local qpn写进rx_readReqAddr_pop_req中，此处用不到->out
		(11)rx_exhEventMetaFifo->rx_exhEventMetaFifo,rx_exh_fsm通过该变量请求一个ACK事件，存储local qpn，同时设psn(0), validPsn(false), isNak(false)，只适用于RDMA Write->out
		(12)rx_pkgSplitTypeFifo->rx_pkgSplitTypeFifo，存储操作类型和route类型，只适用于RDMA Write Request，均为ROUTE_DMA->out
		(13)rx_pkgShiftTypeFifo->rx_pkgShiftTypeFifo，只适用于RDMA Read Request->out
			RDMA WRITE FIRST/ONLY时,将rx_pkgShiftTypeFifo设为SHIFT_RETH
			RDMA WRITE Middle/Last时，将rx_pkgShiftTypeFifo设为SHIFT_NONE
*/
template <int WIDTH>
void rx_exh_fsm(stream<ibhMeta> &metaIn,
				stream<ap_uint<16>> &udpLengthFifo,
				stream<dmaState> &msnTable2rxExh_rsp,
#if RETRANS_EN
				stream<rxReadReqRsp> &readReqTable_rsp,
#endif
				stream<ap_uint<64>> &rx_readReqAddr_pop_rsp,
				stream<ExHeader<WIDTH>> &headerInput,
				stream<routedMemCmd> &memoryWriteCmd,
				stream<readRequest> &readRequestFifo,
#if POINTER_CHASING_EN
				stream<ptrChaseMeta> &m_axis_rx_pcmeta,
#endif
				stream<rxMsnReq> &rxExh2msnTable_upd_req,
				// #if RETRANS_EN
				stream<rxReadReqUpdate> &readReqTable_upd_req,
				// #endif
				stream<mqPopReq> &rx_readReqAddr_pop_req,
				stream<ackEvent> &rx_exhEventMetaFifo,
#if RETRANS_EN
				stream<retransmission> &rx2retrans_req,
#endif
				stream<pkgSplitType> &rx_pkgSplitTypeFifo,
				stream<pkgShiftType> &rx_pkgShiftTypeFifo)
{
#pragma HLS inline off
#pragma HLS pipeline II = 1

	enum pe_fsmStateType
	{
		META,
		DMA_META,
		DATA
	};										   // 创建一个状态机，包含三个状态META，DMA_META,DATA
	static pe_fsmStateType pe_fsmState = META; // 初始状态设置为META
	static ibhMeta meta;					   // 创建一个ibhMeta类型的对象meta
	net_axis<WIDTH> currWord;				   // 创建一个net_axis<512>类型的对象currWord
	static ExHeader<WIDTH> exHeader;
	static dmaState dmaMeta;
	static ap_uint<16> udpLength;
	ap_uint<32> payLoadLength;
	static bool consumeReadAddr;
	static rxReadReqRsp readReqMeta;
	static ap_uint<64> readReqAddr;
	switch (pe_fsmState)
	{
	case META:										 // 初始状态为META
		if (!metaIn.empty() && !headerInput.empty()) // 如果metaIn和headerInput均不为空，即（包含OpCode，P_KEY，L_QPN，R_PSN以及表明PSN有效的布尔变量true)和ETH包中的内容都不为空
		{
			metaIn.read(meta);			// 将metaIn中的内容读取进meta中，即OpCode，P_KEY，L_QPN，R_PSN以及表明PSN有效的布尔变量true
			headerInput.read(exHeader); // 将ETH头读取到exHeader中

			rxExh2msnTable_upd_req.write(rxMsnReq(meta.dest_qp)); // 将meta中的dest_qp部分即local qpn打包成一个rxExh2msnTable_upd_req发给msn_table，此时write标志位设为false
			consumeReadAddr = false;							  // consumeReadAddr标志位设为false
#if RETRANS_EN1
			if (meta.op_code == RC_ACK)
			{
				readReqTable_upd_req.write(rxReadReqUpdate(meta.dest_qp));
			}
#endif
			if (meta.op_code == RC_RDMA_READ_RESP_ONLY || meta.op_code == RC_RDMA_READ_RESP_FIRST) // 如果数据报文中的操作类型是RC_RDMA_READ_RESP_ONLY或RC_RDMA_READ_RESP_FIRST
			{
				consumeReadAddr = true;								  // consumeReadAddr标志位设为true
				rx_readReqAddr_pop_req.write(mqPopReq(meta.dest_qp)); // 将local_qpn写入rx_readReqAddr_pop_req中
			}
			pe_fsmState = DMA_META; // 状态跳转至DMA_META
		}
		break;
	case DMA_META:
#if !(RETRANS_EN) // 我们主要关注!msnTable2rxExh_rsp.empty() && !udpLengthFifo.empty()选项，此时msnTable2rxExh_rsp返回了初始化的msn_table[qpn];udpLengthFifo中则了存储UDP头+UDP报文的长度
		if (!msnTable2rxExh_rsp.empty() && !udpLengthFifo.empty() && (!consumeReadAddr || !rx_readReqAddr_pop_rsp.empty()))
#else
		if (!msnTable2rxExh_rsp.empty() && !udpLengthFifo.empty() && (!consumeReadAddr || !rx_readReqAddr_pop_rsp.empty()) && (meta.op_code != RC_ACK || !readReqTable_rsp.empty()))
#endif
		{
			msnTable2rxExh_rsp.read(dmaMeta); // 将初始化的msn_table[qpn]读取至dmaMeta中
			udpLengthFifo.read(udpLength);	  // 将udpLengthFifo即（UDP头+UDP报文）的长度读取进udpLength中
#if RETRANS_EN
			if (meta.op_code == RC_ACK)
			{
				readReqTable_rsp.read(readReqMeta);
			}
#endif
			if (consumeReadAddr)
			{
				rx_readReqAddr_pop_rsp.read(readReqAddr); // 如果数据报文中的操作类型是RC_RDMA_READ_RESP_ONLY或RC_RDMA_READ_RESP_FIRST则将rx_readReqAddr_pop_rsp读进readReqAddr中
			}
			pe_fsmState = DATA; // 状态切换至DATA
		}
		break;
	case DATA:				  // TODO merge with DMA_META
		switch (meta.op_code) // 第三次执行rx_exh_fsm函数时，进入DATA状态
		{
		case RC_RDMA_WRITE_ONLY:
		// case RC_RDMA_WRITE_ONLY_WIT_IMD:
		case RC_RDMA_WRITE_FIRST:
		case RC_RDMA_PART_ONLY:
		case RC_RDMA_PART_FIRST: // 如果是RDMA WRITE FIRST或者是RDMA WRITE ONLY，说明时BTH+RETH+PAYLOAD
		{
			// [BTH][RETH][PayLd]
			RdmaExHeader<WIDTH> rdmaHeader = exHeader.getRdmaHeader();																	 //  其实就是将RETH头读取到rdmaHeader中来
			axiRoute route = ((meta.op_code == RC_RDMA_WRITE_ONLY) || (meta.op_code == RC_RDMA_WRITE_FIRST)) ? ROUTE_DMA : ROUTE_CUSTOM; // 定义一个axiRoute类型的对象route，如果是RC_RDMA_WRITE_ONLY或者FIRST类型的报文，则将route设为ROUTE_DMA

			if (rdmaHeader.getLength() != 0) // 在RETH头中，会存储着RDMA write操作要写的数据量，如果这个值不为零
			{
				// 在rdma write first实例中，DMA Length=0X80=128
				// Compute payload length
				// 计算payload的大小，udpLength=（udp头+udp报文）的长度，8byte是udp头的长度，12byte是BTH的长度，16byte是AETH的长度;在RDMA WRITE FIRST实例中，该值=0x68=104,104-8-12-16-4=64
				payLoadLength = udpLength - (8 + 12 + 16 + 4); // UDP, BTH, RETH, CRC，此处计算出来是64byte
				// compute remaining length
				ap_uint<32> headerLen = rdmaHeader.getLength();
				ap_uint<32> remainingLength = headerLen - payLoadLength; // remain_byte=128-64=64byte，RETH中的DMA Length指的是整个报文的长度，但是我最开始的一个RDMA Write first包中可能只包含了64byte的一个包，剩下的那个包大小是64byte，由下一个WRITE LAST或WRITE MIDDLE写进来

				// Send write request
				if ((meta.op_code == RC_RDMA_WRITE_ONLY) || (meta.op_code == RC_RDMA_WRITE_FIRST)) // 如果是write_first或write_only
				{
					memoryWriteCmd.write(routedMemCmd(rdmaHeader.getVirtualAddress(), payLoadLength, route)); // 生成memoryWriteCmd，包括从RETH中抓出来的要写入的虚拟地址，payload长度以及路由方式：DMA
				}
				else if ((meta.op_code == RC_RDMA_PART_FIRST || (meta.op_code == RC_RDMA_PART_ONLY)))
				{
					memoryWriteCmd.write(routedMemCmd(rdmaHeader.getVirtualAddress(), headerLen, route));
				}
				// Update state
				// TODO msn, only for ONLY??
				// 更新一下msn_table[qpn]，将msn数量+1，当再来一个数据包要进行存储时初始的虚拟地址就变成了rdmaHeader.getVirtualAddress()+payLoadLength，当前报文剩余报文的长度，并将write设为true
				rxExh2msnTable_upd_req.write(rxMsnReq(meta.dest_qp, dmaMeta.msn + 1, rdmaHeader.getVirtualAddress() + payLoadLength, remainingLength));
				// Trigger ACK
				if (meta.op_code != RC_RDMA_WRITE_FIRST)
				{
					rx_exhEventMetaFifo.write(ackEvent(meta.dest_qp)); // TODO does this require PSN??请求一个ACK事件，将local qpn发送给rx_exhEventMetaFifo，同时设psn(0), validPsn(false), isNak(false)
																	   // std::cout << std::hex << "LEGNTH" << header.getLength() << std::endl;
				}
				rx_pkgSplitTypeFifo.write(pkgSplitType(meta.op_code, route)); // 存储操作类型和route类型，如果是RDMA WRITE FIRST/ONLY的话，为ROUTE_DMA
				rx_pkgShiftTypeFifo.write(SHIFT_RETH);						  // 为当操作码为RDMA WRITE FIRST/ONLY时,将rx_pkgShiftTypeFifo设为SHIFT_RETH
				pe_fsmState = META;											  // 状态机退回至初始状态
			}
			break;
		}
		case RC_RDMA_WRITE_MIDDLE:
		case RC_RDMA_WRITE_LAST:
		case RC_RDMA_PART_MIDDLE:
		case RC_RDMA_PART_LAST:
		{
			// [BTH][PayLd]
			/*std::cout << "PROCESS_EXH: ";
			print(std::cout, currWord);
			std::cout << std::endl;*/

			// Fwd data words
			axiRoute route = ((meta.op_code == RC_RDMA_WRITE_MIDDLE) || (meta.op_code == RC_RDMA_WRITE_LAST)) ? ROUTE_DMA : ROUTE_CUSTOM;
			payLoadLength = udpLength - (8 + 12 + 4); // UDP, BTH, CRC，此时没有RETH头了
			// compute remaining length
			ap_uint<32> remainingLength = dmaMeta.dma_length - payLoadLength; // remainingLength = msn_table[qpn].dma_length-payloadLength
			// Send write request
			if ((meta.op_code == RC_RDMA_WRITE_MIDDLE) || (meta.op_code == RC_RDMA_WRITE_LAST))
			{
				memoryWriteCmd.write(routedMemCmd(dmaMeta.vaddr, payLoadLength, route)); // memoryWriteCmd(msn_table[qpn].vaddr,payLoadLength,ROUTE_DMA)
			}
			/*else if ((meta.op_code == RC_RDMA_PART_MIDDLE) || (meta.op_code == RC_RDMA_PART_LAST))
			{
				memoryWriteCmd.write(routedMemCmd(dmaMeta.vaddr, payLoadLength, route));
			}*/
			// TODO msn only on LAST??
			rxExh2msnTable_upd_req.write(rxMsnReq(meta.dest_qp, dmaMeta.msn + 1, dmaMeta.vaddr + payLoadLength, remainingLength)); // 更新msn_table[qpn]
			// Trigger ACK
			if (meta.op_code != RC_RDMA_WRITE_MIDDLE)
			{
				rx_exhEventMetaFifo.write(ackEvent(meta.dest_qp)); // TODO does this require PSN??,请求一个ACK
			}
			rx_pkgSplitTypeFifo.write(pkgSplitType(meta.op_code, route));
			rx_pkgShiftTypeFifo.write(SHIFT_NONE);
			pe_fsmState = META;

#ifndef __SYNTHESIS__
			if ((meta.op_code == RC_RDMA_WRITE_LAST) || (meta.op_code == RC_RDMA_PART_LAST))
			{
				assert(remainingLength == 0);
			}
#endif
			break;
		}
		/*case RC_RDMA_WRITE_LAST_WITH_IMD:
			//TODO sth ;) fire interrupt
			break;*/
		case RC_RDMA_READ_REQUEST:
		case RC_RDMA_READ_CONSISTENT_REQUEST:
		{
			// [BTH][RETH]
			RdmaExHeader<WIDTH> rdmaHeader = exHeader.getRdmaHeader();
			if (rdmaHeader.getLength() != 0)
			{
				axiRoute route = (meta.op_code == RC_RDMA_READ_CONSISTENT_REQUEST) ? ROUTE_CUSTOM : ROUTE_DMA;
				readRequestFifo.write(readRequest(meta.dest_qp, rdmaHeader.getVirtualAddress(), rdmaHeader.getLength(), meta.psn, route)); // readRequestFifo(qpn,RETH.vaddr,RETH.DMA_Length,IBH.psn.ROUTE_DMA)
				rxExh2msnTable_upd_req.write(rxMsnReq(meta.dest_qp, dmaMeta.msn + 1));
			}
			pe_fsmState = META;
			break;
		}
#if POINTER_CHASING_EN
		case RC_RDMA_READ_POINTER_REQUEST:
		{
			// [BTH][RPCH]
			RdmaPointerChaseHeader<WIDTH> pcHeader = exHeader.getPointerChasingHeader();
			if (pcHeader.getLength() != 0)
			{
				readRequestFifo.write(readRequest(meta.dest_qp, pcHeader.getVirtualAddress(), pcHeader.getLength(), meta.psn, ROUTE_CUSTOM));
				m_axis_rx_pcmeta.write(ptrChaseMeta(pcHeader.getPredicateKey(), pcHeader.getPredicateMask(), pcHeader.getPredicateOp(), pcHeader.getPtrOffset(), pcHeader.getIsRelPtr(), pcHeader.getNextPtrOffset(), pcHeader.getNextPtrValid()));
				rxExh2msnTable_upd_req.write(rxMsnReq(meta.dest_qp, dmaMeta.msn + 1));
			}
			pe_fsmState = META;
			break;
		}
#endif
		case RC_RDMA_READ_RESP_ONLY:
		case RC_RDMA_READ_RESP_FIRST:
		case RC_RDMA_READ_RESP_LAST:
		{
			// [BTH][AETH][PayLd]
			// AETH for first and last
			AckExHeader<WIDTH> ackHeader = exHeader.getAckHeader();
			if (ackHeader.isNAK())
			{
				// Trigger retransmit
#if RETRANS_EN
				rx2retrans_req.write(retransmission(meta.dest_qp, meta.psn));
#endif
			}
			else
			{
				readReqTable_upd_req.write((rxReadReqUpdate(meta.dest_qp, meta.psn)));
			}
			// Write out meta
			payLoadLength = udpLength - (8 + 12 + 4 + 4); // UDP, BTH, AETH, CRC
			rx_pkgShiftTypeFifo.write(SHIFT_AETH);
			if (meta.op_code != RC_RDMA_READ_RESP_LAST)
			{
				memoryWriteCmd.write(routedMemCmd(readReqAddr, payLoadLength));
				// TODO maybe not the best way to store the vaddr in the msnTable
				rxExh2msnTable_upd_req.write(rxMsnReq(meta.dest_qp, dmaMeta.msn, readReqAddr + payLoadLength, 0));
			}
			else
			{
				memoryWriteCmd.write(routedMemCmd(dmaMeta.vaddr, payLoadLength));
			}
			rx_pkgSplitTypeFifo.write(pkgSplitType(meta.op_code));
			pe_fsmState = META;
			break;
		}
		case RC_RDMA_READ_RESP_MIDDLE:
			// [BTH][PayLd]
			payLoadLength = udpLength - (8 + 12 + 4); // UDP, BTH, CRC
			rx_pkgShiftTypeFifo.write(SHIFT_NONE);
			memoryWriteCmd.write(routedMemCmd(dmaMeta.vaddr, payLoadLength));
			// TODO how does msn have to be handled??
			rxExh2msnTable_upd_req.write(rxMsnReq(meta.dest_qp, dmaMeta.msn + 1, dmaMeta.vaddr + payLoadLength, 0));
			rx_pkgSplitTypeFifo.write(pkgSplitType(meta.op_code));
			pe_fsmState = META;
			break;
		case RC_ACK:
		{
			// [BTH][AETH]
			AckExHeader<WIDTH> ackHeader = exHeader.getAckHeader();
			std::cout << "syndrome: " << ackHeader.getSyndrome() << std::endl;
#if RETRANS_EN
			if (ackHeader.isNAK())
			{
				// Trigger retransmit
				rx2retrans_req.write(retransmission(meta.dest_qp, meta.psn));
			}
			else if (readReqMeta.oldest_outstanding_readreq < meta.psn && readReqMeta.valid)
			{
				// Trigger retransmit
				rx2retrans_req.write(retransmission(meta.dest_qp, readReqMeta.oldest_outstanding_readreq));
			}
#endif
			pe_fsmState = META;
			break;
		}
		default:
			break;
		} // switch meta_Opcode
		break;
	} // switch
}

/*
	1. 函数功能：
	2. 参数解析
		（1)metaIn->rx_pkgSplitTypeFifo，存储操作类型opcode和route类型，如果是RDMA WRITE FIRST/ONLY的话，为ROUTE_DMA->in
		（2)input->rx_ibhDrop2exhFifo,经过有效性和重复性检验后的报文，如果没问题，就是输入的IB报文；如果有问题，则为空->in
		（3)rx_exh2rethShiftFifo->rx_exh2rethShiftFifo，如果是带RETH头的数据包，则存储丢掉IB头的IB报文和route路径
		（4)rx_exh2aethShiftFifo->rx_exh2aethShiftFifo，如果是带AETH头的数据包，则存储将丢掉IB头的IB报文写
		（5)rx_exhNoShiftFifo->rx_exhNoShiftFifo，如果不带任何ETH头，则存储去掉IB头的IB报文和路由方式
*/
template <int WIDTH>
void rx_exh_payload(stream<pkgSplitType> &metaIn,
					stream<net_axis<WIDTH>> &input,
					stream<routed_net_axis<WIDTH>> &rx_exh2rethShiftFifo,
					stream<net_axis<WIDTH>> &rx_exh2aethShiftFifo,
					stream<routed_net_axis<WIDTH>> &rx_exhNoShiftFifo)
{
#pragma HLS inline off
#pragma HLS pipeline II = 1

	enum fsmStateType
	{
		META,
		PKG
	};									  // 创建一个状态机，包括两个状态META和PKG
	static fsmStateType rep_state = META; // 初始状态设置为META
	static pkgSplitType meta;			  //

	net_axis<WIDTH> currWord;

	switch (rep_state)
	{
	case META:
		if (!metaIn.empty()) // 第一轮操作时将存储操作类型opcode和route类型赋值给meta
		{
			metaIn.read(meta);
			rep_state = PKG; // 状态跳转至PKG，执行包处理
		}
		break;
	case PKG:
		if (!input.empty()) // 执行第二轮操作的时候
		{
			input.read(currWord); // 如果数据包经过了重复性和有效性检验，就将输入IB报文读取到currWord中

			if (checkIfRethHeader(meta.op_code)) // 检查数据包中是否包含RETH头，如果包含的话
			{
				// std::cout << "EXH PAYLOAD:";
				// print(std::cout, currWord);       // 打印当前的IB报文，此时的IB报文解掉了IBH了
				// std::cout << std::endl;
				rx_exh2rethShiftFifo.write(routed_net_axis<WIDTH>(currWord, meta.route)); // 将丢掉IB头的IB报文和route路径写到rx_exh2rethShiftFifo中
			}
			else if ((meta.op_code == RC_RDMA_READ_RESP_ONLY) || (meta.op_code == RC_RDMA_READ_RESP_FIRST) ||
					 (meta.op_code == RC_RDMA_READ_RESP_LAST))
			{
				rx_exh2aethShiftFifo.write(currWord); // 将丢掉IB头的IB报文写到rx_exh2aethShiftFifo
			}
			else
			{
				rx_exhNoShiftFifo.write(routed_net_axis<WIDTH>(currWord, meta.route)); // 如果不带ETH头，则将当前去掉IB头的IB报文和路由方式存储到rx_exhNoShiftFifo
			}

			if (currWord.last)
			{
				rep_state = META;
			}
		}
		break;
	} // switch
}
/*
	1. 函数功能：处理RDMA Read Request
	2. 参数解析：
		(1)requestIn->rx_readRequestFifo，rx_exh_fsm在处理RETH后生成的readRequest，包括包括qpn,RETH.vaddr,RETH.DMA_Length,IBH.psn.ROUTE_DMA(DMA方式)->in
		(2)memoryReadCmd->rx_remoteMemCmd，产生的Memory Read指令，包含qpn，所读取数据的初始地址(RETH.vaddr)，所读取数据的总长度(RETH.DMA_Length)->out
		(3)readEventFifo->rx_readEvenFifo，产生的读数据事件->out
			a. 如果一个response packet能够装下read request中想要读取的数据的话，则rx_readEvenFifo包含readOpcode(RC_RDMA_READ_RESP_ONLY)，qpn,所读取数据的长度(RETH.DMA_Length)，BTH.psn,validPsn(false), isNak(false)
			b. 如果需要两个response packet才能装下read request中想要读取的数据的话，则rx_readEvenFifo产生两次
				第1次为：readOpcode(RC_RDMA_READ_RESP_FIRST)，qpn,所读取数据的长度(PMTU)，BTH.psn,validPsn(false), isNak(false)
				第2次为：readOpcode(RC_RDMA_READ_RESP_LAST)，qpn,所读取数据的长度(RETH.DMA_Length-PMTU)，BTH.psn+1,validPsn(false), isNak(false)
			c. 如果需要三个及以上的response packet才能装下read request中想要读取的数据的话，则rx_readEvenFifo产生1+1+n次（FIRST,ONLY,MIDDLE*N）
				第1次为：readOpcode(RC_RDMA_READ_RESP_FIRST)，qpn,所读取数据的长度(PMTU)，BTH.psn,validPsn(false), isNak(false)
				第2~n次为：readOpcode(RC_RDMA_READ_RESP_MIDDLE)，qpn,所读取数据的长度(PMTU)，BTH.psn+n-1,validPsn(false), isNak(false)
				最后一次为：readOpcode(RC_RDMA_READ_RESP_LAST)，qpn,所读取数据的长度(RETH.DMA_Length-PMTU*n)，BTH.psn+n,validPsn(false), isNak(false)
*/
void handle_read_requests(stream<readRequest> &requestIn,
						  stream<memCmdInternal> &memoryReadCmd,
						  stream<event> &readEventFifo)
{
#pragma HLS inline off
#pragma HLS pipeline II = 1

	enum hrr_fsmStateType
	{
		META,
		GENERATE
	};											 // 创建两种状态，META，GENERATE
	static hrr_fsmStateType hrr_fsmState = META; // 初始状态设置为META
	static readRequest request;					 // Need QP, dma_length, vaddr
	static txMeta writeMeta;
	ibOpCode readOpcode;
	ap_uint<48> readAddr; // 为什么是48bit的地址？RETH.vaddr是64bit的啊
	ap_uint<32> readLength;
	ap_uint<32> dmaLength;

	switch (hrr_fsmState)
	{
	case META:
		if (!requestIn.empty())
		{
			requestIn.read(request);			 // 将requestIn读取至request中
			readAddr = request.vaddr;			 // 将RETH.vaddr读取进readAddr中
			readLength = request.dma_length;	 // 将RETH.dmaLength读取进readLength中
			dmaLength = request.dma_length;		 // 将RETH.dmaLength读取进dmaLength中
			readOpcode = RC_RDMA_READ_RESP_ONLY; // 初始的Response opCode设置为RC_RDMA_READ_RESP_ONLY
			if (request.dma_length > PMTU)		 // 如果RETH.dmaLength > PMTU，也就是一个packet能返回最大数量
			{
				readLength = PMTU;					  // readLength即读取数据的长度重新设置为PMYU
				request.vaddr += PMTU;				  // 读请求的虚拟地址加PMTU
				request.dma_length -= PMTU;			  // 读请求的数据索取长度减PMTU
				readOpcode = RC_RDMA_READ_RESP_FIRST; // 初始的Response opCode设置为RC_RDMA_READ_RESP_FIRST
				hrr_fsmState = GENERATE;			  // 状态切换为GENERATE
			}
#if !POINTER_CHASING_EN
			memoryReadCmd.write(memCmdInternal(request.qpn, readAddr, dmaLength)); // 生成读内存指令，包含qpn，所读取数据的初始地址，RETH头中的DMA_Length，该值可以大于PMTU
#else
			memoryReadCmd.write(memCmdInternal(request.qpn, readAddr, dmaLength, request.route));
#endif
			// event needs to contain QP, opCode, length, psn                        // 生成一个read Event，包含readOpcode;qpn;读取的数据的长度，如果一个packet中能包含读取的数据，则为RETH.DMA_Length，否则为PMTU;BTH中的PSN
			readEventFifo.write(event(readOpcode, request.qpn, readLength, request.psn));
		}
		break;
	case GENERATE:						 // 如果一个packet中无法装下要读取的所有数据，则进入该状态
		readAddr = request.vaddr;		 // 读取数据的初始地址设置为request.vaddr，相较于初始传递进handle_read_requests函数的地址，此值至少加了1个PMTU
		readLength = request.dma_length; // 查看剩余的需要读取的数据长度
		if (request.dma_length > PMTU)	 // 如果剩余的需要读取的数据长度仍不能用一个packet打包带走，则继续对要读取的数据进行分包
		{
			readLength = PMTU;
			request.vaddr += PMTU;
			request.dma_length -= PMTU;
			readOpcode = RC_RDMA_READ_RESP_MIDDLE; // 此时的Response中BTH的opCode字段就需要设置为RC_RDMA_READ_RESP_MIDDLE了
		}
		else
		{
			readOpcode = RC_RDMA_READ_RESP_LAST; // 否则的话就设置为RC_RDMA_READ_RESP_LAST
			hrr_fsmState = META;
		}
		// memoryReadCmd.write(memCmdInternal(request.qpn, readAddr, readLength, (readOpcode == RC_RDMA_READ_RESP_LAST)));
		request.psn++;
		readEventFifo.write(event(readOpcode, request.qpn, readLength, request.psn)); // 生成一个read Event，包含readOpcode;qpn;读取的数据的长度，如果一个packet中能包含读取的数据，则为RETH.DMA_Length，否则为PMTU;psn++
		break;
	}
}
/*
 * For everything, except READ_RSP, we get PSN from state_table
 */
/*
	1. 函数功能：生成BTH头
	2. 参数解析：
		(1)metaIn->tx_ibhMetaFifo,输入元数据，包含包括opcode=RC_ACK,partition_key=0,dest_qp=loacl.qpn,psn=0,validPSN=false,numPkg=1->in
		(2)dstQpIn->tx_dstQpFifo,远端QPN，该值通过tx_ipUdpMetaMerger函数得出->in
		(3)stateTable2txIbh_rsp->stateTable2txIbh_rsp,stateTable返回值->in
			b. 直接返回state_table[qpn]这个entry
		(4)txIbh2stateTable_upd_req->txIbh2stateTable_upd_req,向stateTable发出请求->out
			a. 利用local qpn去state_table中请求state_table[qpn]这个entry
		(5)tx_ibhHeaderFifo->tx_ibhHeaderFifo，存储生成的BTH->out
*/
template <int WIDTH>
void generate_ibh(stream<ibhMeta> &metaIn,
				  stream<ap_uint<24>> &dstQpIn,
				  stream<stateTableEntry> &stateTable2txIbh_rsp,
				  // stream<net_axis<WIDTH> >&			input,
				  stream<txStateReq> &txIbh2stateTable_upd_req,
#if RETRANS_EN
				  stream<retransMeta> &tx2retrans_insertMeta,
#endif
				  stream<BaseTransportHeader<WIDTH>> &tx_ibhHeaderFifo)
{
#pragma HLS inline off
#pragma HLS pipeline II = 1

	enum fsmStateType
	{
		META,
		GET_PSN
	};									 // 设置两种状态，分别是META和GET_PSN
	static fsmStateType gi_state = META; // 初始状态设置为META
	static BaseTransportHeader<WIDTH> header;

	static ibhMeta meta;
	net_axis<WIDTH> currWord;
	stateTableEntry qpState; // TODO what is really required
	ap_uint<24> dstQp;

	switch (gi_state)
	{
	case META:
		if (!metaIn.empty() && !dstQpIn.empty()) // 初始状态设置为META，metaIn中存储的是opcode=RC_ACK,partition_key=0,dest_qp=loacl.qpn,psn=0,validPSN=false,numPkg=1;  dstQpIn中存储的是remotePSN
		{
			metaIn.read(meta);
			dstQpIn.read(dstQp);
			// BTH的partition_key部分设置为0xFFFF
			meta.partition_key = 0xFFFF; // TODO this is hard-coded, where does it come from??
			header.clear();

			header.setOpCode(meta.op_code);				// BTH的Opcode部分设置为RC_ACK
			header.setPartitionKey(meta.partition_key); // BTH的partition_key部分设置为0xFFFF
			// PSN only valid for READ_RSP, otherwise we get it in state GET_PSN
			header.setPsn(meta.psn);
			// BTH的Destination QPN部分设置为dstQp
			header.setDstQP(dstQp); // TODO ist meta.dest_qp required??
			if (meta.validPSN)
			{
				tx_ibhHeaderFifo.write(header);
				// gi_state = HEADER;
			}
			else
			{
				// 除了RDMA Read Response之外，所有的操作都需要去state_table中读取PSN
				// meta.dest_qp指的是本端QPN
				txIbh2stateTable_upd_req.write(txStateReq(meta.dest_qp));
				gi_state = GET_PSN; // 状态切换至GET_PSN
			}
		}
		break;
	case GET_PSN:
		if (!stateTable2txIbh_rsp.empty())
		{
			stateTable2txIbh_rsp.read(qpState); // 将stateTable2txIbh_rsp读取至qpState，里面包含的是state_table[qpn]这个entry
			if (meta.op_code == RC_ACK)			// 如果是RC——ACK类型
			{
				// BTH中的PSN部分为recepted PSN-1，因为接受了write request请求后，该值自动加1了
				header.setPsn(qpState.resp_epsn - 1); // TODO -1 necessary??
			}
			else
			{
				header.setPsn(qpState.req_next_psn);
				header.setAckReq(true);
				// Update PSN
				ap_uint<24> nextPsn = qpState.req_next_psn + meta.numPkg;
				txIbh2stateTable_upd_req.write(txStateReq(meta.dest_qp, nextPsn));

				// Store Packet descirptor in retransmitter table
#if RETRANS_EN
				tx2retrans_insertMeta.write(retransMeta(meta.dest_qp, qpState.req_next_psn, meta.op_code));
#endif
			}
			tx_ibhHeaderFifo.write(header); // 将BTH写入tx_ibhHeaderFifo中
			gi_state = META;
		}
		break;
	}
}

/*
 * Types currently supported: DETH, RETH, AETH, ImmDt, IETH
 *
 * For reliable connections, page 246, 266, 269
 * RDM WRITE ONLY: RETH, PayLd
 * RDMA WRITE FIRST: RETH, PayLd
 * RDMA WRITE MIDDLE: PayLd
 * RDMA WRITE LAST: PayLd
 * RDMA READ REQUEST: RETH
 * RDMA READ RESPONSE ONLY: AETH, PayLd
 * RDMA READ RESPONSE FIRST: AETH, PayLd
 * RDMA READ RESPONSE MIDDLE: PayLd
 * RDMA READ RESPONSE LAST: AETH, PayLd
 * ACK: AETH
 */
/*
	1. 函数功能：在responder端成功接受并解析request时，用于生成AETH头
	2. 参数解析：
		(1)metaIn->tx_exhMetaFifo,存储相关元数据->in
			当处理write request的response时，包含opcode=RC_ACK,qpn=rx_ackEventFifo.qpn,psn=0,validPSN=false,isNak=rx_ackEventFifo.isNak
			当处理read request的response时，包含：
				a. 如果一个response packet能够装下read request中想要读取的数据的话，则rx_readEvenFifo包含readOpcode(RC_RDMA_READ_RESP_ONLY)，qpn,所读取数据的长度(RETH.DMA_Length)，BTH.psn,validPsn(false), isNak(false)
				b. 如果需要两个response packet才能装下read request中想要读取的数据的话，则rx_readEvenFifo产生两次
					第1次为：readOpcode(RC_RDMA_READ_RESP_FIRST)，qpn,所读取数据的长度(PMTU)，BTH.psn,validPsn(false), isNak(false)
					第2次为：readOpcode(RC_RDMA_READ_RESP_LAST)，qpn,所读取数据的长度(RETH.DMA_Length-PMTU)，BTH.psn+1,validPsn(false), isNak(false)
				c. 如果需要三个及以上的response packet才能装下read request中想要读取的数据的话，则rx_readEvenFifo产生1+1+n次（FIRST,ONLY,MIDDLE*N）
					第1次为：readOpcode(RC_RDMA_READ_RESP_FIRST)，qpn,所读取数据的长度(PMTU)，BTH.psn,validPsn(false), isNak(false)
					第2~n次为：readOpcode(RC_RDMA_READ_RESP_MIDDLE)，qpn,所读取数据的长度(PMTU)，BTH.psn+n-1,validPsn(false), isNak(false)
					最后一次为：readOpcode(RC_RDMA_READ_RESP_LAST)，qpn,所读取数据的长度(RETH.DMA_Length-PMTU*n)，BTH.psn+n,validPsn(false), isNak(false)
		(2)msnTable2txExh_rsp->msnTable2txExh_rsp,msn_table的返回值->in
			b. msn_table函数返回的数据包括：msn_table[qpn].msn, msn_table[qpn].r_key
		(3)txExh2msnTable_req->txExh2msnTable_req,发送至msn_table的request->out
			a. 进入该函数后，首先给txExh2msnTable_req赋值为local qpn，去MSN table中根据本地qpn读取MSN Table entry
		(4)tx_readReqTable_upd->tx_readReqTable_upd，没用到->none
		(5)lengthFifo->tx_lengthFifo，生成的Response报文的长度->out
			如果是RDMA WRITE RESP，则为BTH+AETH+ICRC=12+4+4=20字节
			如果是RDMA REAF RESP，
				如果是RDMA READ ONLY/FIRST/LAST RESP，则为12+4+meta.length(要返回的数据的长度)+4
				如果是RDMA READ MIDDLE，则为12+meta.length(要返回的数据的长度)+4，移除了AETH头
		(6)packetInfoFifo->tx_packetInfoFifo,存储ACK报文的基本信息->out
			如果是RDMA WRITE RESP，则包含isAETH=True,hasHeader=true,hasPayload=false，就是单纯的ACK
			如果是RDMA REAF RESP
				如果是RDMA READ ONLY/FIRST/LAST RESP，则为isAETH=True,hasHeader=true,hasPayload=(payloadLength!=0)
				如果是RDMA READ MIDDLE，则为isAETH=True,hasHeader=false,hasPayload=true(payloadLength!=0)
		(7)output->tx_exh2payFifo，生成的512bit的Response报文->out
			如果是RDMA WRITE RESP或者RDMA READ ONLY/FIRST/LAST RESP，则目前只包含了4byte AETH的有效内容,tx_exh2payFifo.last=1
			如果是RDMA READ MIDDLE RESP，则不包含任何有效内容，就是一个初始化的512bit报文,tx_exh2payFifo=none
*/
template <int WIDTH>
void generate_exh(stream<event> &metaIn,
#if POINTER_CHASING_EN
				  stream<ptrChaseMeta> &s_axis_tx_pcmeta,
#endif
				  stream<txMsnRsp> &msnTable2txExh_rsp,
				  stream<ap_uint<16>> &txExh2msnTable_req,
				  stream<txReadReqUpdate> &tx_readReqTable_upd,
				  stream<ap_uint<16>> &lengthFifo,
				  stream<txPacketInfo> &packetInfoFifo,
#if RETRANS_EN
				  stream<ap_uint<24>> &txSetTimer_req,
// stream<retransAddrLen>&		tx2retrans_insertAddrLen,
#endif
				  stream<net_axis<WIDTH>> &output)
{
#pragma HLS inline off
#pragma HLS pipeline II = 1
#pragma region
	enum ge_fsmStateType
	{
		META,
		GET_MSN,
		PROCESS
	};										// 定义三个状态，META，GET_MSN, PROCESS
	static ge_fsmStateType ge_state = META; // 初始状态设置为META
	static event meta;
	net_axis<WIDTH> sendWord;
	static RdmaExHeader<WIDTH> rdmaHeader;
	static AckExHeader<WIDTH> ackHeader;
#if POINTER_CHASING_EN
	static ptrChaseMeta pcMeta;
	static RdmaPointerChaseHeader<WIDTH> pointerChaseHeader;
#endif
	static bool metaWritten;
	static txMsnRsp msnMeta;
	ap_uint<16> udpLen;
	txPacketInfo info;
#pragma endregion

	switch (ge_state)
	{
	case META:
		if (!metaIn.empty())
		{
			rdmaHeader.clear(); // 首先进入本函数，rdmaHeader和ackHeader均被清空
			ackHeader.clear();
#if POINTER_CHASING_EN
			pointerChaseHeader.clear();
#endif
			metaIn.read(meta);	 // 将metaIn中的数据读取至meta
			metaWritten = false; // metaWritten初始设置为false
			// if (meta.op_code == RC_RDMA_READ_RESP_ONLY || meta.op_code == RC_RDMA_READ_RESP_FIRST || meta.op_code == RC_RDMA_READ_RESP_MIDDLE || meta.op_code == RC_RDMA_READ_RESP_LAST || meta.op_code == RC_ACK)
			{
				txExh2msnTable_req.write(meta.qpn); // txExh2msnTable_req=loacl qpn，作为key去MSN Table中读取MSN Table[qpn] entry
				ge_state = GET_MSN;					//
			}
			// else
			{
				// Start Timer for RDMW_WRITE_* & RDMA_READ_REQUEST

				// txSetTimer_req.write(meta.qpn);
				// ge_state = PROCESS;
			}
#if RETRANS_EN
			// TODO PART HIST
			if (meta.op_code == RC_RDMA_WRITE_ONLY || meta.op_code == RC_RDMA_WRITE_FIRST || meta.op_code == RC_RDMA_WRITE_MIDDLE || meta.op_code == RC_RDMA_WRITE_LAST || meta.op_code == RC_RDMA_READ_REQUEST)
			{
				txSetTimer_req.write(meta.qpn);
			}
#endif
		}
		break;
	case GET_MSN:
#if POINTER_CHASING_EN
		if (!msnTable2txExh_rsp.empty() && (meta.op_code != RC_RDMA_READ_POINTER_REQUEST || !s_axis_tx_pcmeta.empty()))
#else
		if (!msnTable2txExh_rsp.empty()) // && (meta.op_code != RC_RDMA_READ_POINTER_REQUEST || !s_axis_tx_pcmeta.empty()))
#endif
		{
			// 第二轮进入本函数执行，msn_table返回的值包括msn_table[qpn].msn, msn_table[qpn].r_key，并将该数据写入msnMeta中
			msnTable2txExh_rsp.read(msnMeta);
#if POINTER_CHASING_EN
			if (meta.op_code == RC_RDMA_READ_POINTER_REQUEST)
			{
				s_axis_tx_pcmeta.read(pcMeta);
			}
#endif
			ge_state = PROCESS;
		}
		break;
	case PROCESS: // 最后状态机进入PROCESS
	{
		sendWord.last = 0;
		switch (meta.op_code)
		{
		case RC_RDMA_WRITE_ONLY:
		case RC_RDMA_WRITE_FIRST:
		case RC_RDMA_PART_ONLY:
		case RC_RDMA_PART_FIRST:
		{
			// [BTH][RETH][PayLd]
			rdmaHeader.setVirtualAddress(meta.addr);
			rdmaHeader.setLength(meta.length); // TODO Move up??
			rdmaHeader.setRemoteKey(msnMeta.r_key);
			ap_uint<8> remainingLength = rdmaHeader.consumeWord(sendWord.data);
			sendWord.keep = ~0;
			sendWord.last = (remainingLength == 0);
			std::cout << "RDMA_WRITE_ONLY/FIRST ";
			print(std::cout, sendWord);
			std::cout << std::endl;
			output.write(sendWord);
			if (remainingLength == 0)
			{
				// TODO
			}
			if (!metaWritten) // TODO we are losing 1 cycle here
			{
				info.isAETH = false;
				info.hasHeader = true;
				info.hasPayload = (meta.length != 0); // TODO should be true
				packetInfoFifo.write(info);

				/*std::cout << "RDMA_WRITE_ONLY/FIRST ";
				print(std::cout, sendWord);
				std::cout << std::endl;
				output.write(sendWord);*/

				// BTH: 12, RETH: 16, PayLd: x, ICRC: 4
				ap_uint<32> payloadLen = meta.length;
				if ((meta.op_code == RC_RDMA_WRITE_FIRST) || (meta.op_code == RC_RDMA_PART_FIRST))
				{
					payloadLen = PMTU;
				}
				udpLen = 12 + 16 + payloadLen + 4; // TODO dma_len can be much larger, for multiple packets we need to split this into multiple packets
				lengthFifo.write(udpLen);
				// Store meta for retransmit
				/*#if RETRANS_EN
									if (!meta.validPsn) //indicates retransmission
									{
										tx2retrans_insertAddrLen.write(retransAddrLen(meta.addr, meta.length));
									}
				#endif*/
				metaWritten = true;
			}
			break;
		}
		case RC_RDMA_WRITE_MIDDLE:
		case RC_RDMA_WRITE_LAST:
		case RC_RDMA_PART_MIDDLE:
		case RC_RDMA_PART_LAST:
			// [BTH][PayLd]
			info.isAETH = false;
			info.hasHeader = false;
			info.hasPayload = (meta.length != 0); // TODO should be true
			packetInfoFifo.write(info);
			// BTH: 12, PayLd: x, ICRC: 4
			udpLen = 12 + meta.length + 4;
			lengthFifo.write(udpLen);
			// Store meta for retransmit
			/*#if RETRANS_EN
							if (!meta.validPsn) //indicates retransmission
							{
								tx2retrans_insertAddrLen.write(retransAddrLen(meta.addr, meta.length));
							}
			#endif*/
			ge_state = META;
			break;
		case RC_RDMA_READ_REQUEST:
		case RC_RDMA_READ_CONSISTENT_REQUEST:
		{
			// [BTH][RETH]
			rdmaHeader.setVirtualAddress(meta.addr);
			rdmaHeader.setLength(meta.length); // TODO Move up??
			rdmaHeader.setRemoteKey(msnMeta.r_key);
			ap_uint<8> remainingLength = rdmaHeader.consumeWord(sendWord.data);
			sendWord.keep = ~0;
			sendWord.last = (remainingLength == 0);
			std::cout << "RDMA_READ_RWQ ";
			print(std::cout, sendWord);
			std::cout << std::endl;
			output.write(sendWord);
			if (!metaWritten) // TODO we are losing 1 cycle here
			{
				info.isAETH = false;
				info.hasHeader = true;
				info.hasPayload = false; //(meta.length != 0); //TODO should be true
				packetInfoFifo.write(info);

				/*std::cout << "RDMA_READ_RWQ ";
				print(std::cout, sendWord);
				std::cout << std::endl;
				output.write(sendWord);*/

				// BTH: 12, RETH: 16, PayLd: x, ICRC: 4
				udpLen = 12 + 16 + 0 + 4; // TODO dma_len can be much larger, for multiple packets we need to split this into multiple packets
				lengthFifo.write(udpLen);
				// Update Read Req max FWD header, TODO it is not exacly clear if meta.psn or meta.psn+numPkgs should be used
				// TODO i think psn is only used here!!
				tx_readReqTable_upd.write(txReadReqUpdate(meta.qpn, meta.psn));
				// Store meta for retransmit
				/*#if RETRANS_EN
									if (!meta.validPsn) //indicates retransmission
									{
										tx2retrans_insertAddrLen.write(retransAddrLen(meta.addr, meta.length));
									}
				#endif*/
				metaWritten = true;
			}
			break;
		}
#if POINTER_CHASING_EN
		case RC_RDMA_READ_POINTER_REQUEST:
		{
			// [BTH][RCTH]
			pointerChaseHeader.setVirtualAddress(meta.addr);
			pointerChaseHeader.setLength(meta.length); // TODO Move up??
			pointerChaseHeader.setRemoteKey(msnMeta.r_key);
			pointerChaseHeader.setPredicateKey(pcMeta.key);
			pointerChaseHeader.setPredicateMask(pcMeta.mask);
			pointerChaseHeader.setPredicateOp(pcMeta.op);
			pointerChaseHeader.setPtrOffset(pcMeta.ptrOffset);
			pointerChaseHeader.setIsRelPtr(pcMeta.relPtrOffset);
			pointerChaseHeader.setNextPtrOffset(pcMeta.nextPtrOffset);
			pointerChaseHeader.setNexPtrValid(pcMeta.nextPtrValid);

			ap_uint<8> remainingLength = pointerChaseHeader.consumeWord(sendWord.data);
			sendWord.keep = ~0; // 0xFFFFFFFF; //TODO, set as much as required
			sendWord.last = (remainingLength == 0);
			std::cout << "RC_RDMA_READ_POINTER_REQUEST ";
			print(std::cout, sendWord);
			std::cout << std::endl;
			output.write(sendWord);
			if (!metaWritten) // TODO we are losing 1 cycle here
			{
				info.isAETH = false; // TODO fix this
				info.hasHeader = true;
				info.hasPayload = false; //(meta.length != 0); //TODO should be true
				packetInfoFifo.write(info);

				/*std::cout << "RC_RDMA_READ_POINTER_REQUEST ";
				print(std::cout, sendWord);
				std::cout << std::endl;
				output.write(sendWord);*/

				// BTH: 12, RCTH: 28, PayLd: x, ICRC: 4
				udpLen = 12 + 28 + 0 + 4;
				lengthFifo.write(udpLen);
				// Update Read Req max FWD header, TODO it is not exacly clear if meta.psn or meta.psn+numPkgs should be used
				// TODO i think psn is only used here!!
				tx_readReqTable_upd.write(txReadReqUpdate(meta.qpn, meta.psn));
				// Store meta for retransmit
				/*#if RETRANS_EN
									if (!meta.validPsn) //indicates retransmission
									{
										tx2retrans_insertAddrLen.write(retransAddrLen(meta.addr, meta.length));
									}
				#endif*/
				metaWritten = true;
			}
			break;
		}
#endif
		case RC_RDMA_READ_RESP_ONLY:
		case RC_RDMA_READ_RESP_FIRST:
		case RC_RDMA_READ_RESP_LAST: // 在返回RDMA Read Response时，要分为四种情况，其中read response only/first/last时，进入此函数执行，因为他们需要加入ARTH头
		{
			// [BTH][AETH][PayLd]
			// AETH for first and last
			ackHeader.setSyndrome(0x1f); // 设置ACK Header的Syndrome与msn位
			ackHeader.setMsn(msnMeta.msn);
			// std::cout << "RDMA_READ_RESP MSN:" << ackHeader.getMsn() << std::endl;
			ackHeader.consumeWord(sendWord.data); // TODO
			{
				info.isAETH = true;
				info.hasHeader = true;
				info.hasPayload = (meta.length != 0); // TODO should be true
				packetInfoFifo.write(info);

				sendWord.keep((AETH_SIZE / 8) - 1, 0) = 0xFF;
				sendWord.keep((WIDTH / 8) - 1, (AETH_SIZE / 8)) = 0;
				sendWord.last = 1;

				std::cout << "RDMA_READ_RESP ETH HEADER(AETH): ";
				print(std::cout, sendWord);
				std::cout << std::endl;
				output.write(sendWord);

				// BTH: 12, AETH: 4, PayLd: x, ICRC: 4
				udpLen = 12 + 4 + meta.length + 4; // udp length=12+4+meta.length(要返回的数据的长度)+4
				// std::cout << "length: " << tempLen << ", dma len: " << meta.length << std::endl;
				lengthFifo.write(udpLen);
			}
			break;
		}
		case RC_RDMA_READ_RESP_MIDDLE:
			// [BTH][PayLd]
			info.isAETH = true;
			info.hasHeader = false;
			info.hasPayload = (meta.length != 0); // TODO should be true
			packetInfoFifo.write(info);
			// BTH: 12, PayLd: x, ICRC: 4
			udpLen = 12 + meta.length + 4; // udp length=12+meta.length(要返回的数据的长度)+4
			lengthFifo.write(udpLen);
			ge_state = META;
			break;
		case RC_ACK: // 接收Write Request，则只返回RC_ACK
		{
			// [BTH][AETH]
			// Check if ACK or NAK
			if (!meta.isNak) // meta中包括opcode=RC_ACK,qpn=rx_ackEventFifo.qpn,psn=0,validPSN=false,isNak=rx_ackEventFifo.isNak
			{
				ackHeader.setSyndrome(0x1f); // 如果不是NAK，则表明其为ACK，将ACK Header的setSyndrome部分设置为0x1f，即00011111，前3bit 0表明是ACK，后5bit 1表明credicts是无效的
			}
			else
			{
				// PSN SEQ error
				ackHeader.setSyndrome(0x60); // 如果是NAK，则设置为0X60，表明位PSN Sequence Error
			}
			ackHeader.setMsn(msnMeta.msn); // ackHeader部分的Msn部分由msn_table[qpn]的msn部分填充，至此，AETH成型
			// std::cout << "RC_ACK MSN:" << ackHeader.getMsn() << std::endl;
			ackHeader.consumeWord(sendWord.data); // TODO
			{
				info.isAETH = true;
				info.hasHeader = true;
				info.hasPayload = false;
				packetInfoFifo.write(info); // 存储packet information信息，包含isAETH=True,hasHeader=true,hasPayload=false，就是单纯的ACK

				sendWord.keep(AETH_SIZE / 8 - 1, 0) = 0xFF;
				sendWord.keep((WIDTH / 8) - 1, (AETH_SIZE / 8)) = 0;
				sendWord.last = 1;

				std::cout << "RC_ACK ";
				print(std::cout, sendWord);
				std::cout << std::endl;
				output.write(sendWord); // 生成的512bit的IB ACK报文，目前为止只包含了AETH的4字节内容

				// BTH: 12, AETH: 4, ICRC: 4
				lengthFifo.write(12 + 4 + 4); // 生成的IB ACK报文的长度，BTH+AETH+ICRC=12+4+4=20字节
			}
			break;
		}
		default:
			break;
		} // switch
	}	  // if empty
		if (sendWord.last)
		{
			ge_state = META;
		}
		break;
	} // switch
}
/*
	1. 函数功能：给RDMA Response Packet添加payload信息，如果是RDMA WRITE ACK的话用不到该函数，但如果是RDMA READ RESP的话就需要用到了
	2. 参数解析：
		(1)packetInfoFifo->tx_packetInfoFifo,存储ACK报文的基本信息，包含isAETH=True,hasHeader=true,hasPayload=false，就是单纯的ACK->in
			如果是RDMA WRITE RESP，则包含isAETH=True,hasHeader=true,hasPayload=false，就是单纯的ACK
			如果是RDMA REAF RESP
				如果是RDMA READ ONLY/FIRST/LAST RESP，则为isAETH=True,hasHeader=true,hasPayload=(payloadLength!=0)
				如果是RDMA READ MIDDLE，则为isAETH=True,hasHeader=false,hasPayload=true(payloadLength!=0)
		(2)tx_headerFifo->tx_exh2payFifo,生成的512bit的IB ACK报文->in
			如果是RDMA WRITE RESP或者RDMA READ ONLY/FIRST/LAST RESP，则目前只包含了4byte AETH的有效内容，last=1
			如果是RDMA READ MIDDLE RESP，则为空，没有值传进来
			如果是RDMA WRITE ACK，则目前也只包含了4byte AETH有效内容,last=1
		(3)tx_aethPayloadFifo->tx_aethShift2payFifo->in
			RDMA READ FIRST/LAST/ONLY AETH后面添加的Payload
		(4)tx_rethPayloadFifo->tx_rethShift2payFifo,没用到->none
		(5)tx_rawPayloadFifo->tx_rawPayFifo,来自tx_pkg_arbiter函数，针对RDMA READ MIDDLE RESP，没有AETH头，直接返回Payload->none
		(6)tx_exh2shiftFifo，输出当前只包含有效四字节的AETH的512bit ACK报文输出->out
*/
template <int WIDTH>
void append_payload(stream<txPacketInfo> &packetInfoFifo,
					stream<net_axis<WIDTH>> &tx_headerFifo,
					stream<net_axis<WIDTH>> &tx_aethPayloadFifo,
					stream<net_axis<WIDTH>> &tx_rethPayloadFifo,
					stream<net_axis<WIDTH>> &tx_rawPayloadFifo,
					stream<net_axis<WIDTH>> &tx_packetFifo)
{
#pragma HLS inline off
#pragma HLS pipeline II = 1

	enum fsmState
	{
		INFO,
		HEADER,
		AETH_PAYLOAD,
		RETH_PAYLOAD,
		RAW_PAYLOAD
	};							  // 定义五种状态，分别时INFO，HEADER，AETH_PAYLOAD,RETH_PAYLOAD,RAW_PAYLOAD
	static fsmState state = INFO; // 初始状态为INFO
	static net_axis<WIDTH> prevWord;
	net_axis<WIDTH> currWord;
	net_axis<WIDTH> sendWord;
	static bool firstPayload = true;

	static txPacketInfo info;

	// TODO align this stuff!!
	switch (state)
	{
	case INFO:
		if (!packetInfoFifo.empty()) // 初始时，进入该状态，packetInfoFifo中存储了ACK的基本信息
		{
			firstPayload = true;
			packetInfoFifo.read(info); // 将packetInfoFifo读入info中

			if (info.hasHeader) // info.hasHeader=True，则表明是RDMA WRITE RESP 或者 RDMA READ FIRST/ONLY/LAST RESP
			{
				state = HEADER; // 状态切换至HEADER
			}
			else
			{
				state = RAW_PAYLOAD; // info.hasHeader=False，则表明是RDMA READ MIDDLE RESP，状态切换至RAW_PAYLOAD，表明直接添加payload
			}
		}
		break;
	case HEADER:
		if (!tx_headerFifo.empty()) // 第二步进入该处理函数，针对WRITE RESP和READ ONLY/FIRST/LAST，tx_headerFifo内是初始化生成的512bit报文，目前为止只包含了AETH的4字节内容，剩余的字节是无用的，且last均为1
		{
			tx_headerFifo.read(prevWord); // 将tx_headerFifo读取至prevWord中
			/*std::cout << "HEADER:";
			print(std::cout, prevWord);
			std::cout << std::endl;*/
			// TODO last is not necessary
			if (!prevWord.last) // || prevWord.keep[(WIDTH/8)-1] == 1) //One of them should be sufficient..
			{
				tx_packetFifo.write(prevWord);
			}
			else // last
			{
				if (!info.hasPayload) // 如果是最后一个packet，本实例中info.hasPayload=false
				{
					state = INFO;				   // 状态切换至INFO，即不会执行后续代码
					tx_packetFifo.write(prevWord); // 将当前只包含有效四字节的AETH的512bit报文输出
				}
				else // hasPayload
				{
					prevWord.last = 0; // 将last位置为0
					if (info.isAETH)
					{
						state = AETH_PAYLOAD; // 如果有AETH，则跳转到AETH_PAYLOAD状态
					}
					else // RETH
					{
						if (WIDTH <= RETH_SIZE)
						{
							tx_packetFifo.write(prevWord);
						}
						state = RETH_PAYLOAD;
					}
				}
			}
		}
		break;
	case AETH_PAYLOAD:
		if (!tx_aethPayloadFifo.empty())
		{
			tx_aethPayloadFifo.read(currWord);
			// std::cout << "PAYLOAD WORD: ";
			// print(std::cout, currWord);
			// std::cout << std::endl;

			sendWord = currWord;
			if (firstPayload)
			{
				sendWord.data(31, 0) = prevWord.data(31, 0); // 由于报文右移并添加了4字节的AETH
				firstPayload = false;
			}
			std::cout << "AETH PAY: ";
			print(std::cout, sendWord);
			std::cout << std::endl;

			tx_packetFifo.write(sendWord);
			if (currWord.last)
			{
				state = INFO;
			}
		}
		break;
	case RETH_PAYLOAD:
		if (!tx_rethPayloadFifo.empty())
		{
			tx_rethPayloadFifo.read(currWord);
			std::cout << "PAYLOAD WORD: ";
			print(std::cout, currWord);
			std::cout << std::endl;

			sendWord = currWord;
			if (firstPayload && WIDTH > RETH_SIZE)
			{
				sendWord.data(127, 0) = prevWord.data(127, 0);
				firstPayload = false;
			}

			std::cout << "RETH PAYLOAD: ";
			print(std::cout, sendWord);
			std::cout << std::endl;

			tx_packetFifo.write(sendWord);
			if (currWord.last)
			{
				state = INFO;
			}
		}
		break;
	case RAW_PAYLOAD:
		if (!tx_rawPayloadFifo.empty())
		{
			tx_rawPayloadFifo.read(currWord);
			tx_packetFifo.write(currWord);
			if (currWord.last)
			{
				state = INFO;
			}
		}
		break;
	}
}

// TODO this introduces 1 cycle for WIDTH > 64
/*
	1. 函数功能:将BTH头放入现有的ACK报文中
	2. 参数解析：
		(1)tx_ibhHeaderFifo->tx_ibhHeaderFifo,生成的12字节BTH->in
		(2)tx_ibhPayloadFifo->tx_shift2ibhFifo，512字节数据，其中前12字节为BTH预留出来的0，13-16字节为AETH->in
		(3)m_axis_tx_data->m_axis_tx_data，存储的是512bit ACK Packet，其中前12字节为BTH，13-16字节为AETH->out
*/
template <int WIDTH>
void prepend_ibh_header(stream<BaseTransportHeader<WIDTH>> &tx_ibhHeaderFifo,
						stream<net_axis<WIDTH>> &tx_ibhPayloadFifo,
						stream<net_axis<WIDTH>> &m_axis_tx_data)
{
#pragma HLS inline off
#pragma HLS pipeline II = 1

	enum pihStatea
	{
		GET_HEADER,
		HEADER,
		PARTIAL_HEADER,
		BODY
	};									 // 设置四个状态GET_HEADER, HEADER, PARTIAL_HEADER, BODY
	static pihStatea state = GET_HEADER; // 初始状态设置为GET_HEADER
	static BaseTransportHeader<WIDTH> header;
	static ap_uint<WIDTH> headerData;
	net_axis<WIDTH> currWord;

	switch (state)
	{
	case GET_HEADER:
		if (!tx_ibhHeaderFifo.empty()) // 初始时进入本函数执行，tx_ibhHeaderFifo存储的是12字节BTH
		{
			tx_ibhHeaderFifo.read(header); // 将tx_ibhHeaderFifo读取至header中
			if (BTH_SIZE >= WIDTH)		   // BTH_SIZE=96,WIDTH=512
			{
				state = HEADER;
			}
			else
			{
				state = PARTIAL_HEADER; // 状态切换至PARTIAL_HEADER
			}
		}
		break;
	case HEADER:
	{
		ap_uint<8> remainingLength = header.consumeWord(currWord.data);
		if (remainingLength < (WIDTH / 8))
		{
			state = PARTIAL_HEADER;
		}
		currWord.keep = ~0;
		currWord.last = 0;
		m_axis_tx_data.write(currWord);
		break;
	}
	case PARTIAL_HEADER:
		if (!tx_ibhPayloadFifo.empty()) // tx_ibhPayloadFifo为512字节数据，其中前12字节为BTH预留出来的0，13-16字节为AETH
		{
			tx_ibhPayloadFifo.read(currWord);
			// std::cout << "IBH PARTIAL PAYLOAD: ";
			// print(std::cout, currWord);
			// std::cout << std::endl;

			header.consumeWord(currWord.data); // 将BTH添加至currWord中
			m_axis_tx_data.write(currWord);	   // m_axis_tx_data存储的是512bit ACK Packet，其中前12字节为BTH，13-16字节为AETH

			// std::cout << "IBH Packet ";
			// print(std::cout, currWord);
			// std::cout << std::endl;

			state = BODY;
			if (currWord.last)
			{
				state = GET_HEADER;
			}
		}
		break;
	case BODY:
		if (!tx_ibhPayloadFifo.empty())
		{
			tx_ibhPayloadFifo.read(currWord);
			m_axis_tx_data.write(currWord);

			// std::cout << "IBH Packet Remain PAYLOAD: ";
			// print(std::cout, currWord);
			// std::cout << std::endl;

			if (currWord.last)
			{
				state = GET_HEADER;
			}
		}
		break;
	}
}

void local_req_handler(stream<txMeta> &s_axis_tx_meta,
#if RETRANS_EN
					   stream<retransEvent> &retransEventFifo,
#endif
					   stream<memCmdInternal> &tx_local_memCmdFifo, // TODO rename
					   stream<mqInsertReq<ap_uint<64>>> &tx_localReadAddrFifo,
#if !RETRANS_EN
					   stream<event> &tx_localTxMeta)
#else
					   stream<event> &tx_localTxMeta,
					   stream<retransAddrLen> &tx2retrans_insertAddrLen)
#endif
{
#pragma HLS inline off
#pragma HLS pipeline II = 1
#pragma region
	enum fsmStateType
	{
		META,
		GENERATE
	};
	static fsmStateType lrh_state;
	static txMeta meta;

	event ev;
	retransEvent rev;
	ibOpCode writeOpcode;
	ap_uint<48> raddr;
	ap_uint<48> laddr;
	ap_uint<32> length;
	ap_uint<32> dmaLength;

	switch (lrh_state)
	{
	case META:
#if RETRANS_EN
		if (!retransEventFifo.empty())
		{
			retransEventFifo.read(rev);
			tx_localTxMeta.write(event(rev.op_code, rev.qpn, rev.remoteAddr, rev.length, rev.psn));
			if (rev.op_code != RC_RDMA_READ_REQUEST)
			{
				length = rev.length;
				std::cout << std::dec << "length to retranmist: " << rev.length << ", local addr: " << std::hex << rev.localAddr << ", remote addres: " << rev.remoteAddr << ", psn: " << rev.psn << std::endl;
				if (ev.op_code == RC_RDMA_WRITE_FIRST || ev.op_code == RC_RDMA_PART_FIRST)
				{
					length = PMTU;
				}
				tx_local_memCmdFifo.write(memCmdInternal(rev.qpn, rev.localAddr, length));
			}
		}
		else if (!s_axis_tx_meta.empty())
#else
		if (!s_axis_tx_meta.empty())
#endif
		{
			s_axis_tx_meta.read(meta);
			if (meta.op_code == APP_READ || meta.op_code == APP_POINTER || meta.op_code == APP_READ_CONSISTENT)
			{
				if (meta.op_code == APP_READ)
				{
					tx_localTxMeta.write(event(RC_RDMA_READ_REQUEST, meta.qpn, meta.remote_vaddr, meta.length));
				}
				else if (meta.op_code == APP_READ_CONSISTENT)
				{
					tx_localTxMeta.write(event(RC_RDMA_READ_CONSISTENT_REQUEST, meta.qpn, meta.remote_vaddr, meta.length));
				}
#if POINTER_CHASING_EN
				else
				{
					tx_localTxMeta.write(event(RC_RDMA_READ_POINTER_REQUEST, meta.qpn, meta.remote_vaddr, meta.length));
				}
#endif
				tx_localReadAddrFifo.write(mqInsertReq<ap_uint<64>>(meta.qpn, meta.local_vaddr));
#if RETRANS_EN
				tx2retrans_insertAddrLen.write(retransAddrLen(meta.local_vaddr, meta.remote_vaddr, meta.length));
#endif
			}
			else // APP_WRITE, APP_PART
			{
				laddr = meta.local_vaddr;
				raddr = meta.remote_vaddr;
				dmaLength = meta.length;
				writeOpcode = (meta.op_code == APP_PART) ? RC_RDMA_PART_ONLY : RC_RDMA_WRITE_ONLY;

				if (meta.length > PMTU)
				{
					meta.local_vaddr += PMTU;
					meta.remote_vaddr += PMTU;
					meta.length -= PMTU;
					writeOpcode = (meta.op_code == APP_PART) ? RC_RDMA_PART_FIRST : RC_RDMA_WRITE_FIRST;
					lrh_state = GENERATE;
				}
				// TODO retintroduce this functionality
				/*if (dmaLength > PCIE_BATCH_SIZE)
				{
					dmaLength -= PCIE_BATCH_SIZE;
					tx_local_memCmdFifo.write(memCmdInternal(meta.qpn, laddr, PCIE_BATCH_SIZE));
				}
				else*/
				{
					tx_local_memCmdFifo.write(memCmdInternal(meta.qpn, laddr, dmaLength));
				}
				// event needs to contain QP, opCode, length, psn
				tx_localTxMeta.write(event(writeOpcode, meta.qpn, raddr, dmaLength));
#if RETRANS_EN
				tx2retrans_insertAddrLen.write(retransAddrLen(laddr, raddr, dmaLength));
#endif
			}
		}
		break;
	case GENERATE:
		laddr = meta.local_vaddr;
		raddr = meta.remote_vaddr;
		length = meta.length;
		if (meta.length > PMTU)
		{
			length = PMTU;
			meta.local_vaddr += PMTU;
			meta.remote_vaddr += PMTU;
			meta.length -= PMTU;
			writeOpcode = (meta.op_code == APP_PART) ? RC_RDMA_PART_MIDDLE : RC_RDMA_WRITE_MIDDLE;
		}
		else
		{
			writeOpcode = (meta.op_code == APP_PART) ? RC_RDMA_PART_LAST : RC_RDMA_WRITE_LAST;
			lrh_state = META;
		}
		// tx_local_memCmdFifo.write(memCmdInternal(meta.qpn, laddr, length, (writeOpcode == RC_RDMA_WRITE_LAST || writeOpcode == RC_RDMA_PART_LAST)));
		tx_localTxMeta.write(event(writeOpcode, meta.qpn, raddr, length));
#if RETRANS_EN
		tx2retrans_insertAddrLen.write(retransAddrLen(laddr, raddr, length));
#endif
		break;
	} // switch
#pragma endregion
}

// TODO this only works with axi width 64
template <int WIDTH>
void fpga_data_handler(stream<net_axis<WIDTH>> &s_axis_tx_data,
					   stream<net_axis<WIDTH>> &appTxData) // switch to internal format
{
#pragma HLS inline off
#pragma HLS pipeline II = 1

	static ap_uint<16> remainingLength;

	net_axis<WIDTH> currWord;

	if (!s_axis_tx_data.empty())
	{
		s_axis_tx_data.read(currWord);
		remainingLength -= (WIDTH / 8); // TODO only works with WIDTH == 64
		if (remainingLength == 0)
		{
			currWord.last = 1;
			remainingLength = PMTU;
		}
		appTxData.write(currWord);
	}
}

/*
 * rx_ackEventFifo RC_ACK from ibh and exh
 * rx_readEvenFifo READ events from RX side
 * tx_appMetaFifo, retransmission events, WRITEs and READ_REQ only
 */
/*
	1. 函数功能：元数据合并
	2. 参数功能：
		(1)rx_ackEventFifo->rx_ackEventFifo，本端作为responder并接受write request时触发此事件，存储local qpn，同时设psn(0), validPsn(false), isNak(false)->in
		(2)rx_readEvenFifo->rx_readEvenFifo，本端作为responder并接收read request时触发此事件->in
			a. 如果一个response packet能够装下read request中想要读取的数据的话，则rx_readEvenFifo包含readOpcode(RC_RDMA_READ_RESP_ONLY)，qpn,所读取数据的长度(RETH.DMA_Length)，BTH.psn,validPsn(false), isNak(false)
			b. 如果需要两个response packet才能装下read request中想要读取的数据的话，则rx_readEvenFifo产生两次
				第1次为：readOpcode(RC_RDMA_READ_RESP_FIRST)，qpn,所读取数据的长度(PMTU)，BTH.psn,validPsn(false), isNak(false)
				第2次为：readOpcode(RC_RDMA_READ_RESP_LAST)，qpn,所读取数据的长度(RETH.DMA_Length-PMTU)，BTH.psn+1,validPsn(false), isNak(false)
			c. 如果需要三个及以上的response packet才能装下read request中想要读取的数据的话，则rx_readEvenFifo产生1+1+n次（FIRST,ONLY,MIDDLE*N）
				第1次为：readOpcode(RC_RDMA_READ_RESP_FIRST)，qpn,所读取数据的长度(PMTU)，BTH.psn,validPsn(false), isNak(false)
				第2~n次为：readOpcode(RC_RDMA_READ_RESP_MIDDLE)，qpn,所读取数据的长度(PMTU)，BTH.psn+n-1,validPsn(false), isNak(false)
				最后一次为：readOpcode(RC_RDMA_READ_RESP_LAST)，qpn,所读取数据的长度(RETH.DMA_Length-PMTU*n)，BTH.psn+n,validPsn(false), isNak(false)
		(4)tx_ibhconnTable_req->tx_ibhconnTable_req，ibh到connection Table的req，只包含local qpn信息->out
		(5)tx_ibhMetaFifo->tx_ibhMetaFifo->out
			当处理write request时，存储相关元数据，包括包括opcode=RC_ACK,partition_key=0,dest_qp=rx_ackEventFifo.qpn,psn=0,validPSN=false,numPkg=1
			当处理read request时，存储的是op_code(RC_RDMA_READ_RESP_ONLY/FIRST/MIDDLE/LAST)，partition_key=0,dest_qp=rx_readEventFifo.qpn，validPSN=false,numPkg=1
		(6)tx_exhMetaFifo->tx_exhMetaFifo->out
			当处理write request时，存储rx_ackEventFifo，包含opcode=RC_ACK,qpn=rx_ackEventFifo.qpn,psn=0,validPSN=false,isNak=rx_ackEventFifo.isNak->out
			当处理read request时，存储rx_readEvenFifo
		(7) tx_appMetaFifo -> tx_ibhMetaFifo->out
			将本端主动写请求包含的元数据tx_appMetaFifo写给tx_ibhMetaFifo
*/
void meta_merger(stream<ackEvent> &rx_ackEventFifo,
				 stream<event> &rx_readEvenFifo,
				 stream<event> &tx_appMetaFifo,
				 // stream<event>&		timer2exhFifo,
				 stream<ap_uint<16>> &tx_connTable_req,
				 stream<ibhMeta> &tx_ibhMetaFifo,
				 stream<event> &tx_exhMetaFifo)
{
#pragma HLS inline off
#pragma HLS pipeline II = 1

	ackEvent aev;
	event ev;
	ap_uint<16> key = 0; // TODO hack

	if (!rx_ackEventFifo.empty()) // 本端作为responder端处理requester端发送的write请求时，需要返回ACK，触发此事件
	{
		rx_ackEventFifo.read(aev); // 将rx_ackEventFifo读取到aev中

		tx_connTable_req.write(aev.qpn(15, 0)); // 将aev中的16位qpn读取到tx_connTable_req中
		// PSN used for read response
		tx_ibhMetaFifo.write(ibhMeta(RC_ACK, key, aev.qpn, aev.psn, aev.validPsn)); // 将相关元数据读取至tx_ibhMetaFifo中，包括opcode=RC_ACK,partition_key=0,dest_qp=rx_ackEventFifo.qpn,psn=0,validPSN=false,numPkg=1
		tx_exhMetaFifo.write(event(aev));											// 将相关元数据存储至tx_exhMetaFifo中，包含opcode=RC_ACK,qpn=rx_ackEventFifo.qpn,psn=0,validPSN=false,isNak=rx_ackEventFifo.isNak
	}
	else if (!rx_readEvenFifo.empty()) // 本端作为responser端处理read request时，触发此条件
	{
		rx_readEvenFifo.read(ev);			   // 将rx_readEvenFifo读取值ev中
		tx_connTable_req.write(ev.qpn(15, 0)); // 本地qpn被包装成tx_connTable_req发送给conn_table
		// PSN used for read response
		tx_ibhMetaFifo.write(ibhMeta(ev.op_code, key, ev.qpn, ev.psn, ev.validPsn)); // ib元数据包括op_code(RC_RDMA_READ_RESP_ONLY/FIRST/MIDDLE/LAST)，partition_key=0,dest_qp=rx_readEventFifo.qpn，validPSN=false,numPkg=1
		tx_exhMetaFifo.write(ev);													 // exh元数据就是rx_readEvenFifo
	}
	else if (!tx_appMetaFifo.empty()) // TODO rename
	{
		tx_appMetaFifo.read(ev);
		// lxc:appMetaFifo在传入前的类型是txMeta,但是传入时类型变成了event类型，两者结构不一致

		ap_uint<22> numPkg = 1;
		if (ev.op_code == RC_RDMA_READ_REQUEST || ev.op_code == RC_RDMA_READ_POINTER_REQUEST || ev.op_code == RC_RDMA_READ_CONSISTENT_REQUEST)
		{
			numPkg = (ev.length + (PMTU - 1)) / PMTU;
		}

		tx_connTable_req.write(ev.qpn(15, 0)); // 获取本地QPN
		if (ev.validPsn)					   // retransmit
		{
			tx_ibhMetaFifo.write(ibhMeta(ev.op_code, key, ev.qpn, ev.psn, ev.validPsn));
		}
		else // local
		{
			tx_ibhMetaFifo.write(ibhMeta(ev.op_code, key, ev.qpn, numPkg)); // 保存IBH的元数据
		}
		tx_exhMetaFifo.write(ev); // 即将tx_appMetaFifo写入tx_exhMetaFifo
	}
	/*else if (!timer2exhFifo.empty())
	{
		timer2exhFifo.read(ev);

		tx_connTable_req.write(ev.qpn(15, 0));
		// PSN used for retransmission
		tx_ibhMetaFifo.write(ibhMeta(ev.op_code, key, ev.qpn, ev.psn, ev.validPsn));
		tx_exhMetaFifo.write(ev);
	}*/
}

// TODO maybe all ACKS should be triggered by ibhFSM?? what is the guarantee we should/have to give
// TODO this should become a BRAM, storage type of thing
/*
	1. 函数功能：
	2. 参数解析
		（1)input->s_axis_rx_meta,将IP与UDP的元数据进行整合，包含将IP的源地址、UDP的对端port、UDP的本端port以及UDP头+UDP报文的长度,from roce_v2->in
		（2)exHeaderInput->rx_exh2drop_MetaFifo，存储ETH头的内容，form rx_process_exh->in
			a. 如果处理的是RETH包，metaOut中存储RETH包的全部8byte内容
			b. 如果处理的是AETH包，metaOut中存储AETH包的全部4byte内容
			c. 如果处理的报文中没有ETH头，metaOut被初始化一个空的对象
		（3)dropMetaIn->rx_ibhDropMetaFifo,包含两个参数isDrop和ackOnly，如果是不需要drop掉包的话，均置为false,from rx_ibh_fsm-> in
		（4)exh_lengthFifo->exh_lengthFifo，存储UDP头+UDP报文的长度->out
		（5)exHeaderOutput->rx_drop2exhFsm_MetaFifo，存储ETH头的内容->out
			a. 如果处理的是RETH包，metaOut中存储RETH包的全部8byte内容
			b. 如果处理的是AETH包，metaOut中存储AETH包的全部4byte内容
			c. 如果处理的报文中没有ETH头，metaOut被初始化一个空的对象
*/
template <int WIDTH>
void ipUdpMetaHandler(stream<ipUdpMeta> &input,
					  stream<ExHeader<WIDTH>> &exHeaderInput,
					  stream<fwdPolicy> &dropMetaIn,
					  // stream<dstTuple>&		output,
					  // stream<ap_uint<16> >&	remcrc_lengthFifo,
					  stream<ap_uint<16>> &exh_lengthFifo,
					  stream<ExHeader<WIDTH>> &exHeaderOutput)
{
#pragma HLS inline off
#pragma HLS pipeline II = 1

	ipUdpMeta meta;
	ExHeader<WIDTH> header;
	fwdPolicy policy;
	bool isDrop;

	if (!input.empty() && !exHeaderInput.empty() && !dropMetaIn.empty()) // 只有当IPUDP的元数据、ETH头、dropMetaIn的内容都不为空时，进入if判断语句
	{
		input.read(meta);			// 将IP UDP中存储的元数据内容读取进meta中
		exHeaderInput.read(header); // 将ETH头中的内容读取至header中
		dropMetaIn.read(policy);	// 将drop的元数据读取至policy中
		if (!policy.isDrop)			// TODO clean this up，如果不是被drop的包
		{
			if (!policy.ackOnly) // 如果不是单纯的ACK包
			{
				// remcrc_lengthFifo.write(meta.length - (8 + 12 + 4)); //UDP + BTH + CRC
				exh_lengthFifo.write(meta.length); // 将UDP头+UDP报文的长度写进exh_lengthFifo中
				exHeaderOutput.write(header);	   // 将ETH头的内容写进exHeaderOutput中
			}
			// output.write(dstTuple(meta.their_address, meta.their_port));
		}
	}
}
/*
		1. 函数功能：为后续添加UDP头、IP头收集元数据
		2. 参数解析：
			（1)tx_connTable2ibh_rsp->tx_connTable2ibh_rsp,在meta_merger函数中，有利用qpn对connTable进行过请求，并获得了返回值，该返回值也输入到了tx_ipUdpMetaMerger中->in
			（2)tx_lengthFifo->tx_lengthFifo，生成的IB ACK报文的长度，BTH+AETH+ICRC=12+4+4=20字节->in
			（3)m_axis_tx_meta->m_axis_tx_meta，继续下传至UDP/IP的元数据，包括remote_ip_address，remote_udp_port,RDMA_DEFAULT_PORT,len(BTH+AETH+ICRC=12+4+4=20字节)->out
			（4)tx_dstQpFifo->tx_dstQpFifo，输出remote qpn->out
*/
void tx_ipUdpMetaMerger(stream<connTableEntry> &tx_connTable2ibh_rsp,
						stream<ap_uint<16>> &tx_lengthFifo,
						stream<ipUdpMeta> &m_axis_tx_meta,
						stream<ap_uint<24>> &tx_dstQpFifo)
{
#pragma HLS inline off
#pragma HLS pipeline II = 1

	connTableEntry connMeta;
	ap_uint<16> len;

	if (!tx_connTable2ibh_rsp.empty() && !tx_lengthFifo.empty())
	{
		tx_connTable2ibh_rsp.read(connMeta);
		tx_lengthFifo.read(len);
		// std::cout << "Remote PORT: " << connMeta.remote_udp_port << std::endl;
		m_axis_tx_meta.write(ipUdpMeta(connMeta.remote_ip_address, connMeta.remote_udp_port, RDMA_DEFAULT_PORT, len));
		tx_dstQpFifo.write(connMeta.remote_qpn);
	}
}

// contextIn->s_axis_qp_interface->QP Context的一些信息，包含QP状态、local QPN、Remote和Local PSN、r_key和本端address->in
// stateTable2qpi_rsp->stateTable2qpi_rsp，一个空的state_table entry，由state_table函数返回，索引他的key是l_qpn(15,0)->in
// qpi2stateTable_upd_req->qpi2stateTable_upd_req，包含了当前QP的QPN信息(STATE_TABLE未产生stateTable2qpi_rsp前)，local qpn，QP状态(READY_SEND)，remote PSN，local PSN，write设为true(STATE_TABLE产生stateTable2qpi_rsp后)->out
// if2msnTable_init->if2msnTable_init，存储context中的local qpn，remote_key,to msn_table->out
void qp_interface(stream<qpContext> &contextIn,
				  stream<stateTableEntry> &stateTable2qpi_rsp,
				  stream<ifStateReq> &qpi2stateTable_upd_req, // Local QPN,
				  stream<ifMsnReq> &if2msnTable_init)
{
#pragma HLS inline off
#pragma HLS pipeline II = 1

	enum fstStateType
	{
		GET_STATE,
		UPD_STATE
	};											 // 定义两状态，分别是GET_STATE和UPD_STATE
	static fstStateType qp_fsmState = GET_STATE; // 初始状态设置为GET_STATE
	static qpContext context;					 // 定义一个qpContext类型的对象context
	stateTableEntry state;						 // 定义一个stateTableEntry类型的对象state

	switch (qp_fsmState)
	{
	case GET_STATE:
		if (!contextIn.empty())
		{
			contextIn.read(context);					  // 首先将输入的QP信息读取到context变量中来
			qpi2stateTable_upd_req.write(context.qp_num); // 将local QPN写到qpi2stateTable_upd_req变量中去
			qp_fsmState = UPD_STATE;					  // 状态变为UPD_STATE
		}
		break;
	case UPD_STATE:						 // 第二次调用qp_interface时就进了这个函数
		if (!stateTable2qpi_rsp.empty()) // 如果stateTable2qpi_rsp不为空的话再执行这个函数，该值在STATE_TABLE中被赋值，STATE_TABLE则是在上个状态中的qpi2stateTable_upd_req被赋值后触发，
		{
			stateTable2qpi_rsp.read(state); // 将stateTable2qpi_rsp读取到state中，其实就是一个空的state_table entry
			// TODO check if valid transition               // 再向qpi2stateTable_upd_req中写入local qpn，QP状态(READY_SEND)，remote PSN，local PSN，write位设为true
			qpi2stateTable_upd_req.write(ifStateReq(context.qp_num, context.newState, context.remote_psn, context.local_psn));
			// 向if2msnTable_init写入local qpn，remote_key
			if2msnTable_init.write(ifMsnReq(context.qp_num, context.r_key)); // TODO store virtual address somewhere??
			qp_fsmState = GET_STATE;										 // 在stateTable2qpi_rsp被赋值前，该qp_fsmState位一直被标记在GET_STATE状态
		}
		break;
	}
}

void three_merger(stream<event> &in0, stream<event> &in1, stream<event> &in2, stream<event> &out)
{
#pragma HLS inline off
#pragma HLS pipeline II = 1

	if (!in0.empty())
	{
		out.write(in0.read());
	}
	else if (!in1.empty())
	{
		out.write(in1.read());
	}
	else if (!in2.empty())
	{
		out.write(in2.read());
	}
}
/*
	1. 函数功能：合并处理read request，这里的read request分成两部分，一是locol read request，也就是我本地发出去的read request；二是remote read request，也就是接收的远端的远端的read request
	2. 参数解析：
		1. remoteReadRequests->rx_remoteMemCmd，从requester端发来的read request packet中抓取出来的read cmd，包含qpn，所读取数据的初始地址(RETH.vaddr)，所读取数据的总长度(RETH.DMA_Length)->in
		2. localReadRequests->tx_localMemCmdFifo,未用到，none->in
		3. out->m_axis_mem_read_cmd,存储输入的Mem Read Cmd，包括远端所要读取数据的初始地址(RETH.vaddr)，所读取数据的总长度(RETH.DMA_Length)，ROUTE(ROUTE_DMA)写入out中
		4. pkgInfoFifo->tx_pkgInfoFifo，存储packet的部分信息，包括type(AETH),source(MEM),words((RETH.DMA_Length+(WIDTH/8)-1)/(WIDTH/8))->out
*/
template <int WIDTH>
void mem_cmd_merger(stream<memCmdInternal> &remoteReadRequests,
					stream<memCmdInternal> &localReadRequests,
					stream<routedMemCmd> &out,
					stream<pkgInfo> &pkgInfoFifo)
{
#pragma HLS inline off
#pragma HLS pipeline II = 1

	memCmdInternal cmd;

	if (!remoteReadRequests.empty()) // 处理远端requester端发来的read请求
	{
		remoteReadRequests.read(cmd);						   // 将remoteReadRequests读取到cmd中
		out.write(routedMemCmd(cmd.addr, cmd.len, cmd.route)); // 将远端所要读取数据的初始地址(RETH.vaddr)，所读取数据的总长度(RETH.DMA_Length)，ROUTE(ROUTE_DMA)写入out中
#if POINTER_CHASING_EN
		if (cmd.route == ROUTE_CUSTOM)
		{
			pkgInfoFifo.write(pkgInfo(AETH, FIFO, ((cmd.len + (WIDTH / 8) - 1) / (WIDTH / 8))));
		}
		else
#endif
		{
			pkgInfoFifo.write(pkgInfo(AETH, MEM, ((cmd.len + (WIDTH / 8) - 1) / (WIDTH / 8)))); // pkgInfoFifo中写入packet information，包括type(AETH),source(MEM),words((RETH.DMA_Length+(WIDTH/8)-1)/(WIDTH/8))
		}
	}
	else if (!localReadRequests.empty()) // LocolReadRequest
	{
		localReadRequests.read(cmd);
		// CHECK if data in memory
		if (cmd.addr != 0)
		{
			out.write(routedMemCmd(cmd.addr, cmd.len, cmd.route));
			pkgInfoFifo.write(pkgInfo(RETH, MEM, ((cmd.len + (WIDTH / 8) - 1) / (WIDTH / 8))));
		}
		else
		{
			pkgInfoFifo.write(pkgInfo(RETH, FIFO, ((cmd.len + (WIDTH / 8) - 1) / (WIDTH / 8))));
		}
	}
}

void merge_retrans_request(stream<retransMeta> &tx2retrans_insertMeta,
						   stream<retransAddrLen> &tx2retrans_insertAddrLen,
						   stream<retransEntry> &tx2retrans_insertRequest)
{
#pragma HLS inline off
#pragma HLS pipeline II = 1

	retransMeta meta;
	retransAddrLen addrlen;

	if (!tx2retrans_insertMeta.empty() && !tx2retrans_insertAddrLen.empty())
	{
		tx2retrans_insertMeta.read(meta);
		tx2retrans_insertAddrLen.read(addrlen);
		tx2retrans_insertRequest.write(retransEntry(meta, addrlen));
	}
}

/*
	1. 函数功能：只针对RDMA Write操作，提取出要写入的数据
	2. 参数解析：
		（1)rx_pkgShiftTypeFifo->rx_pkgShiftTypeFifo,为当操作码为RDMA WRITE FIRST/ONLY时,将rx_pkgShiftTypeFifo设为SHIFT_RETH，而当操作码为RDMA WRITE MIDDLE/LAST，将rx_pkgShiftTypeFifo设为SHIFT_NONE->in
		（2)rx_aethSift2mergerFifo->rx_aethSift2mergerFifo,丢掉IB头和AETH头的IB报文->in
		（3)rx_rethSift2mergerFifo->rx_rethSift2mergerFifo,丢掉IB头和RETH头的IB报文->in
		（4)rx_NoSift2mergerFifo->rx_exhNoShiftFifo,如果不带任何ETH头，则存储去掉IB头的IB报文和路由方式->in
		（5)m_axis_mem_write_data->m_axis_mem_write_data，要往memory中写入的内容->out
			针对WRITE_ONLY和WRITE_FIRST操作，m_axis_mem_write_data存储的是丢掉BTH头和RETH头的报文
			针对WRITE MIDDLE/LAST操作，m_axis_mem_write_data存储的是丢掉BTH头的报文
*/
template <int WIDTH>
void merge_rx_pkgs(stream<pkgShiftType> &rx_pkgShiftTypeFifo,
				   stream<net_axis<WIDTH>> &rx_aethSift2mergerFifo,
				   stream<routed_net_axis<WIDTH>> &rx_rethSift2mergerFifo,
				   stream<routed_net_axis<WIDTH>> &rx_NoSift2mergerFifo,
				   stream<routed_net_axis<WIDTH>> &m_axis_mem_write_data)
{
#pragma HLS inline off
#pragma HLS pipeline II = 1

	enum mrpStateType
	{
		IDLE,
		FWD_AETH,
		FWD_RETH,
		FWD_NONE
	};								  // 定义四种模式，IDLE，FOEWARD_AETH,FOEWARD_RETH,FWD_NONE(没有ETH头)
	static mrpStateType state = IDLE; // 初始状态定义为IDLE

	pkgShiftType type;

	switch (state)
	{
	case IDLE:
		if (!rx_pkgShiftTypeFifo.empty()) // 如果rx_pkgShiftTypeFifo不为空，其中制定ETH头类型
		{
			rx_pkgShiftTypeFifo.read(type); // 将rx_pkgShiftTypeFifo内容读取至type中
			if (type == SHIFT_AETH)
			{
				state = FWD_AETH;
			}
			else if (type == SHIFT_RETH) // 针对WRITE_FIRST与WRITE_ONLY，则将状态设置为SHIFT_RETH
			{
				state = FWD_RETH; // 状态跳转至FWD_AETH
			}
			else
			{
				state = FWD_NONE; // 针对WRITE MIDDLE/LAST或者READ Request，则跳转到FWD_NONE
			}
		}
		break;
	case FWD_AETH:
		if (!rx_aethSift2mergerFifo.empty())
		{
			net_axis<WIDTH> currWord;
			rx_aethSift2mergerFifo.read(currWord);
			m_axis_mem_write_data.write(routed_net_axis<WIDTH>(currWord, ROUTE_DMA));
			if (currWord.last)
			{
				state = IDLE;
			}
		}
		break;
	case FWD_RETH:
		if (!rx_rethSift2mergerFifo.empty()) // 针对WRITE_ONLY和WRITE_FIRST
		{
			routed_net_axis<WIDTH> currWord;
			rx_rethSift2mergerFifo.read(currWord); // 将丢掉IB头和RETH头的IB报文的报文读进currWord中
			m_axis_mem_write_data.write(currWord); // 将丢掉IB头和RETH头的IB报文的报文读进m_axis_mem_write_data中
			if (currWord.last)
			{
				state = IDLE;
			}
		}
		break;
	case FWD_NONE:
		if (!rx_NoSift2mergerFifo.empty())
		{
			routed_net_axis<WIDTH> currWord;
			rx_NoSift2mergerFifo.read(currWord);
			m_axis_mem_write_data.write(currWord); // 将丢掉BTH头的IB报文写进m_axis_mem_write_data中
			if (currWord.last)
			{
				state = IDLE;
			}
		}
	} // switch
}
/*
	1. 函数功能：
	2. 参数解析：
		(1)tx_pkgInfoFifo->tx_pkgInfoFifo,存储RDMA Read Response Packet的部分信息，包括type(AETH),source(MEM),words((RETH.DMA_Length+(WIDTH/8)-1)/(WIDTH/8))->in
		(2)s_axis_tx_data->s_axis_tx_data，没用到->in
		(3)s_axis_mem_read_data->s_axis_mem_read_data，当ib_transport_procotol将m_axis_read_cmd参数传出去后，DMA执行数据读写，将读写的数据从该引脚传入，每次传入的数据是512bit，根据传进来的数据总量判断是否需要生成RDMA READ MIDDLE RESP。->out
		(4)remoteReadData->tx_split2aethShift，s_axis_mem_read_data传进来的填充RDMA READ FIRST/ONLY/LAST的512bit payload->out
		(5)localReadData->tx_rethMerge2rethShift，用不到->out
		(6)rawPayFifo->tx_rawPayFifo，s_axis_mem_read_data传进来的填充RDMA READ MIDDLE RESP的512bit payload->out
*/
template <int WIDTH>
void tx_pkg_arbiter(stream<pkgInfo> &tx_pkgInfoFifo,
					stream<net_axis<WIDTH>> &s_axis_tx_data,
					stream<net_axis<WIDTH>> &s_axis_mem_read_data,
					stream<net_axis<WIDTH>> &remoteReadData,
					stream<net_axis<WIDTH>> &localReadData,
					stream<net_axis<WIDTH>> &rawPayFifo)
{
#pragma HLS inline off
#pragma HLS pipeline II = 1

	enum mrpStateType
	{
		IDLE,
		FWD_MEM_AETH,
		FWD_MEM_RETH,
		FWD_MEM_RAW,
		FWD_STREAM_AETH,
		FWD_STREAM_RETH,
		FWD_STREAM_RAW
	};
	static mrpStateType state = IDLE;
	static ap_uint<8> wordCounter = 0;

	static pkgInfo info;
	net_axis<WIDTH> currWord;

	switch (state)
	{
	case IDLE:
		if (!tx_pkgInfoFifo.empty()) // 如果tx_pkgInfoFifo不为空
		{
			tx_pkgInfoFifo.read(info); // 将tx_pkgInfoFifo读取到info中
			wordCounter = 0;
			if (info.source == MEM) // info.source = MEM
			{
				if (info.type == AETH) // 如果是AETH，则表明是RDMA READ ONLY/FIRST/LAST RESP
				{
					state = FWD_MEM_AETH; // 状态跳转至FWD_MEM_AETH
				}
				else
				{
					state = FWD_MEM_RETH;
				}
			}
			else
			{
				if (info.type == AETH)
				{
					state = FWD_STREAM_AETH;
				}
				else
				{
					state = FWD_STREAM_RETH;
				}
			}
		}
		break;
	case FWD_STREAM_AETH:
		if (!s_axis_tx_data.empty())
		{
			s_axis_tx_data.read(currWord);
			wordCounter++;
			if (currWord.last)
			{
				state = IDLE;
			}
			if (wordCounter == PMTU_WORDS)
			{
				currWord.last = 1;
				wordCounter = 0;
				info.words -= PMTU_WORDS;
				// Check if next one is READ_RSP_MIDDLE
				if (info.words > PMTU_WORDS)
				{
					state = FWD_STREAM_RAW;
				}
			}
			remoteReadData.write(currWord);
		}
		break;
	case FWD_STREAM_RETH:
		if (!s_axis_tx_data.empty())
		{
			s_axis_tx_data.read(currWord);
			wordCounter++;
			if (currWord.last)
			{
				state = IDLE;
			}
			if (wordCounter == PMTU_WORDS)
			{
				currWord.last = 1;
				wordCounter = 0;
			}
			localReadData.write(currWord);
		}
		break;
	case FWD_MEM_AETH:
		if (!s_axis_mem_read_data.empty()) // 跳转至当前状态
		{
			s_axis_mem_read_data.read(currWord); // 当FPGA获取mem端的数据后，从s_axis_mem_read_data中传进来，每次只能传递512bit的数据
			wordCounter++;						 // 每传一次数据进来，wordCounter+1
			if (currWord.last)					 // 如果当前传递进来的512bit数据是最后一段数据，状态跳转至IDLE重新等待数据传进来
			{
				state = IDLE;
			}
			if (wordCounter == PMTU_WORDS) // 如果wordCounter==PMTU_WORDS==(PMTU / (DATA_WIDTH/8))==1408/(512/8)=22，也就是一个Packe最多能放22个512bit，因为我们设置的PMTU是1408byte
			{
				currWord.last = 1;		  // 表明当前的packet已经被塞满了
				wordCounter = 0;		  // wordCounter被清零
				info.words -= PMTU_WORDS; // 要写入response packet的字的数量减去22
				// Check if next one is READ_RSP_MIDDLE
				if (info.words > PMTU_WORDS) // 如果剩余数据的大小仍然大于PMTU，此时需要进入FWD_MEM_RAW状态填充RDMA READ RESP MIDDLE包
				{
					state = FWD_MEM_RAW;
				}
			}
			remoteReadData.write(currWord); // 填充RDMA READ FIRST/ONLY/LAST的payload
		}
		break;
	case FWD_MEM_RETH:
		if (!s_axis_mem_read_data.empty())
		{
			s_axis_mem_read_data.read(currWord);
			std::cout << "RETH DATA FROM MEMORY: ";
			print(std::cout, currWord);
			std::cout << std::endl;

			wordCounter++;
			if (currWord.last)
			{
				state = IDLE;
			}
			if (wordCounter == PMTU_WORDS)
			{
				currWord.last = 1;
				wordCounter = 0;
				info.words -= PMTU_WORDS;
				state = FWD_MEM_RAW;
			}
			localReadData.write(currWord);
		}
		break;
	case FWD_MEM_RAW:
		if (!s_axis_mem_read_data.empty()) // 要往RDMA READ RESP MIDDLE包中填充数据了
		{
			s_axis_mem_read_data.read(currWord);
			wordCounter++;
			if (currWord.last)
			{
				state = IDLE;
			}
			if (wordCounter == PMTU_WORDS) // 如果已经读取了一整个PMTU大小的数据，此时packet包已经被塞满了
			{
				currWord.last = 1;
				wordCounter = 0;
				info.words -= PMTU_WORDS;
				if (info.type == AETH && info.words <= PMTU_WORDS) // 如果是AETH包且剩余的response包数据小于PMTU，则跳转至FWD_MEM_AETH状态填充RDMA READ LAST RESP包
				{
					state = FWD_MEM_AETH;
				}
			}
			rawPayFifo.write(currWord); // 填充的是RDMA READ MIDDLE RESP的payload
		}
		break;
	case FWD_STREAM_RAW:
		if (!s_axis_tx_data.empty())
		{
			s_axis_tx_data.read(currWord);
			wordCounter++;
			if (currWord.last)
			{
				state = IDLE;
			}
			if (wordCounter == PMTU_WORDS)
			{
				currWord.last = 1;
				wordCounter = 0;
				info.words -= PMTU_WORDS;
				if (info.type == AETH && info.words <= PMTU_WORDS)
				{
					state = FWD_STREAM_AETH;
				}
			}
			rawPayFifo.write(currWord);
		}
		break;
	} // switch
}

template <int WIDTH>
void ib_transport_protocol(					 // RX
	stream<ipUdpMeta> &s_axis_rx_meta,		 // RX Path上，接收来自IP/UDP等IP核中发送来的元数据，将IP与UDP的元数据进行整合，包含IP的源地址、UDP的对端port、UDP的本端port以及UDP头+UDP报文的长度->in
	stream<net_axis<WIDTH>> &s_axis_rx_data, // RX Path上，接收经过ipv4和udp后被拆掉IPV4头和UDP头的报文，此时就只剩IB Transport层的内容了，数据大小为512bit->in
	// stream<net_axis<WIDTH> >&	m_axis_rx_data,
	// TX
	stream<txMeta> &s_axis_tx_meta,
	stream<net_axis<WIDTH>> &s_axis_tx_data,
	stream<ipUdpMeta> &m_axis_tx_meta,		 // RX路径，返回ACK时包含的元数据，即继续下传至UDP/IP的元数据，包括remote_ip_address，remote_udp_port,RDMA_DEFAULT_PORT,len()等->out
	stream<net_axis<WIDTH>> &m_axis_tx_data, // RX路径，返回ACK，存储的是512bit ACK Packet，其中前12字节为BTH，13-16字节为AETH，发送给UDP函数->out
	// Memory
	stream<routedMemCmd> &m_axis_mem_write_cmd, // RX路径上，本端作为responder端从报文中解析出的内存写指令，即根据对端发来的RETH包，拆分出要写入的虚拟地址，payload长度以及路由方式：DMA，from rx_eth_fsm->out
	stream<routedMemCmd> &m_axis_mem_read_cmd,	// RX路径上，本端作为responder端从报文中解析出的内存读指令，包括远端所要读取数据的初始地址(RETH.vaddr)，所读取数据的总长度(RETH.DMA_Length)，ROUTE(ROUTE_DMA)->out
	// stream<mmStatus>&	s_axis_mem_write_status,

	stream<routed_net_axis<WIDTH>> &m_axis_mem_write_data, // RX路径上，本端作为responder端从报文中解析出的要往内存中写入的数据，即要往memory中写入的内容，针对WRITE_ONLY和WRITE_FIRST操作，m_axis_mem_write_data存储的是丢掉IB头和RETH头的报文->out
	stream<net_axis<WIDTH>> &s_axis_mem_read_data,		   // RX路径上，本端作为responder端m_axis_mem_read_cmd从mem中读取的内容->in

	// Interface
	stream<qpContext> &s_axis_qp_interface,		 // QP Context的一些信息，包含QP状态、QPN、QP Remote和Local PSN、r_key和本端address
	stream<ifConnReq> &s_axis_qp_conn_interface, // 双方connection的一些信息，包含本段QPN、对端QPN、对端IP地址和对端UDP端口

// Pointer chasing
#if POINTER_CHASING_EN
	stream<ptrChaseMeta> &m_axis_rx_pcmeta,
	stream<ptrChaseMeta> &s_axis_tx_pcmeta,
#endif

	ap_uint<32> &regInvalidPsnDropCount)
{
#pragma HLS INLINE

#pragma region
	static stream<net_axis<WIDTH>> rx_ibh2shiftFifo("rx_ibh2shiftFifo");
	static stream<net_axis<WIDTH>> rx_shift2exhFifo("rx_shift2exhFifo");
	static stream<net_axis<WIDTH>> rx_exh2dropFifo("rx_exh2dropFifo");
	static stream<net_axis<WIDTH>> rx_ibhDrop2exhFifo("rx_ibhDrop2exhFifo");
	static stream<ibhMeta> rx_ibh2fsm_MetaFifo("rx_ibh2fsm_MetaFifo");
	static stream<ibhMeta> rx_fsm2exh_MetaFifo("rx_fsm2exh_MetaFifo");
	static stream<routed_net_axis<WIDTH>> rx_exh2rethShiftFifo("rx_exh2rethShiftFifo");
	static stream<net_axis<WIDTH>> rx_exh2aethShiftFifo("rx_exh2aethShiftFifo");
	static stream<routed_net_axis<WIDTH>> rx_exhNoShiftFifo("rx_exhNoShiftFifo");
	static stream<routed_net_axis<WIDTH>> rx_rethSift2mergerFifo("rx_rethSift2mergerFifo");
	static stream<net_axis<WIDTH>> rx_aethSift2mergerFifo("rx_aethSift2mergerFifo");
	static stream<pkgSplitType> rx_pkgSplitTypeFifo("rx_pkgSplitTypeFifo");
	static stream<pkgShiftType> rx_pkgShiftTypeFifo("rx_pkgShiftTypeFifo");
#pragma HLS STREAM depth = 2 variable = rx_ibh2shiftFifo
#pragma HLS STREAM depth = 2 variable = rx_shift2exhFifo
#pragma HLS STREAM depth = 32 variable = rx_exh2dropFifo
#pragma HLS STREAM depth = 32 variable = rx_ibhDrop2exhFifo
#pragma HLS STREAM depth = 2 variable = rx_ibh2fsm_MetaFifo
#pragma HLS STREAM depth = 2 variable = rx_fsm2exh_MetaFifo
#pragma HLS STREAM depth = 4 variable = rx_exh2rethShiftFifo
#pragma HLS STREAM depth = 4 variable = rx_exh2aethShiftFifo
#pragma HLS STREAM depth = 4 variable = rx_exhNoShiftFifo
#pragma HLS STREAM depth = 4 variable = rx_rethSift2mergerFifo
#pragma HLS STREAM depth = 4 variable = rx_aethSift2mergerFifo
#pragma HLS STREAM depth = 2 variable = rx_pkgSplitTypeFifo
#pragma HLS STREAM depth = 2 variable = rx_pkgShiftTypeFifo
#pragma HLS DATA_PACK variable = rx_ibh2fsm_MetaFifo
#pragma HLS DATA_PACK variable = rx_fsm2exh_MetaFifo
#pragma HLS DATA_PACK variable = rx_pkgSplitTypeFifo
#pragma HLS DATA_PACK variable = rx_pkgShiftTypeFifo

	static stream<ackEvent> rx_ibhEventFifo("rx_ibhEventFifo"); // TODO rename
	static stream<ackEvent> rx_exhEventMetaFifo("rx_exhEventMetaFifo");
	static stream<memCmdInternal> rx_remoteMemCmd("rx_remoteMemCmd");
#pragma HLS STREAM depth = 2 variable = rx_ibhEventFifo
#pragma HLS STREAM depth = 2 variable = rx_exhEventMetaFifo
#pragma HLS STREAM depth = 512 variable = rx_remoteMemCmd
#pragma HLS DATA_PACK variable = rx_ibhEventFifo
#pragma HLS DATA_PACK variable = rx_exhEventMetaFifo
#pragma HLS DATA_PACK variable = rx_remoteMemCmd

	static stream<ibhMeta> tx_ibhMetaFifo("tx_ibhMetaFifo");
	static stream<event> tx_appMetaFifo("tx_appMetaFifo");
	// static stream<event>	tx_localMetaFifo("tx_localMetaFifo");
	static stream<net_axis<WIDTH>> tx_appDataFifo("tx_appDataFifo");
#pragma HLS STREAM depth = 8 variable = tx_ibhMetaFifo
#pragma HLS STREAM depth = 32 variable = tx_appMetaFifo
// #pragma HLS STREAM depth=8 variable=tx_localMetaFifo
#pragma HLS STREAM depth = 8 variable = tx_appDataFifo

	static stream<event> tx_exhMetaFifo("tx_exhMetaFifo");
	static stream<net_axis<WIDTH>> tx_exh2shiftFifo("tx_exh2shiftFifo");
	static stream<net_axis<WIDTH>> tx_shift2ibhFifo("tx_shift2ibhFifo");
	static stream<net_axis<WIDTH>> tx_aethShift2payFifo("tx_aethShift2payFifo");
	static stream<net_axis<WIDTH>> tx_rethShift2payFifo("tx_rethShift2payFifo");
	static stream<net_axis<WIDTH>> tx_rawPayFifo("tx_rawPayFifo");
	static stream<net_axis<WIDTH>> tx_exh2payFifo("tx_exh2payFifo");
	static stream<BaseTransportHeader<WIDTH>> tx_ibhHeaderFifo("tx_ibhHeaderFifo");
	static stream<memCmdInternal> tx_localMemCmdFifo("tx_localMemCmdFifo");
#pragma HLS STREAM depth = 4 variable = tx_exhMetaFifo
#pragma HLS STREAM depth = 2 variable = tx_exh2shiftFifo
#pragma HLS STREAM depth = 8 variable = tx_shift2ibhFifo
#pragma HLS STREAM depth = 2 variable = tx_aethShift2payFifo
#pragma HLS STREAM depth = 2 variable = tx_rethShift2payFifo
#pragma HLS STREAM depth = 4 variable = tx_rawPayFifo
#pragma HLS STREAM depth = 4 variable = tx_exh2payFifo
#pragma HLS STREAM depth = 2 variable = tx_ibhHeaderFifo
#pragma HLS STREAM depth = 2 variable = tx_localMemCmdFifo
#pragma HLS DATA_PACK variable = tx_exhMetaFifo
#pragma HLS DATA_PACK variable = tx_ibhHeaderFifo
#pragma HLS DATA_PACK variable = tx_localMemCmdFifo

	static stream<txPacketInfo> tx_packetInfoFifo("tx_packetInfoFifo");
	static stream<ap_uint<16>> tx_lengthFifo("tx_lengthFifo");
#pragma HLS STREAM depth = 2 variable = tx_packetInfoFifo
#pragma HLS STREAM depth = 4 variable = tx_lengthFifo
#pragma HLS DATA_PACK variable = tx_packetInfoFifo

	static stream<bool> rx_ibhDropFifo("rx_ibhDropFifo");
	static stream<fwdPolicy> rx_ibhDropMetaFifo("rx_ibhDropMetaFifo");
#pragma HLS STREAM depth = 2 variable = rx_ibhDropFifo
#pragma HLS STREAM depth = 2 variable = rx_ibhDropMetaFifo
#pragma HLS DATA_PACK variable = rx_ibhDropMetaFifo

	// Connection Table
	static stream<ap_uint<16>> tx_ibhconnTable_req("tx_ibhconnTable_req");
	// static stream<ifConnReq>		qpi2connTable_req("qpi2connTable_req");
	static stream<connTableEntry> tx_connTable2ibh_rsp("tx_connTable2ibh_rsp");
// static stream<connTableEntry> connTable2qpi_rsp("connTable2qpi_rsp");
#pragma HLS STREAM depth = 2 variable = tx_ibhconnTable_req
#pragma HLS STREAM depth = 8 variable = tx_connTable2ibh_rsp
#pragma HLS DATA_PACK variable = tx_connTable2qpi_rsp

	// State Table Fifos
	static stream<rxStateReq> rxIbh2stateTable_upd_req("rxIbh2stateTable_upd_req");
	static stream<txStateReq> txIbh2stateTable_upd_req("txIbh2stateTable_upd_req");
	static stream<ifStateReq> qpi2stateTable_upd_req("qpi2stateTable_upd_req");
	static stream<rxStateRsp> stateTable2rxIbh_rsp("stateTable2rxIbh_rsp");
	static stream<stateTableEntry> stateTable2txIbh_rsp("stateTable2txIbh_rsp");
	static stream<stateTableEntry> stateTable2qpi_rsp("stateTable2qpi_rsp");
#pragma HLS STREAM depth = 2 variable = rxIbh2stateTable_upd_req
#pragma HLS STREAM depth = 2 variable = txIbh2stateTable_upd_req
#pragma HLS STREAM depth = 2 variable = qpi2stateTable_upd_req
#pragma HLS STREAM depth = 2 variable = stateTable2rxIbh_rsp
#pragma HLS STREAM depth = 2 variable = stateTable2txIbh_rsp
#pragma HLS STREAM depth = 2 variable = stateTable2qpi_rsp
#pragma HLS DATA_PACK variable = rxIbh2stateTable_upd_req
#pragma HLS DATA_PACK variable = txIbh2stateTable_upd_req
#pragma HLS DATA_PACK variable = qpi2stateTable_upd_req
#pragma HLS DATA_PACK variable = stateTable2rxIbh_rsp
#pragma HLS DATA_PACK variable = stateTable2txIbh_rsp
#pragma HLS DATA_PACK variable = stateTable2qpi_rsp

	// MSN Table
	static stream<rxMsnReq> rxExh2msnTable_upd_req("rxExh2msnTable_upd_req");
	static stream<ap_uint<16>> txExh2msnTable_req("txExh2msnTable_req");
	static stream<ifMsnReq> if2msnTable_init("if2msnTable_init");
	static stream<dmaState> msnTable2rxExh_rsp("msnTable2rxExh_rsp");
	static stream<txMsnRsp> msnTable2txExh_rsp("msnTable2txExh_rsp");
#pragma HLS STREAM depth = 2 variable = rxExh2msnTable_upd_req
#pragma HLS STREAM depth = 2 variable = txExh2msnTable_req
#pragma HLS STREAM depth = 2 variable = if2msnTable_init
#pragma HLS STREAM depth = 2 variable = msnTable2rxExh_rsp
#pragma HLS STREAM depth = 2 variable = msnTable2txExh_rsp
#pragma HLS DATA_PACK variable = rxExh2msnTable_upd_req
#pragma HLS DATA_PACK variable = if2msnTable_init
#pragma HLS DATA_PACK variable = msnTable2rxExh_rsp
#pragma HLS DATA_PACK variable = msnTable2txExh_rsp

	static stream<ap_uint<16>> exh_lengthFifo("exh_lengthFifo");
	static stream<readRequest> rx_readRequestFifo("rx_readRequestFifo");
	static stream<event> rx_readEvenFifo("rx_readEvenFifo");
	static stream<ackEvent> rx_ackEventFifo("rx_ackEventFifo");
#pragma HLS STREAM depth = 4 variable = exh_lengthFifo
#pragma HLS STREAM depth = 8 variable = rx_readRequestFifo
#pragma HLS STREAM depth = 512 variable = rx_readEvenFifo
#pragma HLS STREAM depth = 4 variable = rx_ackEventFifo
#pragma HLS DATA_PACK variable = rx_readRequestFifo
#pragma HLS DATA_PACK variable = rx_readEvenFifo
#pragma HLS DATA_PACK variable = rx_ackEventFifo

	// Read Req Table
	static stream<txReadReqUpdate> tx_readReqTable_upd("tx_readReqTable_upd");
	static stream<rxReadReqUpdate> rx_readReqTable_upd_req("rx_readReqTable_upd_req");
	static stream<rxReadReqRsp> rx_readReqTable_upd_rsp("rx_readReqTable_upd_rsp");
#pragma HLS STREAM depth = 2 variable = tx_readReqTable_upd
#pragma HLS STREAM depth = 2 variable = rx_readReqTable_upd_req
#pragma HLS STREAM depth = 2 variable = rx_readReqTable_upd_rsp
#pragma HLS DATA_PACK variable = tx_readReqTable_upd
#pragma HLS DATA_PACK variable = rx_readReqTable_upd_req
#pragma HLS DATA_PACK variable = rx_readReqTable_upd_rsp

	// Outstanding Read Req Table
	// TODO merge these two
	static stream<mqInsertReq<ap_uint<64>>> tx_readReqAddr_push("tx_readReqAddr_push");
	static stream<mqPopReq> rx_readReqAddr_pop_req("rx_readReqAddr_pop_req");
	static stream<ap_uint<64>> rx_readReqAddr_pop_rsp("rx_readReqAddr_pop_rsp");
#pragma HLS STREAM depth = 2 variable = tx_readReqAddr_push
#pragma HLS STREAM depth = 2 variable = rx_readReqAddr_pop_req
#pragma HLS STREAM depth = 2 variable = rx_readReqAddr_pop_rsp
#pragma HLS DATA_PACK variable = rx_readReqAddr_pop_req
#pragma HLS DATA_PACK variable = rx_readReqAddr_pop_rsp

	/*
	 * TIMER & RETRANSMITTER
	 */
#if RETRANS_EN
	static stream<rxTimerUpdate> rxClearTimer_req("rxClearTimer_req");
	static stream<ap_uint<24>> txSetTimer_req("txSetTimer_req");
	static stream<retransRelease> rx2retrans_release_upd("rx2retrans_release_upd");
	static stream<retransmission> rx2retrans_req("rx2retrans_req");
	static stream<retransmission> timer2retrans_req("timer2retrans_req");
	static stream<retransMeta> tx2retrans_insertMeta("tx2retrans_insertMeta");
	static stream<retransAddrLen> tx2retrans_insertAddrLen("tx2retrans_insertAddrLen");
	static stream<retransEntry> tx2retrans_insertRequest("tx2retrans_insertRequest");
	static stream<retransEvent> retransmitter2exh_eventFifo("retransmitter2exh_eventFifo");
#pragma HLS STREAM depth = 2 variable = rxClearTimer_req
#pragma HLS STREAM depth = 2 variable = txSetTimer_req
#pragma HLS STREAM depth = 2 variable = rx2retrans_release_upd
#pragma HLS STREAM depth = 2 variable = rx2retrans_req
#pragma HLS STREAM depth = 2 variable = timer2retrans_req
#pragma HLS STREAM depth = 2 variable = tx2retrans_insertMeta
#pragma HLS STREAM depth = 8 variable = tx2retrans_insertAddrLen
#pragma HLS STREAM depth = 2 variable = tx2retrans_insertRequest
#pragma HLS STREAM depth = 8 variable = retransmitter2exh_eventFifo
#endif
	// TODO this is a hack
	static stream<ap_uint<24>> tx_dstQpFifo("tx_dstQpFifo");
#pragma HLS STREAM depth = 2 variable = tx_dstQpFifo
#pragma endregion
	/*
		1. 函数功能：根据s_axis_qp_interface中的内容生成state_table的entry
		2. 参数解析
			(1)contextIn->s_axis_qp_interface->QP Context的一些信息，包含QP状态、local QPN、Remote和Local PSN、r_key和本端address->in
			(2)stateTable2qpi_rsp->stateTable2qpi_rsp，接受state_table中返回的信息->in
				b. 第一次是一个state_table的entry，state_table[qpn]
			(3)qpi2stateTable_upd_req->qpi2stateTable_upd_req，向state_table中发送的信息->out
				a. 第一次只发送qpn至state_table函数中，用于初始化一个state_table entry
				c. 第二次将local qpn，QP状态(READY_SEND)，remote PSN，local PSN,write=true发送至state_table中，用于填充state_table表项state_table[qpn]
			(4)if2msnTable_init->if2msnTable_init，存储context中的local qpn，remote_key->out
	*/
	qp_interface(s_axis_qp_interface, stateTable2qpi_rsp, qpi2stateTable_upd_req, if2msnTable_init);
/*
 * RX PATH,输入路径
 */
#pragma region
	static stream<ibOpCode> rx_ibh2exh_MetaFifo("rx_ibh2exh_MetaFifo");
	static stream<ExHeader<WIDTH>> rx_exh2drop_MetaFifo("rx_exh2drop_MetaFifo");
	static stream<ExHeader<WIDTH>> rx_drop2exhFsm_MetaFifo("rx_drop2exhFsm_MetaFifo");
	static stream<exhMeta> rx_exhMetaFifo("rx_exhMetaFifo");
#pragma HLS STREAM depth = 2 variable = rx_ibh2exh_MetaFifo
#pragma HLS STREAM depth = 8 variable = rx_exh2drop_MetaFifo
#pragma HLS STREAM depth = 2 variable = rx_drop2exhFsm_MetaFifo
#pragma HLS STREAM depth = 2 variable = rx_exhMetaFifo
#pragma HLS DATA_PACK variable = rx_ibh2exh_MetaFifo
#pragma HLS DATA_PACK variable = rx_exh2drop_MetaFifo
#pragma HLS DATA_PACK variable = rx_drop2exhFsm_MetaFifo
#pragma HLS DATA_PACK variable = rx_exhMetaFifo
#pragma endregion
	/*
		1. 函数功能：解析Infiniband Base Transport Header，并抓取出对应的元数据
		2. 参数解析：
			input->s_axis_rx_data,经过ipv4和udp后被拆掉IPV4头和UDP头的报文，此时就只剩IB Transport层的内容了->in
			metaOut->rx_ibh2fsm_MetaFifo，ibh到fsm的元数据，包括requester端指定的OpCode，P_KEY，Destination QP和PSN->in
			metaOut2->rx_ibh2exh_MetaFifo，ibh到EXH的元数据，包括requester端指定的OpCode->out
			output->rx_ibh2shiftFifo，ibh到shift的元数据，即解析出BTH后的input数据->out
	*/
	rx_process_ibh(s_axis_rx_data, rx_ibh2fsm_MetaFifo, rx_ibh2exh_MetaFifo, rx_ibh2shiftFifo);
	/*
		1. 函数功能：对输入的数据段以字节为单位右移，这个其实单纯的就是将BTH头移走，剩下的就是IB报文
		2. 参数解析
			offset->((BTH_SIZE%WIDTH)/8)= (96%512)/8 = 96/8 = 12->in
			input->解析出BTH后的input数据->in
			output->rx_shift2exhFifo，此处为移走BTH头后的数据，即剩余的IB报文,数据大小为512bit，即从下一个数据段中取高96bit数据进行了填充->out
	*/
	rshiftWordByOctet<net_axis<WIDTH>, WIDTH, 11>(((BTH_SIZE % WIDTH) / 8), rx_ibh2shiftFifo, rx_shift2exhFifo);
	/*
		此函数用于解析EXT头，在RoCE_V2 RC服务类型中，只使用到了两种EXH头，分别时RETH和AETH，因此就需要根据包的类型对EXH包进行解析。从RETH中抓出来的元数据主要是DMA Length，从AETH中抓出来的元数据主要是NAK/ACK判定
		涉及到RETH头的指令RDMA WRITE FIRST/RDMA WRITE only/RDMA WRITE only with immediate(本项目不支持)/RDMA READ Request
		涉及到AETH头的指令RDMA READ response First/RDMA READ response Last/RDMA READ response only/Acknowledge
		不需要ETH头的指令RDMA WRITE Middle/RDMA WRITE Last/RDMA READ response Middle
		1. 参数功能： 该函数主要是解析EXH头，抓取出对应元数据
		2. 参数解析：
			(1)input->rx_shift2exhFifo，移走BTH头后的数据，数据大小为512bit，即从下一个数据段中取高96bit数据进行了填充->in
			(2)metaIn->rx_ibh2exh_MetaFifo，ibh到EXH的元数据，包括OpCode->in
			(3)exhMetaFifo->rx_exhMetaFifo，从ETH中抓取出的元数据->out
				a. 如果处理的是RETH头，且处理的指令类型是RDMA Read Request，则exhMetaFifo中存储"该包不是NAK包并存储要读取数据的长度"；如果不是RDMA Read Request类型的指令，则只存储该包不是NAK包
				b. 如果处理的是AETH头，则将AETH头中的是否是NAK包标志位赋值给exhMetaFifo
				c. 如果处理的报文中没有ETH头，则在exhMetaFifo中写入该包不是NAK包
			(4)metaOut->rx_exh2drop_MetaFifo，存储ETH头的内容->out
				a. 如果处理的是RETH包，metaOut中存储RETH包的全部8byte内容
				b. 如果处理的是AETH包，metaOut中存储AETH包的全部4byte内容
				c. 如果处理的报文中没有ETH头，metaOut被初始化一个空的对象
			(5)output->rx_exh2dropFifo->out，存储经过处理的数据报文->out
				a. 如果处理的是RETH头且为write或part类型指令，则直接将解析完ETH头后的IB报文写入output中
				b. 如果处理的是AETH头且为RDMA READ response First/RDMA READ response Last/RDMA READ response only这几种情况，即牵扯到数据传输的，则给output赋值IB报文内容，如果为RC ACK，就不需要对output进行赋值了
				c. 如果处理的报文中没有ETH头，则直接将输入赋值给output，即payload
	*/
	rx_process_exh(rx_shift2exhFifo,	 // in, from rshiftWordByOctet
				   rx_ibh2exh_MetaFifo,	 // in, from rx_process_ibh
				   rx_exhMetaFifo,		 // out, to rx_ibh_fsm
				   rx_exh2drop_MetaFifo, // TODO check if this has to be dropped, out, to ipUdpMetaHandler
				   rx_exh2dropFifo);	 // out, to drop_ooo_ibh
	/*
		1. 函数功能：
		2. 参数解析
			（1)metaIn->rx_ibh2fsm_MetaFifo，ibh到fsm的元数据，包括requester端指定的OpCode，P_KEY，Destination QPN，PSN以及表明PSN有效的布尔变量true->in
			（2)exhMetaFifo->rx_exhMetaFifo,从ETH中抓取出的元数据
				（1)如果处理的是RETH头，且处理的指令类型是RDMA Read Request，则exhMetaFifo中存储"该包不是NAK包并存储要读取的packet的数量"；如果不是RDMA Read Request类型的指令，则只存储该包不是NAK包,numPkg默认为1
				（2)如果处理的是AETH头，则将AETH头中的是否是NAK包标志位赋值给exhMetaFifo，numPkg默认为1
				（3)如果处理的报文中没有ETH头，则在exhMetaFifo中写入该包不是NAK包,numPkg默认为1
			（3)stateTable_rsp->stateTable2rxIbh_rsp
				b. state_table函数根据a发送过去的数据返回epsn,oldest_outstanding_psn,max_forward,retryCounter
			（4)stateTable_upd_req->rxIbh2stateTable_upd_req,存储本地QPN与当前处理数据包是否是Response包，即如下包类型RC_RDMA_READ_RESP_FIRST || RC_RDMA_READ_RESP_MIDDLE || RC_RDMA_READ_RESP_LAST || RC_RDMA_READ_RESP_ONLY || RC_ACK
				a. 首先将local qpn与当前数据包是否为response作为request，发送给state_table函数
				c. 在判断所来的数据包是一个正常的数据包，未出现重复和invalid后，将local_qpn，remote_psn+numPkg(write=1，而在RDMA Read Request情况下会包含包的数量)以及当前包是否为response包再发送给state_table，并将write设为ture，retry_counter设为0x7
			（5)metaOut->rx_fsm2exh_MetaFifo，包含OpCode，P_KEY，L_QPN，R_PSN以及表明PSN有效的布尔变量true->out
			（6)ibhEventFifo->rx_ibhEventFifo->out
			（7)ibhDropFifo->rx_ibhDropFifo，判定是否有包需要drop->out
				(1)如果接受的包是有效的且有序的，不需要drop的话，返回一个false
				(2)如果接受的包是duplicate包，且为RDMA Read请求的话，根据Infiniband协议需要重新执行该协议，因此返回一个false
				(3)如果接收的包是duplicate包，且为RDMA Write请求的话，我们只需要返回一个ACK即可，该包不需要被执行，因此该包被drop掉即可
			（8)ibhDropMetaFifo->rx_ibhDropMetaFifo,包含两个参数isDrop和ackOnly->out
				该参数主要应用于后续的ipUdpMetaHandler函数中，作为if语句中的判断条件，判断是否需要将若干元数据提取出来，提取的条件是：isDrop==True && ackOnly==True，只要任何一个条件不满足都不行
				(1)如果当前包是in-order，均置为false->out
				(2)如果当前包是duplicate的状态，则设置为
			（9)regInvalidPsnDropCount->regInvalidPsnDropCount，记录被drop掉的包的数量->out
				(1)duplicate包的条件判断中被应用到，当接收的Packet是write请求的duplicate包时，按照Infiniband协议，我们只需要返回一个ACK，不需要执行Request，因此该包被drop掉
	*/
	rx_ibh_fsm(rx_ibh2fsm_MetaFifo,		 // in, from rx_process_ibh
			   rx_exhMetaFifo,			 // in, from rx_process_exh
			   stateTable2rxIbh_rsp,	 // in, from state_table
			   rxIbh2stateTable_upd_req, // out, to state_stable
			   rx_fsm2exh_MetaFifo,		 // out, to rx_exh_fsm
			   rx_ibhEventFifo,
			   rx_ibhDropFifo,	   // out, to drop_ooo_ibh
			   rx_ibhDropMetaFifo, // out, to ipUdpMetaHandler
#if RETRANS_EN
			   rxClearTimer_req,
			   rx2retrans_release_upd,
#endif
			   regInvalidPsnDropCount);
	/*
		1. 函数功能：根据drop标志位判断是继续当前数据包的解析还是丢掉当前数据包。如果drop为false，则表明需要继续向前执行当前数据包，output就是输入的IB报文；如果drop为true的话，则说明当前包需要被丢掉，因此output值为空
		2. 参数解析
			（1)input->rx_exh2dropFifo,（带各种IB头的）IB报文，from rx_process_exh->in
				a. 如果处理的是RETH头且为write或part类型指令，则直接将解析完ETH头后的IB报文写入output中
				b. 如果处理的是AETH头且为RDMA READ response First/RDMA READ response Last/RDMA READ response only这几种情况，即牵扯到数据传输的，则给output赋值报文内容，如果为RC ACK，就不需要对output进行赋值了
				c. 如果处理的报文中没有ETH头，则直接将输入赋值给output，即payload
			（2)metaIn->rx_ibhDropFifo,判定是否有包需要drop，即接受的包是否有效的且有序的。如果不需要drop的话，该值为false
			（3)output->rx_ibhDrop2exhFifo,如果drop为false，则表明需要继续向前执行当前数据包，output就是输入的解掉了IBH头的IB报文；如果drop为true的话，则说明当前包需要被丢掉，因此output值为空，to rx_exh_payload->out
	*/
	drop_ooo_ibh(rx_exh2dropFifo, rx_ibhDropFifo, rx_ibhDrop2exhFifo);

	// some hack TODO, make this nicer.. not sure what this is still for
	/*
		1. 函数功能：抓取UDP头+UDP报文的长度以及ETH头的内容
		2. 参数解析
			（1)input->s_axis_rx_meta,将IP与UDP的元数据进行整合，包含将IP的源地址、UDP的对端port、UDP的本端port以及UDP头+UDP报文的长度,from roce_v2->in
			（2)exHeaderInput->rx_exh2drop_MetaFifo，存储ETH头的内容，form rx_process_exh->in
				a. 如果处理的是RETH包，metaOut中存储RETH包的全部8byte内容
				b. 如果处理的是AETH包，metaOut中存储AETH包的全部4byte内容
				c. 如果处理的报文中没有ETH头，metaOut被初始化一个空的对象
			（3)dropMetaIn->rx_ibhDropMetaFifo,包含两个参数isDrop和ackOnly，如果是不需要drop掉包的话，均置为false,from rx_ibh_fsm-> in
			（4)exh_lengthFifo->exh_lengthFifo，存储UDP头+UDP报文的长度，to rx_exh_fsm->out
			（5)exHeaderOutput->rx_drop2exhFsm_MetaFifo，存储ETH头的内容,to rx_exh_fsm->out
				a. 如果处理的是RETH包，metaOut中存储RETH包的全部8byte内容
				b. 如果处理的是AETH包，metaOut中存储AETH包的全部4byte内容
				c. 如果处理的报文中没有ETH头，metaOut被初始化一个空的对象
	*/
	ipUdpMetaHandler(s_axis_rx_meta, rx_exh2drop_MetaFifo, rx_ibhDropMetaFifo, exh_lengthFifo, rx_drop2exhFsm_MetaFifo);
	/*
	1. 函数功能：解析RETH包，获取报文长度、当前数据包长度，初始化并根据相应参数更新msn_table[qpn]等
	2. 参数解析：
		(1)metaIn->rx_fsm2exh_MetaFifo,包含OpCode，P_KEY，L_QPN，R_PSN以及表明PSN有效的布尔变量true,from rx_ibh_fsm->in
		(2)udpLengthFifo->exh_lengthFifo,存储UDP头+UDP报文的长度,from ipUdpMetaHandler->in
		(3)msnTable2rxExh_rsp->msnTable2rxExh_rsp,from msn_table->in
			b. msn_table函数根据步骤a中发送的local_qpn返回初始化的msn_table表项，msn_table[qpn]
		(4)rx_readReqAddr_pop_rsp->rx_readReqAddr_pop_rsp，只有RDMA Read Resp only/first时才有用，此处没用到->in
		(5)headerInput->rx_drop2exhFsm_MetaFifo,存储ETH头的内容,from ipUdpMetaHandler->in
			如果处理的是RETH包，metaOut中存储RETH包的全部8byte内容;如果处理的是AETH包，metaOut中存储AETH包的全部4byte内容;如果处理的报文中没有ETH头，metaOut被初始化一个空的对象
		(6)memoryWriteCmd->m_axis_mem_write_cmd，生成的Memory Write指令，包括从RETH中抓出来的要写入的虚拟地址，payload长度以及路由方式：DMA->out
		(7)readRequestFifo->rx_readRequestFifo，生成readRequest，包括qpn,RETH.vaddr,RETH.DMA_Length,IBH.psn.ROUTE_DMA->out
		(8)rxExh2msnTable_upd_req->rxExh2msnTable_upd_req, to msn_table->out
			a. 将meta中的dest_qp部分即local qpn打包成一个rxExh2msnTable_upd_req发给msn_table，此时write标志位设为false
			c. 当为RDMA Write First/Only时，msn_table[qpn].msn += 1
										   msn_table[qpn].vaddr = RETH.vaddr+payloadLength  // 如果时RDMA First，也就是还会有RDMA Middle或Last，是同一个写操作，因此下次来的时候就从新的地址开始写了
										   msn_table[qpn].dma_length = remainingLength      // 还未写完的数据的长度
			   当为RDMA Write Middle/Last时，msn_table[qpn].msn += 1
											msn_table[qpn].vaddr = msn_table[qpn].vaddr+payloadLength  // 直接在上次的地址上相加就好
											msn_table[qpn].dma_length = remainingLength
			   当为RDMA Read Request时， msn_table[qpn].msn=msn_table[qpn].msn+1
										msn_table[qpn].vaddr=0
										msn_table[qpn].dma_length=0
		(9)readReqTable_upd_req->rx_readReqTable_upd_req,未在此函数中出现
		(10)rx_readReqAddr_pop_req->rx_readReqAddr_pop_req，如果数据报文中的操作类型是RC_RDMA_READ_RESP_ONLY或RC_RDMA_READ_RESP_FIRST，则将local qpn写进rx_readReqAddr_pop_req中，此处用不到->out
		(11)rx_exhEventMetaFifo->rx_exhEventMetaFifo,rx_exh_fsm通过该变量请求一个ACK事件，存储local qpn，同时设psn(0), validPsn(false), isNak(false)，只适用于RDMA Write->out
		(12)rx_pkgSplitTypeFifo->rx_pkgSplitTypeFifo，存储操作类型和route类型，只适用于RDMA Write Request，均为ROUTE_DMA->out
		(13)rx_pkgShiftTypeFifo->rx_pkgShiftTypeFifo，只适用于RDMA Read Request->out
			RDMA WRITE FIRST/ONLY时,将rx_pkgShiftTypeFifo设为SHIFT_RETH
			RDMA WRITE Middle/Last时，将rx_pkgShiftTypeFifo设为SHIFT_NONE
*/
	rx_exh_fsm(rx_fsm2exh_MetaFifo,
			   exh_lengthFifo,
			   msnTable2rxExh_rsp,
#if RETRANS_EN
			   rx_readReqTable_upd_rsp,
#endif
			   rx_readReqAddr_pop_rsp,
			   rx_drop2exhFsm_MetaFifo,
			   // rx_ibhDrop2exhFifo,
			   m_axis_mem_write_cmd,
			   rx_readRequestFifo,
#if POINTER_CHASING_EN
			   m_axis_rx_pcmeta,
#endif
			   rxExh2msnTable_upd_req,
			   rx_readReqTable_upd_req,
			   rx_readReqAddr_pop_req,
			   rx_exhEventMetaFifo,
#if RETRANS_EN

			   rx2retrans_req,
#endif
			   // rx_rethSift2mergerFifo,
			   // rx_exh2aethShiftFifo,
			   // rx_exhNoShiftFifo,
			   rx_pkgSplitTypeFifo,
			   rx_pkgShiftTypeFifo);
	/*
		1. 函数功能：判断ETH头的类型并输出相应的数据，只针对RDMA Write Request有效，对RDMA Read Request无效
		2. 参数解析
			（1)metaIn->rx_pkgSplitTypeFifo，存储操作类型opcode和route类型，如果是RDMA WRITE请求的话，为ROUTE_DMA->in
			（2)input->rx_ibhDrop2exhFifo,经过有效性和重复性检验后的报文，如果没问题，就是输入的IB报文；如果有问题，则为空->in
			（3)rx_exh2rethShiftFifo->rx_exh2rethShiftFifo，如果是带RETH头的数据包，则存储丢掉IB头的IB报文和route路径->out
			（4)rx_exh2aethShiftFifo->rx_exh2aethShiftFifo，如果是带AETH头的数据包，则存储将丢掉IB头的IB报文写->out
			（5)rx_exhNoShiftFifo->rx_exhNoShiftFifo，如果不带任何ETH头，则存储去掉IB头的IB报文和路由方式->out
	*/
	rx_exh_payload(rx_pkgSplitTypeFifo,
				   rx_ibhDrop2exhFifo,
				   // #if AXI_WIDTH == 64
				   //					rx_rethSift2mergerFifo,
				   // #else
				   rx_exh2rethShiftFifo,
				   // #endif
				   rx_exh2aethShiftFifo,
				   rx_exhNoShiftFifo);
	/*
		1. 函数功能：处理RDMA Read Request
		2. 参数解析：
			(1)requestIn->rx_readRequestFifo，rx_exh_fsm在处理RETH后生成的readRequest，包括包括qpn,RETH.vaddr,RETH.DMA_Length,IBH.psn.ROUTE_DMA(DMA方式)->in
			(2)memoryReadCmd->rx_remoteMemCmd，产生的Memory Read指令，包含qpn，所读取数据的初始地址(RETH.vaddr)，所读取数据的总长度(RETH.DMA_Length)->out
			(3)readEventFifo->rx_readEvenFifo，产生的读数据事件->out
				a. 如果一个response packet能够装下read request中想要读取的数据的话，则rx_readEvenFifo包含readOpcode(RC_RDMA_READ_RESP_ONLY)，qpn,所读取数据的长度(RETH.DMA_Length)，BTH.psn,validPsn(false), isNak(false)
				b. 如果需要两个response packet才能装下read request中想要读取的数据的话，则rx_readEvenFifo产生两次
					第1次为：readOpcode(RC_RDMA_READ_RESP_FIRST)，qpn,所读取数据的长度(PMTU)，BTH.psn,validPsn(false), isNak(false)
					第2次为：readOpcode(RC_RDMA_READ_RESP_LAST)，qpn,所读取数据的长度(RETH.DMA_Length-PMTU)，BTH.psn+1,validPsn(false), isNak(false)
				c. 如果需要三个及以上的response packet才能装下read request中想要读取的数据的话，则rx_readEvenFifo产生1+1+n次（FIRST,ONLY,MIDDLE*N）
					第1次为：readOpcode(RC_RDMA_READ_RESP_FIRST)，qpn,所读取数据的长度(PMTU)，BTH.psn,validPsn(false), isNak(false)
					第2~n次为：readOpcode(RC_RDMA_READ_RESP_MIDDLE)，qpn,所读取数据的长度(PMTU)，BTH.psn+n-1,validPsn(false), isNak(false)
					最后一次为：readOpcode(RC_RDMA_READ_RESP_LAST)，qpn,所读取数据的长度(RETH.DMA_Length-PMTU*n)，BTH.psn+n,validPsn(false), isNak(false)
	*/
	handle_read_requests(rx_readRequestFifo,
						 rx_remoteMemCmd,
						 rx_readEvenFifo);

	// TODO is order important??
	/*
		函数原型：
		void stream_merger(hls::stream<T>& in1, hls::stream<T>& in2, hls::stream<T>& out)
			{
				if (!in1.empty())
				{
					out.write(in1.read());
				}
				else if (!in2.empty())
				{
					out.write(in2.read());
				}
			}
		1. 函数功能：选择事件，如果触发rx_ibhEventFifo则表明出错，request包被drop掉了；反之，如果触发rx_exhEventMetaFifo，表明需要产生一个ACK请求，只对RDMA Write Request有效，RDMA Read触发的是readEventFifo
		2. 参数解析：
			（1）rx_exhEventMetaFifo，来自于rx_exh_fsm函数，通过该变量请求一个ACK事件，存储local qpn，同时设psn(0), validPsn(false), isNak(false)。如果要返回ACK的话直接把他镀金rx_ackEventFifo就好
			（2）rx_ibhEventFifo，来自于rx_ibh_fsm函数，只有包是duplicate或者invalid的时候才会被赋值
	*/
	stream_merger<ackEvent>(rx_exhEventMetaFifo, rx_ibhEventFifo, rx_ackEventFifo);

	// RETH: 16 bytes
	// TODO not required for AXI_WIDTH == 64, also this seems to have a bug, this goes together with the hack in process_exh where we don't write the first word out
	// #if AXI_WIDTH != 64
	/*
		1. 函数功能：移除IB报文中的RETH头
		2. 参数解析：
			（1)offset->((RETH_SIZE%WIDTH)/8)=128/8=16，也就是左移16个字节
			（2)input->rx_exh2rethShiftFifo，输入的丢掉IB头的报文
			（3)output->rx_rethSift2mergerFifo，输出丢掉RETH头的IB报文
	*/
	rshiftWordByOctet<routed_net_axis<WIDTH>, WIDTH, 12>(((RETH_SIZE % WIDTH) / 8), rx_exh2rethShiftFifo, rx_rethSift2mergerFifo);
	// #endif
	//  AETH: 4 bytes
	/*
		1. 函数功能：移除IB报文中的AETH头
		2. 参数解析：
			（1)offset->((AETH_SIZE%WIDTH)/8)=32/8=4，也就是左移4个字节
			（2)input->rx_rx_exh2aethShiftFifo，输入的丢掉IB头的报文
			（3)output->rx_aethSift2mergerFifo，输出丢掉AETH头的IB报文
	*/
	rshiftWordByOctet<net_axis<WIDTH>, WIDTH, 13>(((AETH_SIZE % WIDTH) / 8), rx_exh2aethShiftFifo, rx_aethSift2mergerFifo);
	/*
		1. 函数功能：只针对RDMA Write操作，提取出要写入的数据
		2. 参数解析：
			（1)rx_pkgShiftTypeFifo->rx_pkgShiftTypeFifo,为当操作码为RDMA WRITE FIRST/ONLY时,将rx_pkgShiftTypeFifo设为SHIFT_RETH，而当操作码为RDMA WRITE MIDDLE/LAST，将rx_pkgShiftTypeFifo设为SHIFT_NONE->in
			（2)rx_aethSift2mergerFifo->rx_aethSift2mergerFifo,丢掉IB头和AETH头的IB报文->in
			（3)rx_rethSift2mergerFifo->rx_rethSift2mergerFifo,丢掉IB头和RETH头的IB报文->in
			（4)rx_NoSift2mergerFifo->rx_exhNoShiftFifo,如果不带任何ETH头，则存储去掉IB头的IB报文和路由方式->in
			（5)m_axis_mem_write_data->m_axis_mem_write_data，要往memory中写入的内容->out
				针对WRITE_ONLY和WRITE_FIRST操作，m_axis_mem_write_data存储的是丢掉BTH头和RETH头的报文
				针对WRITE MIDDLE/LAST操作，m_axis_mem_write_data存储的是丢掉BTH头的报文
	*/
	merge_rx_pkgs(rx_pkgShiftTypeFifo, rx_aethSift2mergerFifo, rx_rethSift2mergerFifo, rx_exhNoShiftFifo, m_axis_mem_write_data);

/*
 * TX PATH
 */
#pragma region
	// application request handler
	static stream<pkgInfo> tx_pkgInfoFifo("tx_pkgInfoFifo");
	// static stream<net_axis<WIDTH> > tx_readDataFifo("tx_readDataFifo");
	static stream<net_axis<WIDTH>> tx_split2aethShift("tx_split2aethShift");
	static stream<net_axis<WIDTH>> tx_split2rethMerge("tx_split2rethMerge");
	static stream<net_axis<WIDTH>> tx_rethMerge2rethShift("tx_rethMerge2rethShift");
#pragma HLS STREAM depth = 128 variable = tx_pkgInfoFifo
// #pragma HLS STREAM depth=4 variable=tx_readDataFifo
#pragma HLS STREAM depth = 4 variable = tx_split2aethShift
#pragma HLS STREAM depth = 4 variable = tx_split2rethMerge
#pragma HLS STREAM depth = 4 variable = tx_rethMerge2rethShift
#pragma endregion
	/*
		1. 函数功能：
		2. 参数解析：
			（1）s_axis_tx_meta->s_axis_tx_meta
			（2）tx_local_memCmdFifo->tx_localMemCmdFifo,本地写需要到内存获取数据的地址长度
			（3）tx_localReadAddrFifo->tx_readReqAddr_push
			（4）tx_localTxMeta->tx_appMetaFifo
	*/
	// 只有在本端作为requester端主动向外发送数据时才用到的函数，此处未用到
	// 将s_axis_tx_meta传入到 tx_appMetaFifo
	local_req_handler(s_axis_tx_meta,
#if RETRANS_EN
					  retransmitter2exh_eventFifo,
#endif
					  tx_localMemCmdFifo,
					  tx_readReqAddr_push,
#if !RETRANS_EN
					  tx_appMetaFifo);
#else
					  tx_appMetaFifo,
					  tx2retrans_insertAddrLen);
#endif

	// Only used when FPGA does standalon, currently disabled
#ifdef FPGA_STANDALONE
	fpga_data_handler(s_axis_tx_data, tx_appDataFifo);
#endif
	/*
		1. 函数功能：
		2. 参数解析：
			(1)tx_pkgInfoFifo->tx_pkgInfoFifo,存储RDMA Read Response Packet的部分信息，包括type(AETH),source(MEM),words((RETH.DMA_Length+(WIDTH/8)-1)/(WIDTH/8))->in
			(2)s_axis_tx_data->s_axis_tx_data，没用到->in
			(3)s_axis_mem_read_data->s_axis_mem_read_data，当ib_transport_procotol将m_axis_read_cmd参数传出去后，DMA执行数据读写，将读写的数据从该引脚传入，每次传入的数据是512bit，根据传进来的数据总量判断是否需要生成RDMA READ MIDDLE RESP。->out
			(4)remoteReadData->tx_split2aethShift，s_axis_mem_read_data传进来的填充RDMA READ FIRST/ONLY/LAST的512bit payload->out
			(5)localReadData->tx_rethMerge2rethShift，用不到->out
			(6)rawPayFifo->tx_rawPayFifo，s_axis_mem_read_data传进来的填充RDMA READ MIDDLE RESP的512bit payload->out
	*/
	tx_pkg_arbiter(tx_pkgInfoFifo,
				   s_axis_tx_data,
				   s_axis_mem_read_data,
				   tx_split2aethShift,
#ifdef FPGA_STANDALONE
				   tx_split2rethMerge);
#else
				   tx_rethMerge2rethShift,
#endif
					tx_rawPayFifo);

#ifdef FPGA_STANDALONE
					stream_merger(tx_split2rethMerge, tx_appDataFifo, tx_rethMerge2rethShift);
#endif
					// merges and orders event going to TX path
					/*
						1. 函数功能：生成response packet中BTH与ETH需要的元数据，并利用本端qpn作为key去conn_table中索取数据
						对与本端主动写，则只是将tx_appMetaFifo提取到tx_ibhMetaFifo和tx_exhMetaFifo
						2. 参数功能：
							(1)rx_ackEventFifo->rx_ackEventFifo，本端作为responder并接受write request时触发此事件，存储local qpn，同时设psn(0), validPsn(false), isNak(false)->in
							(2)rx_readEvenFifo->rx_readEvenFifo，本端作为responder并接收read request时触发此事件->in
								a. 如果一个response packet能够装下read request中想要读取的数据的话，则rx_readEvenFifo包含readOpcode(RC_RDMA_READ_RESP_ONLY)，qpn,所读取数据的长度(RETH.DMA_Length)，BTH.psn,validPsn(false), isNak(false)
								b. 如果需要两个response packet才能装下read request中想要读取的数据的话，则rx_readEvenFifo产生两次
									第1次为：readOpcode(RC_RDMA_READ_RESP_FIRST)，qpn,所读取数据的长度(PMTU)，BTH.psn,validPsn(false), isNak(false)
									第2次为：readOpcode(RC_RDMA_READ_RESP_LAST)，qpn,所读取数据的长度(RETH.DMA_Length-PMTU)，BTH.psn+1,validPsn(false), isNak(false)
								c. 如果需要三个及以上的response packet才能装下read request中想要读取的数据的话，则rx_readEvenFifo产生1+1+n次（FIRST,ONLY,MIDDLE*N）
									第1次为：readOpcode(RC_RDMA_READ_RESP_FIRST)，qpn,所读取数据的长度(PMTU)，BTH.psn,validPsn(false), isNak(false)
									第2~n次为：readOpcode(RC_RDMA_READ_RESP_MIDDLE)，qpn,所读取数据的长度(PMTU)，BTH.psn+n-1,validPsn(false), isNak(false)
									最后一次为：readOpcode(RC_RDMA_READ_RESP_LAST)，qpn,所读取数据的长度(RETH.DMA_Length-PMTU*n)，BTH.psn+n,validPsn(false), isNak(false)
							(4)tx_ibhconnTable_req->tx_ibhconnTable_req，ibh到connection Table的req，只包含local qpn信息->out
							(5)tx_ibhMetaFifo->tx_ibhMetaFifo->out
								当处理write request时，存储相关元数据，包括包括opcode=RC_ACK,partition_key=0,dest_qp=rx_ackEventFifo.qpn,psn=0,validPSN=false,numPkg=1
								当处理read request时，存储的是op_code(RC_RDMA_READ_RESP_ONLY/FIRST/MIDDLE/LAST)，partition_key=0,dest_qp=rx_readEventFifo.qpn，validPSN=false,numPkg=1
							(6)tx_exhMetaFifo->tx_exhMetaFifo->out
								当处理write request时，存储rx_ackEventFifo，包含opcode=RC_ACK,qpn=rx_ackEventFifo.qpn,psn=0,validPSN=false,isNak=rx_ackEventFifo.isNak->out
								当处理read request时，存储rx_readEvenFifo，包括：
									a. 如果一个response packet能够装下read request中想要读取的数据的话，则rx_readEvenFifo包含readOpcode(RC_RDMA_READ_RESP_ONLY)，qpn,所读取数据的长度(RETH.DMA_Length)，BTH.psn,validPsn(false), isNak(false)
									b. 如果需要两个response packet才能装下read request中想要读取的数据的话，则rx_readEvenFifo产生两次
										第1次为：readOpcode(RC_RDMA_READ_RESP_FIRST)，qpn,所读取数据的长度(PMTU)，BTH.psn,validPsn(false), isNak(false)
										第2次为：readOpcode(RC_RDMA_READ_RESP_LAST)，qpn,所读取数据的长度(RETH.DMA_Length-PMTU)，BTH.psn+1,validPsn(false), isNak(false)
									c. 如果需要三个及以上的response packet才能装下read request中想要读取的数据的话，则rx_readEvenFifo产生1+1+n次（FIRST,ONLY,MIDDLE*N）
										第1次为：readOpcode(RC_RDMA_READ_RESP_FIRST)，qpn,所读取数据的长度(PMTU)，BTH.psn,validPsn(false), isNak(false)
										第2~n次为：readOpcode(RC_RDMA_READ_RESP_MIDDLE)，qpn,所读取数据的长度(PMTU)，BTH.psn+n-1,validPsn(false), isNak(false)
										最后一次为：readOpcode(RC_RDMA_READ_RESP_LAST)，qpn,所读取数据的长度(RETH.DMA_Length-PMTU*n)，BTH.psn+n,validPsn(false), isNak(false)

					*/
					meta_merger(rx_ackEventFifo, rx_readEvenFifo, tx_appMetaFifo, tx_ibhconnTable_req, tx_ibhMetaFifo, tx_exhMetaFifo);

					// Shift playload by 4 bytes for AETH (data from memory)
					/*
						1. 函数功能： 判断RDMA READ RESP是否带有AETH头，如果带的化，右移4byte，为待会生成的AETH腾位置
						2. 参数解析：
							(1)tx_split2aethShift，s_axis_mem_read_data传进来的填充RDMA READ FIRST/ONLY/LAST的512bit payload->in
							(2)tx_aethShift2payFifo，右移4byte后的数据，
					*/
					lshiftWordByOctet<WIDTH, 12>(((AETH_SIZE % WIDTH) / 8), tx_split2aethShift, tx_aethShift2payFifo);
					// Shift payload another 12 bytes for RETH (data from application)
					//  未用到
					lshiftWordByOctet<WIDTH, 13>(((RETH_SIZE % WIDTH) / 8), tx_rethMerge2rethShift, tx_rethShift2payFifo);

					// Generate EXH，本端作为responder回复write请求产生ACK自本函数始，上面5个函数除了meta_merger外均用于本端作为requester时向外发送的包
					/*
						1. 函数功能：在responder端成功接受并解析request时，用于生成AETH头
						2. 参数解析：
							(1)metaIn->tx_exhMetaFifo,存储相关元数据->in
								当处理write request的response时，包含opcode=RC_ACK,qpn=rx_ackEventFifo.qpn,psn=0,validPSN=false,isNak=rx_ackEventFifo.isNak
								当处理read request的response时，包含：
									a. 如果一个response packet能够装下read request中想要读取的数据的话，则rx_readEvenFifo包含readOpcode(RC_RDMA_READ_RESP_ONLY)，qpn,所读取数据的长度(RETH.DMA_Length)，BTH.psn,validPsn(false), isNak(false)
									b. 如果需要两个response packet才能装下read request中想要读取的数据的话，则rx_readEvenFifo产生两次
										第1次为：readOpcode(RC_RDMA_READ_RESP_FIRST)，qpn,所读取数据的长度(PMTU)，BTH.psn,validPsn(false), isNak(false)
										第2次为：readOpcode(RC_RDMA_READ_RESP_LAST)，qpn,所读取数据的长度(RETH.DMA_Length-PMTU)，BTH.psn+1,validPsn(false), isNak(false)
									c. 如果需要三个及以上的response packet才能装下read request中想要读取的数据的话，则rx_readEvenFifo产生1+1+n次（FIRST,ONLY,MIDDLE*N）
										第1次为：readOpcode(RC_RDMA_READ_RESP_FIRST)，qpn,所读取数据的长度(PMTU)，BTH.psn,validPsn(false), isNak(false)
										第2~n次为：readOpcode(RC_RDMA_READ_RESP_MIDDLE)，qpn,所读取数据的长度(PMTU)，BTH.psn+n-1,validPsn(false), isNak(false)
										最后一次为：readOpcode(RC_RDMA_READ_RESP_LAST)，qpn,所读取数据的长度(RETH.DMA_Length-PMTU*n)，BTH.psn+n,validPsn(false), isNak(false)
							(2)msnTable2txExh_rsp->msnTable2txExh_rsp,msn_table的返回值->in
								b. msn_table函数返回的数据包括：msn_table[qpn].msn, msn_table[qpn].r_key
							(3)txExh2msnTable_req->txExh2msnTable_req,发送至msn_table的request->out
								a. 进入该函数后，首先给txExh2msnTable_req赋值为local qpn，去MSN table中根据本地qpn读取MSN Table entry
							(4)tx_readReqTable_upd->tx_readReqTable_upd，没用到->none
							(5)lengthFifo->tx_lengthFifo，生成的Response报文的长度->out
								如果是RDMA WRITE RESP，则为BTH+AETH+ICRC=12+4+4=20字节
								如果是RDMA REAF RESP，
									如果是RDMA READ ONLY/FIRST/LAST RESP，则为12+4+meta.length(要返回的数据的长度)+4
									如果是RDMA READ MIDDLE，则为12+meta.length(要返回的数据的长度)+4，移除了AETH头
							(6)packetInfoFifo->tx_packetInfoFifo,存储ACK报文的基本信息->out
								如果是RDMA WRITE RESP，则包含isAETH=True,hasHeader=true,hasPayload=false，就是单纯的ACK
								如果是RDMA REAF RESP
									如果是RDMA READ ONLY/FIRST/LAST RESP，则为isAETH=True,hasHeader=true,hasPayload=(payloadLength!=0)
									如果是RDMA READ MIDDLE，则为isAETH=True,hasHeader=false,hasPayload=true(payloadLength!=0)
							(7)output->tx_exh2payFifo，生成的512bit的Response报文->out
								如果是RDMA WRITE RESP或者RDMA READ ONLY/FIRST/LAST RESP，则目前只包含了4byte AETH的有效内容
								如果是RDMA READ MIDDLE RESP，则不包含任何有效内容，就是一个初始化的512bit报文
					*/
					generate_exh(tx_exhMetaFifo,
#if POINTER_CHASING_EN
								 s_axis_tx_pcmeta,
#endif
								 msnTable2txExh_rsp,
								 txExh2msnTable_req,
								 tx_readReqTable_upd,
								 tx_lengthFifo,
								 tx_packetInfoFifo,
#if RETRANS_EN
								 txSetTimer_req,
#endif
								 tx_exh2payFifo);
					// Append payload to AETH or RETH
					/*
						1. 函数功能：给RDMA Response Packet添加payload信息，如果是RDMA WRITE ACK的话用不到该函数，但如果是RDMA READ RESP的话就需要用到了
						2. 参数解析:
							(1)packetInfoFifo->tx_packetInfoFifo,存储ACK报文的基本信息，包含isAETH=True,hasHeader=true,hasPayload=false，就是单纯的ACK->in
								如果是RDMA WRITE RESP，则包含isAETH=True,hasHeader=true,hasPayload=false，就是单纯的ACK
								如果是RDMA REAF RESP
									如果是RDMA READ ONLY/FIRST/LAST RESP，则为isAETH=True,hasHeader=true,hasPayload=(payloadLength!=0)
									如果是RDMA READ MIDDLE，则为isAETH=True,hasHeader=false,hasPayload=true(payloadLength!=0)
							(2)tx_headerFifo->tx_exh2payFifo,生成的512bit的IB ACK报文->in
								如果是RDMA WRITE RESP或者RDMA READ ONLY/FIRST/LAST RESP，则目前只包含了4byte AETH的有效内容，last=1
								如果是RDMA READ MIDDLE RESP，则为空，没有值传进来
								如果是RDMA WRITE ACK，则目前也只包含了4byte AETH有效内容,last=1
							(3)tx_aethPayloadFifo->tx_aethShift2payFifo->in
								RDMA READ FIRST/LAST/ONLY AETH后面添加的Payload
							(4)tx_rethPayloadFifo->tx_rethShift2payFifo,没用到->none
							(5)tx_rawPayloadFifo->tx_rawPayFifo,来自tx_pkg_arbiter函数，针对RDMA READ MIDDLE RESP，没有AETH头，直接返回Payload->none
							(6)tx_exh2shiftFifo，输出当前只包含有效四字节的AETH的512bit ACK报文输出->out
					*/
					append_payload(tx_packetInfoFifo, tx_exh2payFifo, tx_aethShift2payFifo, tx_rethShift2payFifo, tx_rawPayFifo, tx_exh2shiftFifo);

					// BTH: 12 bytes
					/*
						1. 函数功能：对数据报文进行右移12字节，预留出BTH的空间，以用于后续填充
						2. 参数解析
							(2)tx_shift2ibhFifo->右移后的512字节数据，其中前12字节为0，为BTH预留出来->out
					*/
					lshiftWordByOctet<WIDTH, 11>(((BTH_SIZE % WIDTH) / 8), tx_exh2shiftFifo, tx_shift2ibhFifo);
					/*
						1. 函数功能：生成BTH头
						2. 参数解析：
							(1)metaIn->tx_ibhMetaFifo,输入元数据，包含包括opcode=RC_ACK,partition_key=0,dest_qp=loacl.qpn,psn=0,validPSN=false,numPkg=1->in
							(2)dstQpIn->tx_dstQpFifo,远端QPN，该值通过tx_ipUdpMetaMerger函数得出->in
							(3)stateTable2txIbh_rsp->stateTable2txIbh_rsp,stateTable返回值->in
								b. 直接返回state_table[qpn]这个entry，主要利用里面的epsn
							(4)txIbh2stateTable_upd_req->txIbh2stateTable_upd_req,向stateTable发出请求->out
								a. 利用local qpn去state_table中请求state_table[qpn]这个entry
							(5)tx_ibhHeaderFifo->tx_ibhHeaderFifo，存储生成的BTH->out
					*/
					generate_ibh(tx_ibhMetaFifo,
								 tx_dstQpFifo,
								 stateTable2txIbh_rsp,
								 txIbh2stateTable_upd_req,
#if RETRANS_EN
								 tx2retrans_insertMeta,
#endif
								 tx_ibhHeaderFifo);

					// prependt ib header
					/*
						1. 函数功能:将BTH头放入现有的ACK报文中
						2. 参数解析：
							(1)tx_ibhHeaderFifo->tx_ibhHeaderFifo,生成的12字节BTH->in
							(2)tx_ibhPayloadFifo->tx_shift2ibhFifo，512字节数据，其中前12字节为BTH预留出来的0，13-16字节为AETH->in
							(3)m_axis_tx_data->m_axis_tx_data，存储的是512bit ACK Packet，其中前12字节为BTH，13-16字节为AETH->out
					*/
					prepend_ibh_header(tx_ibhHeaderFifo, tx_shift2ibhFifo, m_axis_tx_data);

					// Get Meta data for UDP & IP layer
					/*
						1. 函数功能：为后续添加UDP头、IP头收集元数据
						2. 参数解析：
							（1)tx_connTable2ibh_rsp->tx_connTable2ibh_rsp,在meta_merger函数中，有利用qpn对connTable进行过请求，并获得了返回值，该返回值也输入到了tx_ipUdpMetaMerger中->in
							（2)tx_lengthFifo->tx_lengthFifo->in
								如果是RDMA WRITE RESP，则为BTH+AETH+ICRC=12+4+4=20字节
								如果是RDMA REAF RESP，
									如果是RDMA READ ONLY/FIRST/LAST RESP，则为12+4+meta.length(要返回的数据的长度)+4
									如果是RDMA READ MIDDLE，则为12+meta.length(要返回的数据的长度)+4，移除了AETH头
							（3)m_axis_tx_meta->m_axis_tx_meta，继续下传至UDP/IP的元数据，包括remote_ip_address，remote_udp_port,RDMA_DEFAULT_PORT,len(BTH+AETH+ICRC=12+4+4=20字节)->out
							（4)tx_dstQpFifo->tx_dstQpFifo，输出remote qpn->out
					*/
					tx_ipUdpMetaMerger(tx_connTable2ibh_rsp, tx_lengthFifo, m_axis_tx_meta, tx_dstQpFifo);

					// merge read requests
					/*
						1. 函数功能：合并处理read request，这里的read request分成两部分，一是locol read request，也就是我本地发出去的read request；二是remote read request，也就是接收的远端的远端的read request
						2. 参数解析：
							1. remoteReadRequests->rx_remoteMemCmd，从requester端发来的read request packet中抓取出来的read cmd，包含qpn，所读取数据的初始地址(RETH.vaddr)，所读取数据的总长度(RETH.DMA_Length)->in
							2. localReadRequests->tx_localMemCmdFifo,未用到，none->in
							3. out->m_axis_mem_read_cmd,解析远端的读请求生成的内存读取指令，包括远端所要读取数据的初始地址(RETH.vaddr)，所读取数据的总长度(RETH.DMA_Length)，ROUTE(ROUTE_DMA)->out
							4. pkgInfoFifo->tx_pkgInfoFifo，存储RDMA Read Response Packet的部分信息，包括type(AETH),source(MEM),words((RETH.DMA_Length+(WIDTH/8)-1)/(WIDTH/8))->out
					*/
					mem_cmd_merger<WIDTH>(rx_remoteMemCmd, tx_localMemCmdFifo, m_axis_mem_read_cmd, tx_pkgInfoFifo);

					// Data structures

					conn_table(tx_ibhconnTable_req,
							   s_axis_qp_conn_interface,
							   tx_connTable2ibh_rsp);
					/*
					1. 函数功能：初始化state_table
					2. 参数解析
						(1)rxIbh2stateTable_upd_req->rxIbh2stateTable_upd_req，
							e. 此时已经接收到IB报文，首先接受的是从rx_ibh_rsm函数中传递进来的local qpn与当前数据包是否为response
							g. 在rx_ibh_rsm判断所来的数据包是一个正常的数据包，未出现重复和invalid后，将local_qpn，remote_psn+numPkg(write=0，而在RDMA Read Request情况下会包含包的数量)以及当前包是否为response包传递进来，并将write设为true
							在执行完g操作后，更新state_table[qpn]中的数值，如果是write的情况，resp_epsn自加1,如果是read request，则自加需要request包的数量，并将etry_counter设为0x7
						(2)txIbh2stateTable_upd_req->txIbh2stateTable_upd_req,  即本地QPN
						(3)qpi2stateTable_upd_req->qpi2stateTable_upd_req，接受qp_interface函数传递进来的参数->in
							a. 当IB报文来之前，首先接受来自qp_interface发送来的qpi2stateTable_upd_req请求，该请求中只包含local_qpn的值
							c. qp_interface函数接收到步骤b中返回stateTable2qpi_rsp后，再将local qpn，QP状态(READY_SEND)，remote PSN，local PSN传进来，并将write设为true
						(4)stateTable2rxIbh_rsp->stateTable2rxIbh_rsp
							f. 根据e中传递进来的qpn，将state_table[qpn]中的部分参数返回，包括epsn,oldest_outstanding_psn,max_forward,retryCounter
						(5)stateTable2txIbh_rsp->stateTable2txIbh_rsp
						(6)stateTable2qpi_rsp->stateTable2qpi_rsp，回应qp_interface函数传递进来的参数->out
							b. 根据qp_interface传进来的qpn，本函数创建一个state_table entry:state_table[qpn]并存储在stateTable2qpi_rsp中，返回给qp_interface函数。
							d. 根据c中传递进来的参数，填充state_table[qpn]，包括resp_epsn等
					*/
					state_table(rxIbh2stateTable_upd_req,
								txIbh2stateTable_upd_req,
								qpi2stateTable_upd_req,
								stateTable2rxIbh_rsp,
								stateTable2txIbh_rsp,
								stateTable2qpi_rsp);
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
					msn_table(rxExh2msnTable_upd_req,
							  txExh2msnTable_req,
							  if2msnTable_init,
							  msnTable2rxExh_rsp,
							  msnTable2txExh_rsp);

					read_req_table(tx_readReqTable_upd,
#if !RETRANS_EN
								   rx_readReqTable_upd_req);
#else
				   rx_readReqTable_upd_req,
				   rx_readReqTable_upd_rsp);
#endif

					multi_queue<ap_uint<64>, MAX_QPS, 2048>(tx_readReqAddr_push,
															rx_readReqAddr_pop_req,
															rx_readReqAddr_pop_rsp);

#if RETRANS_EN
					merge_retrans_request(tx2retrans_insertMeta, tx2retrans_insertAddrLen, tx2retrans_insertRequest);

					transport_timer(rxClearTimer_req,
									txSetTimer_req,
									timer2retrans_req);

					retransmitter(rx2retrans_release_upd,
								  rx2retrans_req,
								  timer2retrans_req,
								  tx2retrans_insertRequest,
								  retransmitter2exh_eventFifo);
#endif
}

template void ib_transport_protocol<DATA_WIDTH>( // RX
	stream<ipUdpMeta> &s_axis_rx_meta,
	stream<net_axis<DATA_WIDTH>> &s_axis_rx_data,
	// stream<net_axis<DATA_WIDTH> >&	m_axis_rx_data,
	// TX
	stream<txMeta> &s_axis_tx_meta,
	stream<net_axis<DATA_WIDTH>> &s_axis_tx_data,
	stream<ipUdpMeta> &m_axis_tx_meta,
	stream<net_axis<DATA_WIDTH>> &m_axis_tx_data,
	// Memory
	stream<routedMemCmd> &m_axis_mem_write_cmd,
	stream<routedMemCmd> &m_axis_mem_read_cmd,
	// stream<mmStatus>&	s_axis_mem_write_status,

	stream<routed_net_axis<DATA_WIDTH>> &m_axis_mem_write_data,
	stream<net_axis<DATA_WIDTH>> &s_axis_mem_read_data,

	// Interface
	stream<qpContext> &s_axis_qp_interface,
	stream<ifConnReq> &s_axis_qp_conn_interface,

// Pointer chasing
#if POINTER_CHASING_EN
	stream<ptrChaseMeta> &m_axis_rx_pcmeta,
	stream<ptrChaseMeta> &s_axis_tx_pcmeta,
#endif

	ap_uint<32> &regInvalidPsnDropCount);
