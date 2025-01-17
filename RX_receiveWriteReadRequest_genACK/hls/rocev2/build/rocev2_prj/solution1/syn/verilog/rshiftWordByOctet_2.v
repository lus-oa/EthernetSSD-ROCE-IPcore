// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2019.1
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module rshiftWordByOctet_2 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        rx_ibh2shiftFifo_V_d_dout,
        rx_ibh2shiftFifo_V_d_empty_n,
        rx_ibh2shiftFifo_V_d_read,
        rx_ibh2shiftFifo_V_k_dout,
        rx_ibh2shiftFifo_V_k_empty_n,
        rx_ibh2shiftFifo_V_k_read,
        rx_ibh2shiftFifo_V_l_dout,
        rx_ibh2shiftFifo_V_l_empty_n,
        rx_ibh2shiftFifo_V_l_read,
        rx_shift2exhFifo_V_d_din,
        rx_shift2exhFifo_V_d_full_n,
        rx_shift2exhFifo_V_d_write,
        rx_shift2exhFifo_V_k_din,
        rx_shift2exhFifo_V_k_full_n,
        rx_shift2exhFifo_V_k_write,
        rx_shift2exhFifo_V_l_din,
        rx_shift2exhFifo_V_l_full_n,
        rx_shift2exhFifo_V_l_write
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [511:0] rx_ibh2shiftFifo_V_d_dout;
input   rx_ibh2shiftFifo_V_d_empty_n;
output   rx_ibh2shiftFifo_V_d_read;
input  [63:0] rx_ibh2shiftFifo_V_k_dout;
input   rx_ibh2shiftFifo_V_k_empty_n;
output   rx_ibh2shiftFifo_V_k_read;
input  [0:0] rx_ibh2shiftFifo_V_l_dout;
input   rx_ibh2shiftFifo_V_l_empty_n;
output   rx_ibh2shiftFifo_V_l_read;
output  [511:0] rx_shift2exhFifo_V_d_din;
input   rx_shift2exhFifo_V_d_full_n;
output   rx_shift2exhFifo_V_d_write;
output  [63:0] rx_shift2exhFifo_V_k_din;
input   rx_shift2exhFifo_V_k_full_n;
output   rx_shift2exhFifo_V_k_write;
output  [0:0] rx_shift2exhFifo_V_l_din;
input   rx_shift2exhFifo_V_l_full_n;
output   rx_shift2exhFifo_V_l_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg rx_ibh2shiftFifo_V_d_read;
reg rx_ibh2shiftFifo_V_k_read;
reg rx_ibh2shiftFifo_V_l_read;
reg[511:0] rx_shift2exhFifo_V_d_din;
reg rx_shift2exhFifo_V_d_write;
reg[63:0] rx_shift2exhFifo_V_k_din;
reg rx_shift2exhFifo_V_k_write;
reg[0:0] rx_shift2exhFifo_V_l_din;
reg rx_shift2exhFifo_V_l_write;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire    io_acc_block_signal_op7;
wire   [0:0] fsmState_3_load_load_fu_146_p1;
wire   [0:0] tmp_nbreadreq_fu_70_p5;
reg    ap_predicate_op7_read_state1;
reg    ap_block_state1_pp0_stage0_iter0;
wire    io_acc_block_signal_op39;
reg   [0:0] fsmState_3_load_reg_263;
reg   [0:0] tmp_reg_267;
reg   [0:0] rs_firstWord_3_load_reg_287;
reg    ap_predicate_op39_write_state2;
wire    io_acc_block_signal_op49;
reg    ap_block_state2_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_11001;
reg   [0:0] fsmState_3;
reg   [511:0] prevWord_data_V_9;
reg   [63:0] prevWord_keep_V_9;
reg   [0:0] rs_firstWord_3;
reg    rx_ibh2shiftFifo_V_d_blk_n;
wire    ap_block_pp0_stage0;
reg    rx_ibh2shiftFifo_V_k_blk_n;
reg    rx_ibh2shiftFifo_V_l_blk_n;
reg    rx_shift2exhFifo_V_d_blk_n;
reg    rx_shift2exhFifo_V_k_blk_n;
reg    rx_shift2exhFifo_V_l_blk_n;
reg   [511:0] tmp_data_V_19_reg_271;
reg   [63:0] tmp_keep_V_19_reg_277;
wire   [0:0] tmp_last_V_fu_158_p1;
wire   [0:0] rs_firstWord_3_load_load_fu_162_p1;
wire   [0:0] tmp_last_V_19_fu_176_p2;
reg   [0:0] tmp_last_V_19_reg_291;
reg    ap_block_pp0_stage0_subdone;
reg   [0:0] ap_phi_mux_p_0256_2_0_i_phi_fu_109_p4;
wire   [0:0] ap_phi_reg_pp0_iter0_p_0256_2_0_i_reg_106;
reg   [0:0] ap_phi_mux_rs_firstWord_3_new_0_phi_fu_120_p4;
wire   [0:0] ap_phi_reg_pp0_iter0_rs_firstWord_3_new_0_reg_117;
wire   [511:0] p_Result_s_fu_214_p3;
reg    ap_block_pp0_stage0_01001;
wire   [511:0] p_Result_12_fu_245_p3;
wire   [63:0] p_Result_11_fu_226_p3;
wire   [63:0] p_Result_13_fu_254_p3;
wire   [51:0] p_Result_49_i_fu_166_p4;
wire   [95:0] trunc_ln647_fu_211_p1;
wire   [415:0] grp_fu_128_p4;
wire   [11:0] trunc_ln647_5_fu_223_p1;
wire   [51:0] grp_fu_137_p4;
reg   [0:0] ap_NS_fsm;
reg    ap_idle_pp0_0to0;
reg    ap_reset_idle_pp0;
wire    ap_enable_pp0;
reg    ap_condition_183;
reg    ap_condition_170;
reg    ap_condition_103;
reg    ap_condition_193;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 fsmState_3 = 1'd0;
#0 prevWord_data_V_9 = 512'd0;
#0 prevWord_keep_V_9 = 64'd0;
#0 rs_firstWord_3 = 1'd1;
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
        end else if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
    if ((1'b1 == ap_condition_103)) begin
        if ((fsmState_3_load_load_fu_146_p1 == 1'd1)) begin
            fsmState_3 <= 1'd0;
        end else if ((1'b1 == ap_condition_170)) begin
            fsmState_3 <= 1'd1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        fsmState_3_load_reg_263 <= fsmState_3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (tmp_reg_267 == 1'd1) & (fsmState_3_load_reg_263 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        prevWord_data_V_9 <= tmp_data_V_19_reg_271;
        prevWord_keep_V_9 <= tmp_keep_V_19_reg_277;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (tmp_nbreadreq_fu_70_p5 == 1'd1) & (fsmState_3 == 1'd0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        rs_firstWord_3 <= ap_phi_mux_rs_firstWord_3_new_0_phi_fu_120_p4;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (tmp_nbreadreq_fu_70_p5 == 1'd1) & (fsmState_3 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        rs_firstWord_3_load_reg_287 <= rs_firstWord_3;
        tmp_data_V_19_reg_271 <= rx_ibh2shiftFifo_V_d_dout;
        tmp_keep_V_19_reg_277 <= rx_ibh2shiftFifo_V_k_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (tmp_nbreadreq_fu_70_p5 == 1'd1) & (rs_firstWord_3_load_load_fu_162_p1 == 1'd0) & (fsmState_3 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        tmp_last_V_19_reg_291 <= tmp_last_V_19_fu_176_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (fsmState_3 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        tmp_reg_267 <= tmp_nbreadreq_fu_70_p5;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
    if ((1'b1 == ap_condition_183)) begin
        if ((rs_firstWord_3_load_load_fu_162_p1 == 1'd1)) begin
            ap_phi_mux_p_0256_2_0_i_phi_fu_109_p4 = 1'd0;
        end else if ((rs_firstWord_3_load_load_fu_162_p1 == 1'd0)) begin
            ap_phi_mux_p_0256_2_0_i_phi_fu_109_p4 = tmp_last_V_19_fu_176_p2;
        end else begin
            ap_phi_mux_p_0256_2_0_i_phi_fu_109_p4 = ap_phi_reg_pp0_iter0_p_0256_2_0_i_reg_106;
        end
    end else begin
        ap_phi_mux_p_0256_2_0_i_phi_fu_109_p4 = ap_phi_reg_pp0_iter0_p_0256_2_0_i_reg_106;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_183)) begin
        if ((tmp_last_V_fu_158_p1 == 1'd0)) begin
            ap_phi_mux_rs_firstWord_3_new_0_phi_fu_120_p4 = 1'd0;
        end else if ((tmp_last_V_fu_158_p1 == 1'd1)) begin
            ap_phi_mux_rs_firstWord_3_new_0_phi_fu_120_p4 = 1'd1;
        end else begin
            ap_phi_mux_rs_firstWord_3_new_0_phi_fu_120_p4 = ap_phi_reg_pp0_iter0_rs_firstWord_3_new_0_reg_117;
        end
    end else begin
        ap_phi_mux_rs_firstWord_3_new_0_phi_fu_120_p4 = ap_phi_reg_pp0_iter0_rs_firstWord_3_new_0_reg_117;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
        rx_ibh2shiftFifo_V_d_blk_n = rx_ibh2shiftFifo_V_d_empty_n;
    end else begin
        rx_ibh2shiftFifo_V_d_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op7_read_state1 == 1'b1))) begin
        rx_ibh2shiftFifo_V_d_read = 1'b1;
    end else begin
        rx_ibh2shiftFifo_V_d_read = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op7_read_state1 == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        rx_ibh2shiftFifo_V_k_blk_n = rx_ibh2shiftFifo_V_k_empty_n;
    end else begin
        rx_ibh2shiftFifo_V_k_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op7_read_state1 == 1'b1))) begin
        rx_ibh2shiftFifo_V_k_read = 1'b1;
    end else begin
        rx_ibh2shiftFifo_V_k_read = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op7_read_state1 == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        rx_ibh2shiftFifo_V_l_blk_n = rx_ibh2shiftFifo_V_l_empty_n;
    end else begin
        rx_ibh2shiftFifo_V_l_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op7_read_state1 == 1'b1))) begin
        rx_ibh2shiftFifo_V_l_read = 1'b1;
    end else begin
        rx_ibh2shiftFifo_V_l_read = 1'b0;
    end
end

always @ (*) begin
    if ((((fsmState_3_load_reg_263 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op39_write_state2 == 1'b1) & (1'b0 == ap_block_pp0_stage0)))) begin
        rx_shift2exhFifo_V_d_blk_n = rx_shift2exhFifo_V_d_full_n;
    end else begin
        rx_shift2exhFifo_V_d_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_193)) begin
        if ((fsmState_3_load_reg_263 == 1'd1)) begin
            rx_shift2exhFifo_V_d_din = p_Result_12_fu_245_p3;
        end else if ((ap_predicate_op39_write_state2 == 1'b1)) begin
            rx_shift2exhFifo_V_d_din = p_Result_s_fu_214_p3;
        end else begin
            rx_shift2exhFifo_V_d_din = 'bx;
        end
    end else begin
        rx_shift2exhFifo_V_d_din = 'bx;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0_11001) & (fsmState_3_load_reg_263 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op39_write_state2 == 1'b1)))) begin
        rx_shift2exhFifo_V_d_write = 1'b1;
    end else begin
        rx_shift2exhFifo_V_d_write = 1'b0;
    end
end

always @ (*) begin
    if ((((fsmState_3_load_reg_263 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op39_write_state2 == 1'b1) & (1'b0 == ap_block_pp0_stage0)))) begin
        rx_shift2exhFifo_V_k_blk_n = rx_shift2exhFifo_V_k_full_n;
    end else begin
        rx_shift2exhFifo_V_k_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_193)) begin
        if ((fsmState_3_load_reg_263 == 1'd1)) begin
            rx_shift2exhFifo_V_k_din = p_Result_13_fu_254_p3;
        end else if ((ap_predicate_op39_write_state2 == 1'b1)) begin
            rx_shift2exhFifo_V_k_din = p_Result_11_fu_226_p3;
        end else begin
            rx_shift2exhFifo_V_k_din = 'bx;
        end
    end else begin
        rx_shift2exhFifo_V_k_din = 'bx;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0_11001) & (fsmState_3_load_reg_263 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op39_write_state2 == 1'b1)))) begin
        rx_shift2exhFifo_V_k_write = 1'b1;
    end else begin
        rx_shift2exhFifo_V_k_write = 1'b0;
    end
end

always @ (*) begin
    if ((((fsmState_3_load_reg_263 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op39_write_state2 == 1'b1) & (1'b0 == ap_block_pp0_stage0)))) begin
        rx_shift2exhFifo_V_l_blk_n = rx_shift2exhFifo_V_l_full_n;
    end else begin
        rx_shift2exhFifo_V_l_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_193)) begin
        if ((fsmState_3_load_reg_263 == 1'd1)) begin
            rx_shift2exhFifo_V_l_din = 1'd1;
        end else if ((ap_predicate_op39_write_state2 == 1'b1)) begin
            rx_shift2exhFifo_V_l_din = tmp_last_V_19_reg_291;
        end else begin
            rx_shift2exhFifo_V_l_din = 'bx;
        end
    end else begin
        rx_shift2exhFifo_V_l_din = 'bx;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0_11001) & (fsmState_3_load_reg_263 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op39_write_state2 == 1'b1)))) begin
        rx_shift2exhFifo_V_l_write = 1'b1;
    end else begin
        rx_shift2exhFifo_V_l_write = 1'b0;
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
    ap_block_pp0_stage0_01001 = ((ap_done_reg == 1'b1) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((fsmState_3_load_reg_263 == 1'd1) & (io_acc_block_signal_op49 == 1'b0)) | ((io_acc_block_signal_op39 == 1'b0) & (ap_predicate_op39_write_state2 == 1'b1)))) | ((ap_start == 1'b1) & ((ap_start == 1'b0) | (ap_done_reg == 1'b1) | ((io_acc_block_signal_op7 == 1'b0) & (ap_predicate_op7_read_state1 == 1'b1)))));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_done_reg == 1'b1) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((fsmState_3_load_reg_263 == 1'd1) & (io_acc_block_signal_op49 == 1'b0)) | ((io_acc_block_signal_op39 == 1'b0) & (ap_predicate_op39_write_state2 == 1'b1)))) | ((ap_start == 1'b1) & ((ap_start == 1'b0) | (ap_done_reg == 1'b1) | ((io_acc_block_signal_op7 == 1'b0) & (ap_predicate_op7_read_state1 == 1'b1)))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_done_reg == 1'b1) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((fsmState_3_load_reg_263 == 1'd1) & (io_acc_block_signal_op49 == 1'b0)) | ((io_acc_block_signal_op39 == 1'b0) & (ap_predicate_op39_write_state2 == 1'b1)))) | ((ap_start == 1'b1) & ((ap_start == 1'b0) | (ap_done_reg == 1'b1) | ((io_acc_block_signal_op7 == 1'b0) & (ap_predicate_op7_read_state1 == 1'b1)))));
end

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((ap_start == 1'b0) | (ap_done_reg == 1'b1) | ((io_acc_block_signal_op7 == 1'b0) & (ap_predicate_op7_read_state1 == 1'b1)));
end

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = (((fsmState_3_load_reg_263 == 1'd1) & (io_acc_block_signal_op49 == 1'b0)) | ((io_acc_block_signal_op39 == 1'b0) & (ap_predicate_op39_write_state2 == 1'b1)));
end

always @ (*) begin
    ap_condition_103 = ((1'b0 == ap_block_pp0_stage0_11001) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

always @ (*) begin
    ap_condition_170 = ((tmp_last_V_fu_158_p1 == 1'd1) & (tmp_nbreadreq_fu_70_p5 == 1'd1) & (ap_phi_mux_p_0256_2_0_i_phi_fu_109_p4 == 1'd0) & (fsmState_3 == 1'd0));
end

always @ (*) begin
    ap_condition_183 = ((tmp_nbreadreq_fu_70_p5 == 1'd1) & (fsmState_3 == 1'd0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0));
end

always @ (*) begin
    ap_condition_193 = ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_01001));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start;

assign ap_phi_reg_pp0_iter0_p_0256_2_0_i_reg_106 = 'bx;

assign ap_phi_reg_pp0_iter0_rs_firstWord_3_new_0_reg_117 = 'bx;

always @ (*) begin
    ap_predicate_op39_write_state2 = ((tmp_reg_267 == 1'd1) & (rs_firstWord_3_load_reg_287 == 1'd0) & (fsmState_3_load_reg_263 == 1'd0));
end

always @ (*) begin
    ap_predicate_op7_read_state1 = ((tmp_nbreadreq_fu_70_p5 == 1'd1) & (fsmState_3 == 1'd0));
end

assign fsmState_3_load_load_fu_146_p1 = fsmState_3;

assign grp_fu_128_p4 = {{prevWord_data_V_9[511:96]}};

assign grp_fu_137_p4 = {{prevWord_keep_V_9[63:12]}};

assign io_acc_block_signal_op39 = (rx_shift2exhFifo_V_l_full_n & rx_shift2exhFifo_V_k_full_n & rx_shift2exhFifo_V_d_full_n);

assign io_acc_block_signal_op49 = (rx_shift2exhFifo_V_l_full_n & rx_shift2exhFifo_V_k_full_n & rx_shift2exhFifo_V_d_full_n);

assign io_acc_block_signal_op7 = (rx_ibh2shiftFifo_V_l_empty_n & rx_ibh2shiftFifo_V_k_empty_n & rx_ibh2shiftFifo_V_d_empty_n);

assign p_Result_11_fu_226_p3 = {{trunc_ln647_5_fu_223_p1}, {grp_fu_137_p4}};

assign p_Result_12_fu_245_p3 = {{96'd0}, {grp_fu_128_p4}};

assign p_Result_13_fu_254_p3 = {{12'd0}, {grp_fu_137_p4}};

assign p_Result_49_i_fu_166_p4 = {{rx_ibh2shiftFifo_V_k_dout[63:12]}};

assign p_Result_s_fu_214_p3 = {{trunc_ln647_fu_211_p1}, {grp_fu_128_p4}};

assign rs_firstWord_3_load_load_fu_162_p1 = rs_firstWord_3;

assign tmp_last_V_19_fu_176_p2 = ((p_Result_49_i_fu_166_p4 == 52'd0) ? 1'b1 : 1'b0);

assign tmp_last_V_fu_158_p1 = rx_ibh2shiftFifo_V_l_dout;

assign tmp_nbreadreq_fu_70_p5 = (rx_ibh2shiftFifo_V_l_empty_n & rx_ibh2shiftFifo_V_k_empty_n & rx_ibh2shiftFifo_V_d_empty_n);

assign trunc_ln647_5_fu_223_p1 = tmp_keep_V_19_reg_277[11:0];

assign trunc_ln647_fu_211_p1 = tmp_data_V_19_reg_271[95:0];

endmodule //rshiftWordByOctet_2
