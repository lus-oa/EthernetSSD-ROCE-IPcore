// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2019.1
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module split_tx_meta (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        tx_ipUdpMetaFifo_V_t_1_dout,
        tx_ipUdpMetaFifo_V_t_1_empty_n,
        tx_ipUdpMetaFifo_V_t_1_read,
        tx_ipUdpMetaFifo_V_t_dout,
        tx_ipUdpMetaFifo_V_t_empty_n,
        tx_ipUdpMetaFifo_V_t_read,
        tx_ipUdpMetaFifo_V_m_dout,
        tx_ipUdpMetaFifo_V_m_empty_n,
        tx_ipUdpMetaFifo_V_m_read,
        tx_ipUdpMetaFifo_V_l_dout,
        tx_ipUdpMetaFifo_V_l_empty_n,
        tx_ipUdpMetaFifo_V_l_read,
        tx_udp2ipMetaFifo_V_s_din,
        tx_udp2ipMetaFifo_V_s_full_n,
        tx_udp2ipMetaFifo_V_s_write,
        tx_udp2ipMetaFifo_V_1_din,
        tx_udp2ipMetaFifo_V_1_full_n,
        tx_udp2ipMetaFifo_V_1_write,
        tx_udpMetaFifo_V_the_din,
        tx_udpMetaFifo_V_the_full_n,
        tx_udpMetaFifo_V_the_write,
        tx_udpMetaFifo_V_my_s_din,
        tx_udpMetaFifo_V_my_s_full_n,
        tx_udpMetaFifo_V_my_s_write,
        tx_udpMetaFifo_V_len_din,
        tx_udpMetaFifo_V_len_full_n,
        tx_udpMetaFifo_V_len_write,
        tx_udpMetaFifo_V_val_din,
        tx_udpMetaFifo_V_val_full_n,
        tx_udpMetaFifo_V_val_write
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [127:0] tx_ipUdpMetaFifo_V_t_1_dout;
input   tx_ipUdpMetaFifo_V_t_1_empty_n;
output   tx_ipUdpMetaFifo_V_t_1_read;
input  [15:0] tx_ipUdpMetaFifo_V_t_dout;
input   tx_ipUdpMetaFifo_V_t_empty_n;
output   tx_ipUdpMetaFifo_V_t_read;
input  [15:0] tx_ipUdpMetaFifo_V_m_dout;
input   tx_ipUdpMetaFifo_V_m_empty_n;
output   tx_ipUdpMetaFifo_V_m_read;
input  [15:0] tx_ipUdpMetaFifo_V_l_dout;
input   tx_ipUdpMetaFifo_V_l_empty_n;
output   tx_ipUdpMetaFifo_V_l_read;
output  [31:0] tx_udp2ipMetaFifo_V_s_din;
input   tx_udp2ipMetaFifo_V_s_full_n;
output   tx_udp2ipMetaFifo_V_s_write;
output  [15:0] tx_udp2ipMetaFifo_V_1_din;
input   tx_udp2ipMetaFifo_V_1_full_n;
output   tx_udp2ipMetaFifo_V_1_write;
output  [15:0] tx_udpMetaFifo_V_the_din;
input   tx_udpMetaFifo_V_the_full_n;
output   tx_udpMetaFifo_V_the_write;
output  [15:0] tx_udpMetaFifo_V_my_s_din;
input   tx_udpMetaFifo_V_my_s_full_n;
output   tx_udpMetaFifo_V_my_s_write;
output  [15:0] tx_udpMetaFifo_V_len_din;
input   tx_udpMetaFifo_V_len_full_n;
output   tx_udpMetaFifo_V_len_write;
output  [0:0] tx_udpMetaFifo_V_val_din;
input   tx_udpMetaFifo_V_val_full_n;
output   tx_udpMetaFifo_V_val_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg tx_ipUdpMetaFifo_V_t_1_read;
reg tx_ipUdpMetaFifo_V_t_read;
reg tx_ipUdpMetaFifo_V_m_read;
reg tx_ipUdpMetaFifo_V_l_read;
reg tx_udp2ipMetaFifo_V_s_write;
reg tx_udp2ipMetaFifo_V_1_write;
reg tx_udpMetaFifo_V_the_write;
reg tx_udpMetaFifo_V_my_s_write;
reg tx_udpMetaFifo_V_len_write;
reg tx_udpMetaFifo_V_val_write;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire    io_acc_block_signal_op5;
wire   [0:0] tmp_nbreadreq_fu_56_p6;
reg    ap_block_state1_pp0_stage0_iter0;
wire    io_acc_block_signal_op23;
reg   [0:0] tmp_reg_141;
wire    io_acc_block_signal_op24;
reg    ap_block_state2_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_11001;
reg    tx_ipUdpMetaFifo_V_t_1_blk_n;
wire    ap_block_pp0_stage0;
reg    tx_ipUdpMetaFifo_V_t_blk_n;
reg    tx_ipUdpMetaFifo_V_m_blk_n;
reg    tx_ipUdpMetaFifo_V_l_blk_n;
reg    tx_udp2ipMetaFifo_V_s_blk_n;
reg    tx_udp2ipMetaFifo_V_1_blk_n;
reg    tx_udpMetaFifo_V_the_blk_n;
reg    tx_udpMetaFifo_V_my_s_blk_n;
reg    tx_udpMetaFifo_V_len_blk_n;
reg    tx_udpMetaFifo_V_val_blk_n;
reg   [15:0] tmp_their_port_V_reg_145;
reg   [15:0] tmp_my_port_V_reg_150;
wire   [15:0] tempLen_V_fu_125_p2;
reg   [15:0] tempLen_V_reg_155;
reg   [31:0] tmp_their_address_V_reg_161;
reg    ap_block_pp0_stage0_subdone;
reg    ap_block_pp0_stage0_01001;
reg   [0:0] ap_NS_fsm;
reg    ap_idle_pp0_0to0;
reg    ap_reset_idle_pp0;
wire    ap_enable_pp0;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            ap_enable_reg_pp0_iter1 <= ap_start;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_nbreadreq_fu_56_p6 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tempLen_V_reg_155 <= tempLen_V_fu_125_p2;
        tmp_my_port_V_reg_150 <= tx_ipUdpMetaFifo_V_m_dout;
        tmp_their_address_V_reg_161 <= {{tx_ipUdpMetaFifo_V_t_1_dout[127:96]}};
        tmp_their_port_V_reg_145 <= tx_ipUdpMetaFifo_V_t_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_reg_141 <= tmp_nbreadreq_fu_56_p6;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter0 == 1'b0)) begin
        ap_idle_pp0_0to0 = 1'b1;
    end else begin
        ap_idle_pp0_0to0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (ap_idle_pp0_0to0 == 1'b1))) begin
        ap_reset_idle_pp0 = 1'b1;
    end else begin
        ap_reset_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (tmp_nbreadreq_fu_56_p6 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        tx_ipUdpMetaFifo_V_l_blk_n = tx_ipUdpMetaFifo_V_l_empty_n;
    end else begin
        tx_ipUdpMetaFifo_V_l_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((tmp_nbreadreq_fu_56_p6 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tx_ipUdpMetaFifo_V_l_read = 1'b1;
    end else begin
        tx_ipUdpMetaFifo_V_l_read = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (tmp_nbreadreq_fu_56_p6 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        tx_ipUdpMetaFifo_V_m_blk_n = tx_ipUdpMetaFifo_V_m_empty_n;
    end else begin
        tx_ipUdpMetaFifo_V_m_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((tmp_nbreadreq_fu_56_p6 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tx_ipUdpMetaFifo_V_m_read = 1'b1;
    end else begin
        tx_ipUdpMetaFifo_V_m_read = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (tmp_nbreadreq_fu_56_p6 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        tx_ipUdpMetaFifo_V_t_1_blk_n = tx_ipUdpMetaFifo_V_t_1_empty_n;
    end else begin
        tx_ipUdpMetaFifo_V_t_1_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((tmp_nbreadreq_fu_56_p6 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tx_ipUdpMetaFifo_V_t_1_read = 1'b1;
    end else begin
        tx_ipUdpMetaFifo_V_t_1_read = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (tmp_nbreadreq_fu_56_p6 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        tx_ipUdpMetaFifo_V_t_blk_n = tx_ipUdpMetaFifo_V_t_empty_n;
    end else begin
        tx_ipUdpMetaFifo_V_t_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((tmp_nbreadreq_fu_56_p6 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tx_ipUdpMetaFifo_V_t_read = 1'b1;
    end else begin
        tx_ipUdpMetaFifo_V_t_read = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_reg_141 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        tx_udp2ipMetaFifo_V_1_blk_n = tx_udp2ipMetaFifo_V_1_full_n;
    end else begin
        tx_udp2ipMetaFifo_V_1_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((tmp_reg_141 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tx_udp2ipMetaFifo_V_1_write = 1'b1;
    end else begin
        tx_udp2ipMetaFifo_V_1_write = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_reg_141 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        tx_udp2ipMetaFifo_V_s_blk_n = tx_udp2ipMetaFifo_V_s_full_n;
    end else begin
        tx_udp2ipMetaFifo_V_s_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((tmp_reg_141 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tx_udp2ipMetaFifo_V_s_write = 1'b1;
    end else begin
        tx_udp2ipMetaFifo_V_s_write = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_reg_141 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        tx_udpMetaFifo_V_len_blk_n = tx_udpMetaFifo_V_len_full_n;
    end else begin
        tx_udpMetaFifo_V_len_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((tmp_reg_141 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tx_udpMetaFifo_V_len_write = 1'b1;
    end else begin
        tx_udpMetaFifo_V_len_write = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_reg_141 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        tx_udpMetaFifo_V_my_s_blk_n = tx_udpMetaFifo_V_my_s_full_n;
    end else begin
        tx_udpMetaFifo_V_my_s_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((tmp_reg_141 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tx_udpMetaFifo_V_my_s_write = 1'b1;
    end else begin
        tx_udpMetaFifo_V_my_s_write = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_reg_141 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        tx_udpMetaFifo_V_the_blk_n = tx_udpMetaFifo_V_the_full_n;
    end else begin
        tx_udpMetaFifo_V_the_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((tmp_reg_141 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tx_udpMetaFifo_V_the_write = 1'b1;
    end else begin
        tx_udpMetaFifo_V_the_write = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_reg_141 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        tx_udpMetaFifo_V_val_blk_n = tx_udpMetaFifo_V_val_full_n;
    end else begin
        tx_udpMetaFifo_V_val_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((tmp_reg_141 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tx_udpMetaFifo_V_val_write = 1'b1;
    end else begin
        tx_udpMetaFifo_V_val_write = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((ap_done_reg == 1'b1) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((tmp_reg_141 == 1'd1) & (io_acc_block_signal_op24 == 1'b0)) | ((tmp_reg_141 == 1'd1) & (io_acc_block_signal_op23 == 1'b0)))) | ((ap_start == 1'b1) & ((ap_start == 1'b0) | (ap_done_reg == 1'b1) | ((tmp_nbreadreq_fu_56_p6 == 1'd1) & (io_acc_block_signal_op5 == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_done_reg == 1'b1) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((tmp_reg_141 == 1'd1) & (io_acc_block_signal_op24 == 1'b0)) | ((tmp_reg_141 == 1'd1) & (io_acc_block_signal_op23 == 1'b0)))) | ((ap_start == 1'b1) & ((ap_start == 1'b0) | (ap_done_reg == 1'b1) | ((tmp_nbreadreq_fu_56_p6 == 1'd1) & (io_acc_block_signal_op5 == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_done_reg == 1'b1) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((tmp_reg_141 == 1'd1) & (io_acc_block_signal_op24 == 1'b0)) | ((tmp_reg_141 == 1'd1) & (io_acc_block_signal_op23 == 1'b0)))) | ((ap_start == 1'b1) & ((ap_start == 1'b0) | (ap_done_reg == 1'b1) | ((tmp_nbreadreq_fu_56_p6 == 1'd1) & (io_acc_block_signal_op5 == 1'b0)))));
end

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((ap_start == 1'b0) | (ap_done_reg == 1'b1) | ((tmp_nbreadreq_fu_56_p6 == 1'd1) & (io_acc_block_signal_op5 == 1'b0)));
end

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = (((tmp_reg_141 == 1'd1) & (io_acc_block_signal_op24 == 1'b0)) | ((tmp_reg_141 == 1'd1) & (io_acc_block_signal_op23 == 1'b0)));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start;

assign io_acc_block_signal_op23 = (tx_udp2ipMetaFifo_V_s_full_n & tx_udp2ipMetaFifo_V_1_full_n);

assign io_acc_block_signal_op24 = (tx_udpMetaFifo_V_val_full_n & tx_udpMetaFifo_V_the_full_n & tx_udpMetaFifo_V_my_s_full_n & tx_udpMetaFifo_V_len_full_n);

assign io_acc_block_signal_op5 = (tx_ipUdpMetaFifo_V_t_empty_n & tx_ipUdpMetaFifo_V_t_1_empty_n & tx_ipUdpMetaFifo_V_m_empty_n & tx_ipUdpMetaFifo_V_l_empty_n);

assign tempLen_V_fu_125_p2 = (tx_ipUdpMetaFifo_V_l_dout + 16'd8);

assign tmp_nbreadreq_fu_56_p6 = (tx_ipUdpMetaFifo_V_t_empty_n & tx_ipUdpMetaFifo_V_t_1_empty_n & tx_ipUdpMetaFifo_V_m_empty_n & tx_ipUdpMetaFifo_V_l_empty_n);

assign tx_udp2ipMetaFifo_V_1_din = tempLen_V_reg_155;

assign tx_udp2ipMetaFifo_V_s_din = tmp_their_address_V_reg_161;

assign tx_udpMetaFifo_V_len_din = tempLen_V_reg_155;

assign tx_udpMetaFifo_V_my_s_din = tmp_my_port_V_reg_150;

assign tx_udpMetaFifo_V_the_din = tmp_their_port_V_reg_145;

assign tx_udpMetaFifo_V_val_din = 1'd1;

endmodule //split_tx_meta