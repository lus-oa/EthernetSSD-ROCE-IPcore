// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2019.1
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module rshiftWordByOctet_1 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        rx_exh2aethShiftFifo_3_dout,
        rx_exh2aethShiftFifo_3_empty_n,
        rx_exh2aethShiftFifo_3_read,
        rx_exh2aethShiftFifo_5_dout,
        rx_exh2aethShiftFifo_5_empty_n,
        rx_exh2aethShiftFifo_5_read,
        rx_exh2aethShiftFifo_6_dout,
        rx_exh2aethShiftFifo_6_empty_n,
        rx_exh2aethShiftFifo_6_read,
        rx_aethSift2mergerFi_3_din,
        rx_aethSift2mergerFi_3_full_n,
        rx_aethSift2mergerFi_3_write,
        rx_aethSift2mergerFi_5_din,
        rx_aethSift2mergerFi_5_full_n,
        rx_aethSift2mergerFi_5_write,
        rx_aethSift2mergerFi_6_din,
        rx_aethSift2mergerFi_6_full_n,
        rx_aethSift2mergerFi_6_write
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [511:0] rx_exh2aethShiftFifo_3_dout;
input   rx_exh2aethShiftFifo_3_empty_n;
output   rx_exh2aethShiftFifo_3_read;
input  [63:0] rx_exh2aethShiftFifo_5_dout;
input   rx_exh2aethShiftFifo_5_empty_n;
output   rx_exh2aethShiftFifo_5_read;
input  [0:0] rx_exh2aethShiftFifo_6_dout;
input   rx_exh2aethShiftFifo_6_empty_n;
output   rx_exh2aethShiftFifo_6_read;
output  [511:0] rx_aethSift2mergerFi_3_din;
input   rx_aethSift2mergerFi_3_full_n;
output   rx_aethSift2mergerFi_3_write;
output  [63:0] rx_aethSift2mergerFi_5_din;
input   rx_aethSift2mergerFi_5_full_n;
output   rx_aethSift2mergerFi_5_write;
output  [0:0] rx_aethSift2mergerFi_6_din;
input   rx_aethSift2mergerFi_6_full_n;
output   rx_aethSift2mergerFi_6_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg rx_exh2aethShiftFifo_3_read;
reg rx_exh2aethShiftFifo_5_read;
reg rx_exh2aethShiftFifo_6_read;
reg[511:0] rx_aethSift2mergerFi_3_din;
reg rx_aethSift2mergerFi_3_write;
reg[63:0] rx_aethSift2mergerFi_5_din;
reg rx_aethSift2mergerFi_5_write;
reg[0:0] rx_aethSift2mergerFi_6_din;
reg rx_aethSift2mergerFi_6_write;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire    io_acc_block_signal_op7;
wire   [0:0] fsmState_2_load_load_fu_144_p1;
wire   [0:0] tmp_nbreadreq_fu_68_p5;
reg    ap_predicate_op7_read_state1;
reg    ap_block_state1_pp0_stage0_iter0;
wire    io_acc_block_signal_op39;
reg   [0:0] fsmState_2_load_reg_261;
reg   [0:0] tmp_reg_265;
reg   [0:0] rs_firstWord_2_load_reg_285;
reg    ap_predicate_op39_write_state2;
wire    io_acc_block_signal_op49;
reg    ap_block_state2_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_11001;
reg   [0:0] fsmState_2;
reg   [511:0] prevWord_data_V_18;
reg   [63:0] prevWord_keep_V_17;
reg   [0:0] rs_firstWord_2;
reg    rx_exh2aethShiftFifo_3_blk_n;
wire    ap_block_pp0_stage0;
reg    rx_exh2aethShiftFifo_5_blk_n;
reg    rx_exh2aethShiftFifo_6_blk_n;
reg    rx_aethSift2mergerFi_3_blk_n;
reg    rx_aethSift2mergerFi_5_blk_n;
reg    rx_aethSift2mergerFi_6_blk_n;
reg   [511:0] tmp_data_V_22_reg_269;
reg   [63:0] tmp_keep_V_22_reg_275;
wire   [0:0] tmp_last_V_fu_156_p1;
wire   [0:0] rs_firstWord_2_load_load_fu_160_p1;
wire   [0:0] tmp_last_V_20_fu_174_p2;
reg   [0:0] tmp_last_V_20_reg_289;
reg    ap_block_pp0_stage0_subdone;
reg   [0:0] ap_phi_mux_p_0256_2_0_i_phi_fu_107_p4;
wire   [0:0] ap_phi_reg_pp0_iter0_p_0256_2_0_i_reg_104;
reg   [0:0] ap_phi_mux_rs_firstWord_4_new_0_phi_fu_118_p4;
wire   [0:0] ap_phi_reg_pp0_iter0_rs_firstWord_4_new_0_reg_115;
wire   [511:0] p_Result_s_fu_212_p3;
reg    ap_block_pp0_stage0_01001;
wire   [511:0] p_Result_15_fu_243_p3;
wire   [63:0] p_Result_14_fu_224_p3;
wire   [63:0] p_Result_16_fu_252_p3;
wire   [59:0] p_Result_40_i_fu_164_p4;
wire   [31:0] trunc_ln647_fu_209_p1;
wire   [479:0] grp_fu_126_p4;
wire   [3:0] trunc_ln647_6_fu_221_p1;
wire   [59:0] grp_fu_135_p4;
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
#0 fsmState_2 = 1'd0;
#0 prevWord_data_V_18 = 512'd0;
#0 prevWord_keep_V_17 = 64'd0;
#0 rs_firstWord_2 = 1'd1;
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
        if ((fsmState_2_load_load_fu_144_p1 == 1'd1)) begin
            fsmState_2 <= 1'd0;
        end else if ((1'b1 == ap_condition_170)) begin
            fsmState_2 <= 1'd1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        fsmState_2_load_reg_261 <= fsmState_2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (tmp_reg_265 == 1'd1) & (fsmState_2_load_reg_261 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        prevWord_data_V_18 <= tmp_data_V_22_reg_269;
        prevWord_keep_V_17 <= tmp_keep_V_22_reg_275;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (tmp_nbreadreq_fu_68_p5 == 1'd1) & (fsmState_2 == 1'd0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        rs_firstWord_2 <= ap_phi_mux_rs_firstWord_4_new_0_phi_fu_118_p4;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (tmp_nbreadreq_fu_68_p5 == 1'd1) & (fsmState_2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        rs_firstWord_2_load_reg_285 <= rs_firstWord_2;
        tmp_data_V_22_reg_269 <= rx_exh2aethShiftFifo_3_dout;
        tmp_keep_V_22_reg_275 <= rx_exh2aethShiftFifo_5_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (tmp_nbreadreq_fu_68_p5 == 1'd1) & (rs_firstWord_2_load_load_fu_160_p1 == 1'd0) & (fsmState_2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        tmp_last_V_20_reg_289 <= tmp_last_V_20_fu_174_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (fsmState_2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        tmp_reg_265 <= tmp_nbreadreq_fu_68_p5;
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
        if ((rs_firstWord_2_load_load_fu_160_p1 == 1'd1)) begin
            ap_phi_mux_p_0256_2_0_i_phi_fu_107_p4 = 1'd0;
        end else if ((rs_firstWord_2_load_load_fu_160_p1 == 1'd0)) begin
            ap_phi_mux_p_0256_2_0_i_phi_fu_107_p4 = tmp_last_V_20_fu_174_p2;
        end else begin
            ap_phi_mux_p_0256_2_0_i_phi_fu_107_p4 = ap_phi_reg_pp0_iter0_p_0256_2_0_i_reg_104;
        end
    end else begin
        ap_phi_mux_p_0256_2_0_i_phi_fu_107_p4 = ap_phi_reg_pp0_iter0_p_0256_2_0_i_reg_104;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_183)) begin
        if ((tmp_last_V_fu_156_p1 == 1'd0)) begin
            ap_phi_mux_rs_firstWord_4_new_0_phi_fu_118_p4 = 1'd0;
        end else if ((tmp_last_V_fu_156_p1 == 1'd1)) begin
            ap_phi_mux_rs_firstWord_4_new_0_phi_fu_118_p4 = 1'd1;
        end else begin
            ap_phi_mux_rs_firstWord_4_new_0_phi_fu_118_p4 = ap_phi_reg_pp0_iter0_rs_firstWord_4_new_0_reg_115;
        end
    end else begin
        ap_phi_mux_rs_firstWord_4_new_0_phi_fu_118_p4 = ap_phi_reg_pp0_iter0_rs_firstWord_4_new_0_reg_115;
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
    if ((((fsmState_2_load_reg_261 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op39_write_state2 == 1'b1) & (1'b0 == ap_block_pp0_stage0)))) begin
        rx_aethSift2mergerFi_3_blk_n = rx_aethSift2mergerFi_3_full_n;
    end else begin
        rx_aethSift2mergerFi_3_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_193)) begin
        if ((fsmState_2_load_reg_261 == 1'd1)) begin
            rx_aethSift2mergerFi_3_din = p_Result_15_fu_243_p3;
        end else if ((ap_predicate_op39_write_state2 == 1'b1)) begin
            rx_aethSift2mergerFi_3_din = p_Result_s_fu_212_p3;
        end else begin
            rx_aethSift2mergerFi_3_din = 'bx;
        end
    end else begin
        rx_aethSift2mergerFi_3_din = 'bx;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0_11001) & (fsmState_2_load_reg_261 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op39_write_state2 == 1'b1)))) begin
        rx_aethSift2mergerFi_3_write = 1'b1;
    end else begin
        rx_aethSift2mergerFi_3_write = 1'b0;
    end
end

always @ (*) begin
    if ((((fsmState_2_load_reg_261 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op39_write_state2 == 1'b1) & (1'b0 == ap_block_pp0_stage0)))) begin
        rx_aethSift2mergerFi_5_blk_n = rx_aethSift2mergerFi_5_full_n;
    end else begin
        rx_aethSift2mergerFi_5_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_193)) begin
        if ((fsmState_2_load_reg_261 == 1'd1)) begin
            rx_aethSift2mergerFi_5_din = p_Result_16_fu_252_p3;
        end else if ((ap_predicate_op39_write_state2 == 1'b1)) begin
            rx_aethSift2mergerFi_5_din = p_Result_14_fu_224_p3;
        end else begin
            rx_aethSift2mergerFi_5_din = 'bx;
        end
    end else begin
        rx_aethSift2mergerFi_5_din = 'bx;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0_11001) & (fsmState_2_load_reg_261 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op39_write_state2 == 1'b1)))) begin
        rx_aethSift2mergerFi_5_write = 1'b1;
    end else begin
        rx_aethSift2mergerFi_5_write = 1'b0;
    end
end

always @ (*) begin
    if ((((fsmState_2_load_reg_261 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op39_write_state2 == 1'b1) & (1'b0 == ap_block_pp0_stage0)))) begin
        rx_aethSift2mergerFi_6_blk_n = rx_aethSift2mergerFi_6_full_n;
    end else begin
        rx_aethSift2mergerFi_6_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_193)) begin
        if ((fsmState_2_load_reg_261 == 1'd1)) begin
            rx_aethSift2mergerFi_6_din = 1'd1;
        end else if ((ap_predicate_op39_write_state2 == 1'b1)) begin
            rx_aethSift2mergerFi_6_din = tmp_last_V_20_reg_289;
        end else begin
            rx_aethSift2mergerFi_6_din = 'bx;
        end
    end else begin
        rx_aethSift2mergerFi_6_din = 'bx;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0_11001) & (fsmState_2_load_reg_261 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op39_write_state2 == 1'b1)))) begin
        rx_aethSift2mergerFi_6_write = 1'b1;
    end else begin
        rx_aethSift2mergerFi_6_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op7_read_state1 == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        rx_exh2aethShiftFifo_3_blk_n = rx_exh2aethShiftFifo_3_empty_n;
    end else begin
        rx_exh2aethShiftFifo_3_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op7_read_state1 == 1'b1))) begin
        rx_exh2aethShiftFifo_3_read = 1'b1;
    end else begin
        rx_exh2aethShiftFifo_3_read = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op7_read_state1 == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        rx_exh2aethShiftFifo_5_blk_n = rx_exh2aethShiftFifo_5_empty_n;
    end else begin
        rx_exh2aethShiftFifo_5_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op7_read_state1 == 1'b1))) begin
        rx_exh2aethShiftFifo_5_read = 1'b1;
    end else begin
        rx_exh2aethShiftFifo_5_read = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op7_read_state1 == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        rx_exh2aethShiftFifo_6_blk_n = rx_exh2aethShiftFifo_6_empty_n;
    end else begin
        rx_exh2aethShiftFifo_6_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op7_read_state1 == 1'b1))) begin
        rx_exh2aethShiftFifo_6_read = 1'b1;
    end else begin
        rx_exh2aethShiftFifo_6_read = 1'b0;
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
    ap_block_pp0_stage0_01001 = ((ap_done_reg == 1'b1) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((fsmState_2_load_reg_261 == 1'd1) & (io_acc_block_signal_op49 == 1'b0)) | ((io_acc_block_signal_op39 == 1'b0) & (ap_predicate_op39_write_state2 == 1'b1)))) | ((ap_start == 1'b1) & ((ap_start == 1'b0) | (ap_done_reg == 1'b1) | ((io_acc_block_signal_op7 == 1'b0) & (ap_predicate_op7_read_state1 == 1'b1)))));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_done_reg == 1'b1) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((fsmState_2_load_reg_261 == 1'd1) & (io_acc_block_signal_op49 == 1'b0)) | ((io_acc_block_signal_op39 == 1'b0) & (ap_predicate_op39_write_state2 == 1'b1)))) | ((ap_start == 1'b1) & ((ap_start == 1'b0) | (ap_done_reg == 1'b1) | ((io_acc_block_signal_op7 == 1'b0) & (ap_predicate_op7_read_state1 == 1'b1)))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_done_reg == 1'b1) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((fsmState_2_load_reg_261 == 1'd1) & (io_acc_block_signal_op49 == 1'b0)) | ((io_acc_block_signal_op39 == 1'b0) & (ap_predicate_op39_write_state2 == 1'b1)))) | ((ap_start == 1'b1) & ((ap_start == 1'b0) | (ap_done_reg == 1'b1) | ((io_acc_block_signal_op7 == 1'b0) & (ap_predicate_op7_read_state1 == 1'b1)))));
end

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((ap_start == 1'b0) | (ap_done_reg == 1'b1) | ((io_acc_block_signal_op7 == 1'b0) & (ap_predicate_op7_read_state1 == 1'b1)));
end

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = (((fsmState_2_load_reg_261 == 1'd1) & (io_acc_block_signal_op49 == 1'b0)) | ((io_acc_block_signal_op39 == 1'b0) & (ap_predicate_op39_write_state2 == 1'b1)));
end

always @ (*) begin
    ap_condition_103 = ((1'b0 == ap_block_pp0_stage0_11001) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

always @ (*) begin
    ap_condition_170 = ((tmp_last_V_fu_156_p1 == 1'd1) & (tmp_nbreadreq_fu_68_p5 == 1'd1) & (ap_phi_mux_p_0256_2_0_i_phi_fu_107_p4 == 1'd0) & (fsmState_2 == 1'd0));
end

always @ (*) begin
    ap_condition_183 = ((tmp_nbreadreq_fu_68_p5 == 1'd1) & (fsmState_2 == 1'd0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0));
end

always @ (*) begin
    ap_condition_193 = ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_01001));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start;

assign ap_phi_reg_pp0_iter0_p_0256_2_0_i_reg_104 = 'bx;

assign ap_phi_reg_pp0_iter0_rs_firstWord_4_new_0_reg_115 = 'bx;

always @ (*) begin
    ap_predicate_op39_write_state2 = ((tmp_reg_265 == 1'd1) & (rs_firstWord_2_load_reg_285 == 1'd0) & (fsmState_2_load_reg_261 == 1'd0));
end

always @ (*) begin
    ap_predicate_op7_read_state1 = ((tmp_nbreadreq_fu_68_p5 == 1'd1) & (fsmState_2 == 1'd0));
end

assign fsmState_2_load_load_fu_144_p1 = fsmState_2;

assign grp_fu_126_p4 = {{prevWord_data_V_18[511:32]}};

assign grp_fu_135_p4 = {{prevWord_keep_V_17[63:4]}};

assign io_acc_block_signal_op39 = (rx_aethSift2mergerFi_6_full_n & rx_aethSift2mergerFi_5_full_n & rx_aethSift2mergerFi_3_full_n);

assign io_acc_block_signal_op49 = (rx_aethSift2mergerFi_6_full_n & rx_aethSift2mergerFi_5_full_n & rx_aethSift2mergerFi_3_full_n);

assign io_acc_block_signal_op7 = (rx_exh2aethShiftFifo_6_empty_n & rx_exh2aethShiftFifo_5_empty_n & rx_exh2aethShiftFifo_3_empty_n);

assign p_Result_14_fu_224_p3 = {{trunc_ln647_6_fu_221_p1}, {grp_fu_135_p4}};

assign p_Result_15_fu_243_p3 = {{32'd0}, {grp_fu_126_p4}};

assign p_Result_16_fu_252_p3 = {{4'd0}, {grp_fu_135_p4}};

assign p_Result_40_i_fu_164_p4 = {{rx_exh2aethShiftFifo_5_dout[63:4]}};

assign p_Result_s_fu_212_p3 = {{trunc_ln647_fu_209_p1}, {grp_fu_126_p4}};

assign rs_firstWord_2_load_load_fu_160_p1 = rs_firstWord_2;

assign tmp_last_V_20_fu_174_p2 = ((p_Result_40_i_fu_164_p4 == 60'd0) ? 1'b1 : 1'b0);

assign tmp_last_V_fu_156_p1 = rx_exh2aethShiftFifo_6_dout;

assign tmp_nbreadreq_fu_68_p5 = (rx_exh2aethShiftFifo_6_empty_n & rx_exh2aethShiftFifo_5_empty_n & rx_exh2aethShiftFifo_3_empty_n);

assign trunc_ln647_6_fu_221_p1 = tmp_keep_V_22_reg_275[3:0];

assign trunc_ln647_fu_209_p1 = tmp_data_V_22_reg_269[31:0];

endmodule //rshiftWordByOctet_1
