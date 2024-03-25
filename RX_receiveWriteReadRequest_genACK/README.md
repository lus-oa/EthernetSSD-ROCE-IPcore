# EthernerSSD
## Rx_receiveWriteReadRequest_genAck->First commit
### 1. 实现功能：作为responder端接受Write/Read requester端请求并返回ACK和数据
### 2. 代码修改部分：
(1)添加IPV4 checksum功能（自写） /hls/ipv4/ipv4.cpp/compute_ipv4_checksum_xk()  
(2)添加CRC32功能（直接用的原版）。将原本的奇偶数据包CRC计算修改为单CRC计算，并去除compute_crc函数内for循环中的#param unroll，并将函数开头的#param pipeline II=1修改为param pipeline II=6，来抵消硬件资源不足造成的影响。  /hls/rocev2/rocev2.cpp/line904\~949，DISABLE_CRC_CHECK=None(rocev2.hpp)    
(3)在返回RC_ACK时，UDP头中源端口/目的端口的内容与requester中UDP包中的内容相同，即requester中的源UDP端口与responder端中的源UDP端口相同  /hls/udp/udp.cpp/line115\~117   
(4)在IPV4头中添加Authentication与TTL字段，分别设置为0x0002与0xff，前者无特殊含义  /hls/ipv4/ipv4.hpp/line644\~645    
(5)IPV4头中的48-63位从0变为了0x0040，/hls/ipv4/ipv4.hpp/line646  
(6)修复连续RDMA Write指令无法回复单次ACK的bug，主要修改为：  
/hls/ib_transport/ib_transport.cpp/line801，加入判断指令： if(meta.op_code != RC_RDMA_WRITE_FIRST)  
/hls/ib_transport/ib_transport.cpp/line838，加入判断指令： if(meta.op_code != RC_RDMA_WRITE_MIDDLE)  
### 3. ip核安装指令
(1) cd hls/rocev2   
(2) mkdir build     
(3) cd build        
(4) cmake .. -DDATA_WIDTH=64 -DFPGA_PART=xczu7eg-ffvc1156-2-i -DCLOCK_PERIOD=8 -DVIVADO_HLS_ROOT_DIR=/opt/Xilinx/Vivado//2019.1/bin/ -DVIVADO_ROOT_DIR=/opt/Xilinx/Vivado//2019.1/bin/    
(5) faketime '2021-03-01 13:00:00' make installip -j8    
### 4. 调试记录
1. 2024.1.1 想要RDMA Write First/Middle不产生ACK，
（1）15：26--消除所有会产生隐患的输出函数
（2）16：14--为了测试，将rocev2_config.hpp.in中的PMTU设置为了64

### 5. 本代码中打印数值的方式
1. 方式1，打印常量
std::cout << "local ip address ";
print(std::cout, local_ip_address);

2. 打印AXI总线传输进来的数据
if(!rx_udp2shiftFifo.empty())  {
net_axis<WIDTH> currWord;
rx_udp2shiftFifo.read(currWord);
std::cout<<"currWord= ";
print(std::cout,currWord);
std::cout<<std::endl;
}

### 6. 报文分析(RDMA Write First + RDMA Write Last)
45 00 00 7c 00 00 00 00 40 11 00 00 65 4c d0 14 ffff 0
65 4c d0 0b df 94 12 b7 00 68 00 00 06 00 ff ff ffff 0
00 00 00 11 80 9d be 5d 00 00 00 00 00 00 00 00 ffff 0
00 00 00 00 00 00 00 80 14 00 00 00 00 00 00 00 ffff 0
1c 00 00 00 00 00 00 00 24 00 00 00 00 00 00 00 ffff 0
2c 00 00 00 00 00 00 00 34 00 00 00 00 00 00 00 ffff 0
3c 00 00 00 00 00 00 00 44 00 00 00 00 00 00 00 ffff 0
4c 00 00 00 00 00 00 00 ef be ad de 00 00 00 00 0fff 1
1. IPV4（20字节）
45 00 00 7c 00 00 00 00 40 11 00 00 65 4c d0 14 65 4c d0 0b
（1）45：版本+首部长度（4指的是IPV4，5指的是5*4=20字节（以4字节为单位），说明IPV4头为20字节长）
（2）00：服务类型
（3）007c：（IPV4报头+数据部分）长度=7*16+12 = 124字节
（4）0000：认证
（5）0000：标志+段偏移量
（6）40 11：TTL + 协议
（7）00 00：校验和
（8）65 4c d0 14：源IP地址
（9）65 4c d0 0b：目的IP地址
2. UDP（8字节）
df 94 12 b7
（1）df 94：源端口
（2）12 b7：目的端口
（3）00 68：（UDP头+数据部分）总长度=6*16+8=104字节
（4）00 00：校验和
3. IB头（12字节） 
（1）06：Opcode，RDMA WRITE FIRST
（2）00
（3）ff ff：Partition Key
（4）00：Reserved
（5）00 00 11：Destination QP
（6）80：A+Reserved
（7）9d be 5d：PSN
4. RETH（16字节）
（1）00 00 00 00：Virtual Address(高32位)
（2）00 00 00 00：Virtual Address(低32位）
（3）00 00 00 00：R_KEY
（4）00 00 00 80：DMA_LENGTH = 0*16 + 8*16 = 128字节
（5）14 00 00 00 00 00 00 00 1c 00 00 00 00 00 00 00 24 00 00 00 00 00 00 00 
    2c 00 00 00 00 00 00 00 34 00 00 00 00 00 00 00 3c 00 00 00 00 00 00 00 
    44 00 00 00 00 00 00 00 4c 00 00 00 00 00 00 00 ： 前半部分Payload = 64字节
（6）ef be ad de：CRC


0 0000 0
1 0001 1
2 0010 2
3 0011 3
4 0100 4
5 0101 5
6 0110 6
7 0111 7
8 1000 8 
9 1001 9
a 1010 10
b 1011 11
c 1100 12
d 1101 13 
e 1110 14
f 1111 15

s_axis_qp_interface,       // QP Context的一些信息，包含QP状态、本端QPN、Remote PSN、Local PSN、r_key和virtual address
s_axis_qp_conn_interface,  // 双方connection的一些信息，包含本端QPN、对端QPN、对端IP地址和对端UDP端口


45 00 00 44 00 00 00 00 40 11 00 00 65 4c d0 14 ffff 0
65 4c d0 0b df 94 12 b7 00 30 00 00 0a 00 ff ff ffff 0
00 00 00 11 80 9d be 5d 00 00 00 00 00 00 00 00 ffff 0
00 00 00 00 00 00 00 08 12 34 56 78 9a bc de fa ffff 0
ef be ad de 00 00 00 00 00 00 00 00 00 00 00 00 000f 1
