// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2019.1
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module merge_rx_meta (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        rx_ip2udpMetaFifo_V_s_dout,
        rx_ip2udpMetaFifo_V_s_empty_n,
        rx_ip2udpMetaFifo_V_s_read,
        rx_ip2udpMetaFifo_V_1_dout,
        rx_ip2udpMetaFifo_V_1_empty_n,
        rx_ip2udpMetaFifo_V_1_read,
        rx_udpMetaFifo_V_dout,
        rx_udpMetaFifo_V_empty_n,
        rx_udpMetaFifo_V_read,
        rx_ipUdpMetaFifo_V_t_1_din,
        rx_ipUdpMetaFifo_V_t_1_full_n,
        rx_ipUdpMetaFifo_V_t_1_write,
        rx_ipUdpMetaFifo_V_t_din,
        rx_ipUdpMetaFifo_V_t_full_n,
        rx_ipUdpMetaFifo_V_t_write,
        rx_ipUdpMetaFifo_V_m_din,
        rx_ipUdpMetaFifo_V_m_full_n,
        rx_ipUdpMetaFifo_V_m_write,
        rx_ipUdpMetaFifo_V_l_din,
        rx_ipUdpMetaFifo_V_l_full_n,
        rx_ipUdpMetaFifo_V_l_write
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [31:0] rx_ip2udpMetaFifo_V_s_dout;
input   rx_ip2udpMetaFifo_V_s_empty_n;
output   rx_ip2udpMetaFifo_V_s_read;
input  [15:0] rx_ip2udpMetaFifo_V_1_dout;
input   rx_ip2udpMetaFifo_V_1_empty_n;
output   rx_ip2udpMetaFifo_V_1_read;
input  [48:0] rx_udpMetaFifo_V_dout;
input   rx_udpMetaFifo_V_empty_n;
output   rx_udpMetaFifo_V_read;
output  [127:0] rx_ipUdpMetaFifo_V_t_1_din;
input   rx_ipUdpMetaFifo_V_t_1_full_n;
output   rx_ipUdpMetaFifo_V_t_1_write;
output  [15:0] rx_ipUdpMetaFifo_V_t_din;
input   rx_ipUdpMetaFifo_V_t_full_n;
output   rx_ipUdpMetaFifo_V_t_write;
output  [15:0] rx_ipUdpMetaFifo_V_m_din;
input   rx_ipUdpMetaFifo_V_m_full_n;
output   rx_ipUdpMetaFifo_V_m_write;
output  [15:0] rx_ipUdpMetaFifo_V_l_din;
input   rx_ipUdpMetaFifo_V_l_full_n;
output   rx_ipUdpMetaFifo_V_l_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg rx_ip2udpMetaFifo_V_s_read;
reg rx_ip2udpMetaFifo_V_1_read;
reg rx_udpMetaFifo_V_read;
reg rx_ipUdpMetaFifo_V_t_1_write;
reg rx_ipUdpMetaFifo_V_t_write;
reg rx_ipUdpMetaFifo_V_m_write;
reg rx_ipUdpMetaFifo_V_l_write;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire    io_acc_block_signal_op7;
wire   [0:0] tmp_nbreadreq_fu_54_p4;
wire   [0:0] tmp_64_nbreadreq_fu_64_p3;
reg    ap_predicate_op7_read_state1;
reg    ap_predicate_op9_read_state1;
reg    ap_block_state1_pp0_stage0_iter0;
wire    io_acc_block_signal_op24;
reg   [0:0] tmp_reg_142;
reg   [0:0] tmp_64_reg_146;
reg   [0:0] tmp_65_reg_170;
reg    ap_predicate_op24_write_state2;
reg    ap_block_state2_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_11001;
reg    rx_ip2udpMetaFifo_V_s_blk_n;
wire    ap_block_pp0_stage0;
reg    rx_ip2udpMetaFifo_V_1_blk_n;
reg    rx_udpMetaFifo_V_blk_n;
reg    rx_ipUdpMetaFifo_V_t_1_blk_n;
reg    rx_ipUdpMetaFifo_V_t_blk_n;
reg    rx_ipUdpMetaFifo_V_m_blk_n;
reg    rx_ipUdpMetaFifo_V_l_blk_n;
reg   [31:0] tmp_their_address_V_reg_150;
wire   [15:0] tmp_their_port_V_fu_106_p1;
reg   [15:0] tmp_their_port_V_reg_155;
reg   [15:0] tmp_my_port_V_reg_160;
reg   [15:0] tmp_length_V_reg_165;
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
    if (((tmp_nbreadreq_fu_54_p4 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_64_reg_146 <= tmp_64_nbreadreq_fu_64_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_64_nbreadreq_fu_64_p3 == 1'd1) & (tmp_nbreadreq_fu_54_p4 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_65_reg_170 <= rx_udpMetaFifo_V_dout[32'd48];
        tmp_length_V_reg_165 <= {{rx_udpMetaFifo_V_dout[47:32]}};
        tmp_my_port_V_reg_160 <= {{rx_udpMetaFifo_V_dout[31:16]}};
        tmp_their_address_V_reg_150 <= rx_ip2udpMetaFifo_V_s_dout;
        tmp_their_port_V_reg_155 <= tmp_their_port_V_fu_106_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_reg_142 <= tmp_nbreadreq_fu_54_p4;
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
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op7_read_state1 == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        rx_ip2udpMetaFifo_V_1_blk_n = rx_ip2udpMetaFifo_V_1_empty_n;
    end else begin
        rx_ip2udpMetaFifo_V_1_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op7_read_state1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        rx_ip2udpMetaFifo_V_1_read = 1'b1;
    end else begin
        rx_ip2udpMetaFifo_V_1_read = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op7_read_state1 == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        rx_ip2udpMetaFifo_V_s_blk_n = rx_ip2udpMetaFifo_V_s_empty_n;
    end else begin
        rx_ip2udpMetaFifo_V_s_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op7_read_state1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        rx_ip2udpMetaFifo_V_s_read = 1'b1;
    end else begin
        rx_ip2udpMetaFifo_V_s_read = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op24_write_state2 == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        rx_ipUdpMetaFifo_V_l_blk_n = rx_ipUdpMetaFifo_V_l_full_n;
    end else begin
        rx_ipUdpMetaFifo_V_l_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op24_write_state2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        rx_ipUdpMetaFifo_V_l_write = 1'b1;
    end else begin
        rx_ipUdpMetaFifo_V_l_write = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op24_write_state2 == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        rx_ipUdpMetaFifo_V_m_blk_n = rx_ipUdpMetaFifo_V_m_full_n;
    end else begin
        rx_ipUdpMetaFifo_V_m_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op24_write_state2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        rx_ipUdpMetaFifo_V_m_write = 1'b1;
    end else begin
        rx_ipUdpMetaFifo_V_m_write = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op24_write_state2 == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        rx_ipUdpMetaFifo_V_t_1_blk_n = rx_ipUdpMetaFifo_V_t_1_full_n;
    end else begin
        rx_ipUdpMetaFifo_V_t_1_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op24_write_state2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        rx_ipUdpMetaFifo_V_t_1_write = 1'b1;
    end else begin
        rx_ipUdpMetaFifo_V_t_1_write = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op24_write_state2 == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        rx_ipUdpMetaFifo_V_t_blk_n = rx_ipUdpMetaFifo_V_t_full_n;
    end else begin
        rx_ipUdpMetaFifo_V_t_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op24_write_state2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        rx_ipUdpMetaFifo_V_t_write = 1'b1;
    end else begin
        rx_ipUdpMetaFifo_V_t_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op9_read_state1 == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        rx_udpMetaFifo_V_blk_n = rx_udpMetaFifo_V_empty_n;
    end else begin
        rx_udpMetaFifo_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op9_read_state1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        rx_udpMetaFifo_V_read = 1'b1;
    end else begin
        rx_udpMetaFifo_V_read = 1'b0;
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
    ap_block_pp0_stage0_01001 = ((ap_done_reg == 1'b1) | ((io_acc_block_signal_op24 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (ap_predicate_op24_write_state2 == 1'b1)) | ((ap_start == 1'b1) & ((ap_start == 1'b0) | (ap_done_reg == 1'b1) | ((rx_udpMetaFifo_V_empty_n == 1'b0) & (ap_predicate_op9_read_state1 == 1'b1)) | ((io_acc_block_signal_op7 == 1'b0) & (ap_predicate_op7_read_state1 == 1'b1)))));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_done_reg == 1'b1) | ((io_acc_block_signal_op24 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (ap_predicate_op24_write_state2 == 1'b1)) | ((ap_start == 1'b1) & ((ap_start == 1'b0) | (ap_done_reg == 1'b1) | ((rx_udpMetaFifo_V_empty_n == 1'b0) & (ap_predicate_op9_read_state1 == 1'b1)) | ((io_acc_block_signal_op7 == 1'b0) & (ap_predicate_op7_read_state1 == 1'b1)))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_done_reg == 1'b1) | ((io_acc_block_signal_op24 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (ap_predicate_op24_write_state2 == 1'b1)) | ((ap_start == 1'b1) & ((ap_start == 1'b0) | (ap_done_reg == 1'b1) | ((rx_udpMetaFifo_V_empty_n == 1'b0) & (ap_predicate_op9_read_state1 == 1'b1)) | ((io_acc_block_signal_op7 == 1'b0) & (ap_predicate_op7_read_state1 == 1'b1)))));
end

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((ap_start == 1'b0) | (ap_done_reg == 1'b1) | ((rx_udpMetaFifo_V_empty_n == 1'b0) & (ap_predicate_op9_read_state1 == 1'b1)) | ((io_acc_block_signal_op7 == 1'b0) & (ap_predicate_op7_read_state1 == 1'b1)));
end

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = ((io_acc_block_signal_op24 == 1'b0) & (ap_predicate_op24_write_state2 == 1'b1));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start;

always @ (*) begin
    ap_predicate_op24_write_state2 = ((tmp_65_reg_170 == 1'd1) & (tmp_64_reg_146 == 1'd1) & (tmp_reg_142 == 1'd1));
end

always @ (*) begin
    ap_predicate_op7_read_state1 = ((tmp_64_nbreadreq_fu_64_p3 == 1'd1) & (tmp_nbreadreq_fu_54_p4 == 1'd1));
end

always @ (*) begin
    ap_predicate_op9_read_state1 = ((tmp_64_nbreadreq_fu_64_p3 == 1'd1) & (tmp_nbreadreq_fu_54_p4 == 1'd1));
end

assign io_acc_block_signal_op24 = (rx_ipUdpMetaFifo_V_t_full_n & rx_ipUdpMetaFifo_V_t_1_full_n & rx_ipUdpMetaFifo_V_m_full_n & rx_ipUdpMetaFifo_V_l_full_n);

assign io_acc_block_signal_op7 = (rx_ip2udpMetaFifo_V_s_empty_n & rx_ip2udpMetaFifo_V_1_empty_n);

assign rx_ipUdpMetaFifo_V_l_din = tmp_length_V_reg_165;

assign rx_ipUdpMetaFifo_V_m_din = tmp_my_port_V_reg_160;

assign rx_ipUdpMetaFifo_V_t_1_din = tmp_their_address_V_reg_150;

assign rx_ipUdpMetaFifo_V_t_din = tmp_their_port_V_reg_155;

assign tmp_64_nbreadreq_fu_64_p3 = rx_udpMetaFifo_V_empty_n;

assign tmp_nbreadreq_fu_54_p4 = (rx_ip2udpMetaFifo_V_s_empty_n & rx_ip2udpMetaFifo_V_1_empty_n);

assign tmp_their_port_V_fu_106_p1 = rx_udpMetaFifo_V_dout[15:0];

endmodule //merge_rx_meta