// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2019.1
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module rshiftWordByOctet (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        rx_exh2rethShiftFifo_8_dout,
        rx_exh2rethShiftFifo_8_empty_n,
        rx_exh2rethShiftFifo_8_read,
        rx_exh2rethShiftFifo_6_dout,
        rx_exh2rethShiftFifo_6_empty_n,
        rx_exh2rethShiftFifo_6_read,
        rx_exh2rethShiftFifo_7_dout,
        rx_exh2rethShiftFifo_7_empty_n,
        rx_exh2rethShiftFifo_7_read,
        rx_exh2rethShiftFifo_4_dout,
        rx_exh2rethShiftFifo_4_empty_n,
        rx_exh2rethShiftFifo_4_read,
        rx_rethSift2mergerFi_8_din,
        rx_rethSift2mergerFi_8_full_n,
        rx_rethSift2mergerFi_8_write,
        rx_rethSift2mergerFi_6_din,
        rx_rethSift2mergerFi_6_full_n,
        rx_rethSift2mergerFi_6_write,
        rx_rethSift2mergerFi_7_din,
        rx_rethSift2mergerFi_7_full_n,
        rx_rethSift2mergerFi_7_write,
        rx_rethSift2mergerFi_4_din,
        rx_rethSift2mergerFi_4_full_n,
        rx_rethSift2mergerFi_4_write
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [511:0] rx_exh2rethShiftFifo_8_dout;
input   rx_exh2rethShiftFifo_8_empty_n;
output   rx_exh2rethShiftFifo_8_read;
input  [63:0] rx_exh2rethShiftFifo_6_dout;
input   rx_exh2rethShiftFifo_6_empty_n;
output   rx_exh2rethShiftFifo_6_read;
input  [0:0] rx_exh2rethShiftFifo_7_dout;
input   rx_exh2rethShiftFifo_7_empty_n;
output   rx_exh2rethShiftFifo_7_read;
input  [0:0] rx_exh2rethShiftFifo_4_dout;
input   rx_exh2rethShiftFifo_4_empty_n;
output   rx_exh2rethShiftFifo_4_read;
output  [511:0] rx_rethSift2mergerFi_8_din;
input   rx_rethSift2mergerFi_8_full_n;
output   rx_rethSift2mergerFi_8_write;
output  [63:0] rx_rethSift2mergerFi_6_din;
input   rx_rethSift2mergerFi_6_full_n;
output   rx_rethSift2mergerFi_6_write;
output  [0:0] rx_rethSift2mergerFi_7_din;
input   rx_rethSift2mergerFi_7_full_n;
output   rx_rethSift2mergerFi_7_write;
output  [0:0] rx_rethSift2mergerFi_4_din;
input   rx_rethSift2mergerFi_4_full_n;
output   rx_rethSift2mergerFi_4_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg rx_exh2rethShiftFifo_8_read;
reg rx_exh2rethShiftFifo_6_read;
reg rx_exh2rethShiftFifo_7_read;
reg rx_exh2rethShiftFifo_4_read;
reg[511:0] rx_rethSift2mergerFi_8_din;
reg rx_rethSift2mergerFi_8_write;
reg[63:0] rx_rethSift2mergerFi_6_din;
reg rx_rethSift2mergerFi_6_write;
reg[0:0] rx_rethSift2mergerFi_7_din;
reg rx_rethSift2mergerFi_7_write;
reg[0:0] rx_rethSift2mergerFi_4_din;
reg rx_rethSift2mergerFi_4_write;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire    io_acc_block_signal_op7;
wire   [0:0] fsmState_1_load_load_fu_158_p1;
wire   [0:0] tmp_nbreadreq_fu_74_p6;
reg    ap_predicate_op7_read_state1;
reg    ap_block_state1_pp0_stage0_iter0;
wire    io_acc_block_signal_op42;
reg   [0:0] fsmState_1_load_reg_279;
reg   [0:0] tmp_reg_283;
reg   [0:0] rs_firstWord_1_load_reg_308;
reg    ap_predicate_op42_write_state2;
wire    io_acc_block_signal_op52;
reg    ap_block_state2_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_11001;
reg   [0:0] fsmState_1;
reg   [511:0] prevWord_data_V_19;
reg   [63:0] prevWord_keep_V_16;
reg   [0:0] rs_firstWord_1;
reg    rx_exh2rethShiftFifo_8_blk_n;
wire    ap_block_pp0_stage0;
reg    rx_exh2rethShiftFifo_6_blk_n;
reg    rx_exh2rethShiftFifo_7_blk_n;
reg    rx_exh2rethShiftFifo_4_blk_n;
reg    rx_rethSift2mergerFi_8_blk_n;
reg    rx_rethSift2mergerFi_6_blk_n;
reg    rx_rethSift2mergerFi_7_blk_n;
reg    rx_rethSift2mergerFi_4_blk_n;
reg   [511:0] tmp_data_V_25_reg_287;
reg   [63:0] tmp_keep_V_25_reg_293;
wire   [0:0] tmp_last_V_21_fu_170_p1;
reg   [0:0] tmp_dest_V_reg_303;
wire   [0:0] rs_firstWord_1_load_load_fu_178_p1;
wire   [0:0] tmp_last_V_fu_192_p2;
reg   [0:0] tmp_last_V_reg_312;
reg    ap_block_pp0_stage0_subdone;
reg   [0:0] ap_phi_mux_sendWord_last_V_0_i_phi_fu_121_p4;
wire   [0:0] ap_phi_reg_pp0_iter0_sendWord_last_V_0_i_reg_118;
reg   [0:0] ap_phi_mux_rs_firstWord_5_new_0_phi_fu_132_p4;
wire   [0:0] ap_phi_reg_pp0_iter0_rs_firstWord_5_new_0_reg_129;
wire   [511:0] p_Result_s_fu_230_p3;
reg    ap_block_pp0_stage0_01001;
wire   [511:0] p_Result_18_fu_261_p3;
wire   [63:0] p_Result_17_fu_242_p3;
wire   [63:0] p_Result_19_fu_270_p3;
wire   [47:0] p_Result_31_i_fu_182_p4;
wire   [127:0] trunc_ln647_fu_227_p1;
wire   [383:0] grp_fu_140_p4;
wire   [15:0] trunc_ln647_7_fu_239_p1;
wire   [47:0] grp_fu_149_p4;
reg   [0:0] ap_NS_fsm;
reg    ap_idle_pp0_0to0;
reg    ap_reset_idle_pp0;
wire    ap_enable_pp0;
reg    ap_condition_195;
reg    ap_condition_182;
reg    ap_condition_111;
reg    ap_condition_206;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 fsmState_1 = 1'd0;
#0 prevWord_data_V_19 = 512'd0;
#0 prevWord_keep_V_16 = 64'd0;
#0 rs_firstWord_1 = 1'd1;
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
    if ((1'b1 == ap_condition_111)) begin
        if ((fsmState_1_load_load_fu_158_p1 == 1'd1)) begin
            fsmState_1 <= 1'd0;
        end else if ((1'b1 == ap_condition_182)) begin
            fsmState_1 <= 1'd1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        fsmState_1_load_reg_279 <= fsmState_1;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_reg_283 == 1'd1) & (fsmState_1_load_reg_279 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        prevWord_data_V_19 <= tmp_data_V_25_reg_287;
        prevWord_keep_V_16 <= tmp_keep_V_25_reg_293;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_nbreadreq_fu_74_p6 == 1'd1) & (fsmState_1 == 1'd0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        rs_firstWord_1 <= ap_phi_mux_rs_firstWord_5_new_0_phi_fu_132_p4;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_nbreadreq_fu_74_p6 == 1'd1) & (fsmState_1 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        rs_firstWord_1_load_reg_308 <= rs_firstWord_1;
        tmp_data_V_25_reg_287 <= rx_exh2rethShiftFifo_8_dout;
        tmp_dest_V_reg_303 <= rx_exh2rethShiftFifo_4_dout;
        tmp_keep_V_25_reg_293 <= rx_exh2rethShiftFifo_6_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_nbreadreq_fu_74_p6 == 1'd1) & (rs_firstWord_1_load_load_fu_178_p1 == 1'd0) & (fsmState_1 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_last_V_reg_312 <= tmp_last_V_fu_192_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((fsmState_1 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_reg_283 <= tmp_nbreadreq_fu_74_p6;
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
    if ((1'b1 == ap_condition_195)) begin
        if ((tmp_last_V_21_fu_170_p1 == 1'd0)) begin
            ap_phi_mux_rs_firstWord_5_new_0_phi_fu_132_p4 = 1'd0;
        end else if ((tmp_last_V_21_fu_170_p1 == 1'd1)) begin
            ap_phi_mux_rs_firstWord_5_new_0_phi_fu_132_p4 = 1'd1;
        end else begin
            ap_phi_mux_rs_firstWord_5_new_0_phi_fu_132_p4 = ap_phi_reg_pp0_iter0_rs_firstWord_5_new_0_reg_129;
        end
    end else begin
        ap_phi_mux_rs_firstWord_5_new_0_phi_fu_132_p4 = ap_phi_reg_pp0_iter0_rs_firstWord_5_new_0_reg_129;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_195)) begin
        if ((rs_firstWord_1_load_load_fu_178_p1 == 1'd0)) begin
            ap_phi_mux_sendWord_last_V_0_i_phi_fu_121_p4 = tmp_last_V_fu_192_p2;
        end else if ((rs_firstWord_1_load_load_fu_178_p1 == 1'd1)) begin
            ap_phi_mux_sendWord_last_V_0_i_phi_fu_121_p4 = 1'd0;
        end else begin
            ap_phi_mux_sendWord_last_V_0_i_phi_fu_121_p4 = ap_phi_reg_pp0_iter0_sendWord_last_V_0_i_reg_118;
        end
    end else begin
        ap_phi_mux_sendWord_last_V_0_i_phi_fu_121_p4 = ap_phi_reg_pp0_iter0_sendWord_last_V_0_i_reg_118;
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
        rx_exh2rethShiftFifo_4_blk_n = rx_exh2rethShiftFifo_4_empty_n;
    end else begin
        rx_exh2rethShiftFifo_4_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op7_read_state1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        rx_exh2rethShiftFifo_4_read = 1'b1;
    end else begin
        rx_exh2rethShiftFifo_4_read = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op7_read_state1 == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        rx_exh2rethShiftFifo_6_blk_n = rx_exh2rethShiftFifo_6_empty_n;
    end else begin
        rx_exh2rethShiftFifo_6_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op7_read_state1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        rx_exh2rethShiftFifo_6_read = 1'b1;
    end else begin
        rx_exh2rethShiftFifo_6_read = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op7_read_state1 == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        rx_exh2rethShiftFifo_7_blk_n = rx_exh2rethShiftFifo_7_empty_n;
    end else begin
        rx_exh2rethShiftFifo_7_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op7_read_state1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        rx_exh2rethShiftFifo_7_read = 1'b1;
    end else begin
        rx_exh2rethShiftFifo_7_read = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op7_read_state1 == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        rx_exh2rethShiftFifo_8_blk_n = rx_exh2rethShiftFifo_8_empty_n;
    end else begin
        rx_exh2rethShiftFifo_8_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op7_read_state1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        rx_exh2rethShiftFifo_8_read = 1'b1;
    end else begin
        rx_exh2rethShiftFifo_8_read = 1'b0;
    end
end

always @ (*) begin
    if ((((fsmState_1_load_reg_279 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op42_write_state2 == 1'b1) & (1'b0 == ap_block_pp0_stage0)))) begin
        rx_rethSift2mergerFi_4_blk_n = rx_rethSift2mergerFi_4_full_n;
    end else begin
        rx_rethSift2mergerFi_4_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_206)) begin
        if ((fsmState_1_load_reg_279 == 1'd1)) begin
            rx_rethSift2mergerFi_4_din = 1'd0;
        end else if ((ap_predicate_op42_write_state2 == 1'b1)) begin
            rx_rethSift2mergerFi_4_din = tmp_dest_V_reg_303;
        end else begin
            rx_rethSift2mergerFi_4_din = 'bx;
        end
    end else begin
        rx_rethSift2mergerFi_4_din = 'bx;
    end
end

always @ (*) begin
    if ((((fsmState_1_load_reg_279 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op42_write_state2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        rx_rethSift2mergerFi_4_write = 1'b1;
    end else begin
        rx_rethSift2mergerFi_4_write = 1'b0;
    end
end

always @ (*) begin
    if ((((fsmState_1_load_reg_279 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op42_write_state2 == 1'b1) & (1'b0 == ap_block_pp0_stage0)))) begin
        rx_rethSift2mergerFi_6_blk_n = rx_rethSift2mergerFi_6_full_n;
    end else begin
        rx_rethSift2mergerFi_6_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_206)) begin
        if ((fsmState_1_load_reg_279 == 1'd1)) begin
            rx_rethSift2mergerFi_6_din = p_Result_19_fu_270_p3;
        end else if ((ap_predicate_op42_write_state2 == 1'b1)) begin
            rx_rethSift2mergerFi_6_din = p_Result_17_fu_242_p3;
        end else begin
            rx_rethSift2mergerFi_6_din = 'bx;
        end
    end else begin
        rx_rethSift2mergerFi_6_din = 'bx;
    end
end

always @ (*) begin
    if ((((fsmState_1_load_reg_279 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op42_write_state2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        rx_rethSift2mergerFi_6_write = 1'b1;
    end else begin
        rx_rethSift2mergerFi_6_write = 1'b0;
    end
end

always @ (*) begin
    if ((((fsmState_1_load_reg_279 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op42_write_state2 == 1'b1) & (1'b0 == ap_block_pp0_stage0)))) begin
        rx_rethSift2mergerFi_7_blk_n = rx_rethSift2mergerFi_7_full_n;
    end else begin
        rx_rethSift2mergerFi_7_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_206)) begin
        if ((fsmState_1_load_reg_279 == 1'd1)) begin
            rx_rethSift2mergerFi_7_din = 1'd1;
        end else if ((ap_predicate_op42_write_state2 == 1'b1)) begin
            rx_rethSift2mergerFi_7_din = tmp_last_V_reg_312;
        end else begin
            rx_rethSift2mergerFi_7_din = 'bx;
        end
    end else begin
        rx_rethSift2mergerFi_7_din = 'bx;
    end
end

always @ (*) begin
    if ((((fsmState_1_load_reg_279 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op42_write_state2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        rx_rethSift2mergerFi_7_write = 1'b1;
    end else begin
        rx_rethSift2mergerFi_7_write = 1'b0;
    end
end

always @ (*) begin
    if ((((fsmState_1_load_reg_279 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op42_write_state2 == 1'b1) & (1'b0 == ap_block_pp0_stage0)))) begin
        rx_rethSift2mergerFi_8_blk_n = rx_rethSift2mergerFi_8_full_n;
    end else begin
        rx_rethSift2mergerFi_8_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_206)) begin
        if ((fsmState_1_load_reg_279 == 1'd1)) begin
            rx_rethSift2mergerFi_8_din = p_Result_18_fu_261_p3;
        end else if ((ap_predicate_op42_write_state2 == 1'b1)) begin
            rx_rethSift2mergerFi_8_din = p_Result_s_fu_230_p3;
        end else begin
            rx_rethSift2mergerFi_8_din = 'bx;
        end
    end else begin
        rx_rethSift2mergerFi_8_din = 'bx;
    end
end

always @ (*) begin
    if ((((fsmState_1_load_reg_279 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op42_write_state2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        rx_rethSift2mergerFi_8_write = 1'b1;
    end else begin
        rx_rethSift2mergerFi_8_write = 1'b0;
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
    ap_block_pp0_stage0_01001 = ((ap_done_reg == 1'b1) | ((ap_start == 1'b1) & ((ap_start == 1'b0) | (ap_done_reg == 1'b1) | ((io_acc_block_signal_op7 == 1'b0) & (ap_predicate_op7_read_state1 == 1'b1)))) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((fsmState_1_load_reg_279 == 1'd1) & (io_acc_block_signal_op52 == 1'b0)) | ((io_acc_block_signal_op42 == 1'b0) & (ap_predicate_op42_write_state2 == 1'b1)))));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_done_reg == 1'b1) | ((ap_start == 1'b1) & ((ap_start == 1'b0) | (ap_done_reg == 1'b1) | ((io_acc_block_signal_op7 == 1'b0) & (ap_predicate_op7_read_state1 == 1'b1)))) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((fsmState_1_load_reg_279 == 1'd1) & (io_acc_block_signal_op52 == 1'b0)) | ((io_acc_block_signal_op42 == 1'b0) & (ap_predicate_op42_write_state2 == 1'b1)))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_done_reg == 1'b1) | ((ap_start == 1'b1) & ((ap_start == 1'b0) | (ap_done_reg == 1'b1) | ((io_acc_block_signal_op7 == 1'b0) & (ap_predicate_op7_read_state1 == 1'b1)))) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((fsmState_1_load_reg_279 == 1'd1) & (io_acc_block_signal_op52 == 1'b0)) | ((io_acc_block_signal_op42 == 1'b0) & (ap_predicate_op42_write_state2 == 1'b1)))));
end

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((ap_start == 1'b0) | (ap_done_reg == 1'b1) | ((io_acc_block_signal_op7 == 1'b0) & (ap_predicate_op7_read_state1 == 1'b1)));
end

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = (((fsmState_1_load_reg_279 == 1'd1) & (io_acc_block_signal_op52 == 1'b0)) | ((io_acc_block_signal_op42 == 1'b0) & (ap_predicate_op42_write_state2 == 1'b1)));
end

always @ (*) begin
    ap_condition_111 = ((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001));
end

always @ (*) begin
    ap_condition_182 = ((tmp_last_V_21_fu_170_p1 == 1'd1) & (tmp_nbreadreq_fu_74_p6 == 1'd1) & (ap_phi_mux_sendWord_last_V_0_i_phi_fu_121_p4 == 1'd0) & (fsmState_1 == 1'd0));
end

always @ (*) begin
    ap_condition_195 = ((tmp_nbreadreq_fu_74_p6 == 1'd1) & (fsmState_1 == 1'd0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0));
end

always @ (*) begin
    ap_condition_206 = ((1'b0 == ap_block_pp0_stage0_01001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start;

assign ap_phi_reg_pp0_iter0_rs_firstWord_5_new_0_reg_129 = 'bx;

assign ap_phi_reg_pp0_iter0_sendWord_last_V_0_i_reg_118 = 'bx;

always @ (*) begin
    ap_predicate_op42_write_state2 = ((tmp_reg_283 == 1'd1) & (rs_firstWord_1_load_reg_308 == 1'd0) & (fsmState_1_load_reg_279 == 1'd0));
end

always @ (*) begin
    ap_predicate_op7_read_state1 = ((tmp_nbreadreq_fu_74_p6 == 1'd1) & (fsmState_1 == 1'd0));
end

assign fsmState_1_load_load_fu_158_p1 = fsmState_1;

assign grp_fu_140_p4 = {{prevWord_data_V_19[511:128]}};

assign grp_fu_149_p4 = {{prevWord_keep_V_16[63:16]}};

assign io_acc_block_signal_op42 = (rx_rethSift2mergerFi_8_full_n & rx_rethSift2mergerFi_7_full_n & rx_rethSift2mergerFi_6_full_n & rx_rethSift2mergerFi_4_full_n);

assign io_acc_block_signal_op52 = (rx_rethSift2mergerFi_8_full_n & rx_rethSift2mergerFi_7_full_n & rx_rethSift2mergerFi_6_full_n & rx_rethSift2mergerFi_4_full_n);

assign io_acc_block_signal_op7 = (rx_exh2rethShiftFifo_8_empty_n & rx_exh2rethShiftFifo_7_empty_n & rx_exh2rethShiftFifo_6_empty_n & rx_exh2rethShiftFifo_4_empty_n);

assign p_Result_17_fu_242_p3 = {{trunc_ln647_7_fu_239_p1}, {grp_fu_149_p4}};

assign p_Result_18_fu_261_p3 = {{128'd0}, {grp_fu_140_p4}};

assign p_Result_19_fu_270_p3 = {{16'd0}, {grp_fu_149_p4}};

assign p_Result_31_i_fu_182_p4 = {{rx_exh2rethShiftFifo_6_dout[63:16]}};

assign p_Result_s_fu_230_p3 = {{trunc_ln647_fu_227_p1}, {grp_fu_140_p4}};

assign rs_firstWord_1_load_load_fu_178_p1 = rs_firstWord_1;

assign tmp_last_V_21_fu_170_p1 = rx_exh2rethShiftFifo_7_dout;

assign tmp_last_V_fu_192_p2 = ((p_Result_31_i_fu_182_p4 == 48'd0) ? 1'b1 : 1'b0);

assign tmp_nbreadreq_fu_74_p6 = (rx_exh2rethShiftFifo_8_empty_n & rx_exh2rethShiftFifo_7_empty_n & rx_exh2rethShiftFifo_6_empty_n & rx_exh2rethShiftFifo_4_empty_n);

assign trunc_ln647_7_fu_239_p1 = tmp_keep_V_25_reg_293[15:0];

assign trunc_ln647_fu_227_p1 = tmp_data_V_25_reg_287[127:0];

endmodule //rshiftWordByOctet