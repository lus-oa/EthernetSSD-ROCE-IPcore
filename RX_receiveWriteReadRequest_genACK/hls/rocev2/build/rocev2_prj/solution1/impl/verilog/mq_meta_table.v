// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2019.1
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module mq_meta_table (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        mq_metaReqFifo_V_idx_dout,
        mq_metaReqFifo_V_idx_empty_n,
        mq_metaReqFifo_V_idx_read,
        mq_metaReqFifo_V_ent_dout,
        mq_metaReqFifo_V_ent_empty_n,
        mq_metaReqFifo_V_ent_read,
        mq_metaReqFifo_V_ent_3_dout,
        mq_metaReqFifo_V_ent_3_empty_n,
        mq_metaReqFifo_V_ent_3_read,
        mq_metaReqFifo_V_ent_4_dout,
        mq_metaReqFifo_V_ent_4_empty_n,
        mq_metaReqFifo_V_ent_4_read,
        mq_metaReqFifo_V_ent_1_dout,
        mq_metaReqFifo_V_ent_1_empty_n,
        mq_metaReqFifo_V_ent_1_read,
        mq_metaReqFifo_V_wri_dout,
        mq_metaReqFifo_V_wri_empty_n,
        mq_metaReqFifo_V_wri_read,
        mq_metaReqFifo_V_app_dout,
        mq_metaReqFifo_V_app_empty_n,
        mq_metaReqFifo_V_app_read,
        mq_metaRspFifo_V_val_din,
        mq_metaRspFifo_V_val_full_n,
        mq_metaRspFifo_V_val_write,
        mq_metaRspFifo_V_nex_din,
        mq_metaRspFifo_V_nex_full_n,
        mq_metaRspFifo_V_nex_write,
        mq_metaRspFifo_V_val_1_din,
        mq_metaRspFifo_V_val_1_full_n,
        mq_metaRspFifo_V_val_1_write,
        mq_metaRspFifo_V_isT_din,
        mq_metaRspFifo_V_isT_full_n,
        mq_metaRspFifo_V_isT_write
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [15:0] mq_metaReqFifo_V_idx_dout;
input   mq_metaReqFifo_V_idx_empty_n;
output   mq_metaReqFifo_V_idx_read;
input  [63:0] mq_metaReqFifo_V_ent_dout;
input   mq_metaReqFifo_V_ent_empty_n;
output   mq_metaReqFifo_V_ent_read;
input  [15:0] mq_metaReqFifo_V_ent_3_dout;
input   mq_metaReqFifo_V_ent_3_empty_n;
output   mq_metaReqFifo_V_ent_3_read;
input  [0:0] mq_metaReqFifo_V_ent_4_dout;
input   mq_metaReqFifo_V_ent_4_empty_n;
output   mq_metaReqFifo_V_ent_4_read;
input  [0:0] mq_metaReqFifo_V_ent_1_dout;
input   mq_metaReqFifo_V_ent_1_empty_n;
output   mq_metaReqFifo_V_ent_1_read;
input  [0:0] mq_metaReqFifo_V_wri_dout;
input   mq_metaReqFifo_V_wri_empty_n;
output   mq_metaReqFifo_V_wri_read;
input  [0:0] mq_metaReqFifo_V_app_dout;
input   mq_metaReqFifo_V_app_empty_n;
output   mq_metaReqFifo_V_app_read;
output  [63:0] mq_metaRspFifo_V_val_din;
input   mq_metaRspFifo_V_val_full_n;
output   mq_metaRspFifo_V_val_write;
output  [15:0] mq_metaRspFifo_V_nex_din;
input   mq_metaRspFifo_V_nex_full_n;
output   mq_metaRspFifo_V_nex_write;
output  [0:0] mq_metaRspFifo_V_val_1_din;
input   mq_metaRspFifo_V_val_1_full_n;
output   mq_metaRspFifo_V_val_1_write;
output  [0:0] mq_metaRspFifo_V_isT_din;
input   mq_metaRspFifo_V_isT_full_n;
output   mq_metaRspFifo_V_isT_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg mq_metaReqFifo_V_idx_read;
reg mq_metaReqFifo_V_ent_read;
reg mq_metaReqFifo_V_ent_3_read;
reg mq_metaReqFifo_V_ent_4_read;
reg mq_metaReqFifo_V_ent_1_read;
reg mq_metaReqFifo_V_wri_read;
reg mq_metaReqFifo_V_app_read;
reg mq_metaRspFifo_V_val_write;
reg mq_metaRspFifo_V_nex_write;
reg mq_metaRspFifo_V_val_1_write;
reg mq_metaRspFifo_V_isT_write;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire    io_acc_block_signal_op5;
wire   [0:0] tmp_nbreadreq_fu_64_p9;
reg    ap_block_state1_pp0_stage0_iter0;
wire    io_acc_block_signal_op53;
reg   [0:0] tmp_reg_269;
reg   [0:0] tmp_write_reg_273;
reg   [0:0] tmp_append_reg_277;
reg    ap_predicate_op53_write_state2;
reg    ap_block_state2_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_11001;
reg   [10:0] meta_table_value_V_address0;
reg    meta_table_value_V_ce0;
reg    meta_table_value_V_we0;
wire   [63:0] meta_table_value_V_q0;
reg   [10:0] meta_table_next_V_address0;
reg    meta_table_next_V_ce0;
reg    meta_table_next_V_we0;
wire   [15:0] meta_table_next_V_q0;
reg   [10:0] meta_table_valid_address0;
reg    meta_table_valid_ce0;
reg    meta_table_valid_we0;
wire   [0:0] meta_table_valid_q0;
reg   [10:0] meta_table_isTail_address0;
reg    meta_table_isTail_ce0;
reg    meta_table_isTail_we0;
reg   [0:0] meta_table_isTail_d0;
wire   [0:0] meta_table_isTail_q0;
reg    mq_metaReqFifo_V_idx_blk_n;
wire    ap_block_pp0_stage0;
reg    mq_metaReqFifo_V_ent_blk_n;
reg    mq_metaReqFifo_V_ent_3_blk_n;
reg    mq_metaReqFifo_V_ent_4_blk_n;
reg    mq_metaReqFifo_V_ent_1_blk_n;
reg    mq_metaReqFifo_V_wri_blk_n;
reg    mq_metaReqFifo_V_app_blk_n;
reg    mq_metaRspFifo_V_val_blk_n;
reg    mq_metaRspFifo_V_nex_blk_n;
reg    mq_metaRspFifo_V_val_1_blk_n;
reg    mq_metaRspFifo_V_isT_blk_n;
wire   [0:0] tmp_write_fu_247_p1;
wire   [0:0] tmp_append_fu_251_p1;
reg    ap_block_pp0_stage0_subdone;
wire   [63:0] zext_ln544_fu_255_p1;
wire   [10:0] meta_table_next_V_ad_1_gep_fu_174_p3;
wire   [10:0] meta_table_isTail_ad_1_gep_fu_182_p3;
wire   [10:0] meta_table_value_V_a_gep_fu_191_p3;
wire   [10:0] meta_table_next_V_ad_gep_fu_199_p3;
wire   [10:0] meta_table_valid_add_gep_fu_207_p3;
wire   [10:0] meta_table_isTail_ad_gep_fu_215_p3;
reg    ap_block_pp0_stage0_01001;
reg   [0:0] ap_NS_fsm;
reg    ap_idle_pp0_0to0;
reg    ap_reset_idle_pp0;
wire    ap_enable_pp0;
reg    ap_condition_159;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
end

mq_meta_table_meta_table_value_V #(
    .DataWidth( 64 ),
    .AddressRange( 2048 ),
    .AddressWidth( 11 ))
meta_table_value_V_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(meta_table_value_V_address0),
    .ce0(meta_table_value_V_ce0),
    .we0(meta_table_value_V_we0),
    .d0(mq_metaReqFifo_V_ent_dout),
    .q0(meta_table_value_V_q0)
);

mq_meta_table_meta_table_next_V #(
    .DataWidth( 16 ),
    .AddressRange( 2048 ),
    .AddressWidth( 11 ))
meta_table_next_V_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(meta_table_next_V_address0),
    .ce0(meta_table_next_V_ce0),
    .we0(meta_table_next_V_we0),
    .d0(mq_metaReqFifo_V_ent_3_dout),
    .q0(meta_table_next_V_q0)
);

mq_meta_table_meta_table_valid #(
    .DataWidth( 1 ),
    .AddressRange( 2048 ),
    .AddressWidth( 11 ))
meta_table_valid_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(meta_table_valid_address0),
    .ce0(meta_table_valid_ce0),
    .we0(meta_table_valid_we0),
    .d0(mq_metaReqFifo_V_ent_4_dout),
    .q0(meta_table_valid_q0)
);

mq_meta_table_meta_table_valid #(
    .DataWidth( 1 ),
    .AddressRange( 2048 ),
    .AddressWidth( 11 ))
meta_table_isTail_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(meta_table_isTail_address0),
    .ce0(meta_table_isTail_ce0),
    .we0(meta_table_isTail_we0),
    .d0(meta_table_isTail_d0),
    .q0(meta_table_isTail_q0)
);

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
    if (((tmp_nbreadreq_fu_64_p9 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_append_reg_277 <= mq_metaReqFifo_V_app_dout;
        tmp_write_reg_273 <= mq_metaReqFifo_V_wri_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_reg_269 <= tmp_nbreadreq_fu_64_p9;
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
    if ((1'b1 == ap_condition_159)) begin
        if ((tmp_write_fu_247_p1 == 1'd1)) begin
            meta_table_isTail_address0 = meta_table_isTail_ad_gep_fu_215_p3;
        end else if (((tmp_write_fu_247_p1 == 1'd0) & (tmp_append_fu_251_p1 == 1'd1))) begin
            meta_table_isTail_address0 = meta_table_isTail_ad_1_gep_fu_182_p3;
        end else if (((tmp_append_fu_251_p1 == 1'd0) & (tmp_write_fu_247_p1 == 1'd0))) begin
            meta_table_isTail_address0 = zext_ln544_fu_255_p1;
        end else begin
            meta_table_isTail_address0 = 'bx;
        end
    end else begin
        meta_table_isTail_address0 = 'bx;
    end
end

always @ (*) begin
    if ((((tmp_write_fu_247_p1 == 1'd1) & (tmp_nbreadreq_fu_64_p9 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)) | ((tmp_write_fu_247_p1 == 1'd0) & (tmp_append_fu_251_p1 == 1'd1) & (tmp_nbreadreq_fu_64_p9 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)) | ((tmp_append_fu_251_p1 == 1'd0) & (tmp_write_fu_247_p1 == 1'd0) & (tmp_nbreadreq_fu_64_p9 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        meta_table_isTail_ce0 = 1'b1;
    end else begin
        meta_table_isTail_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_159)) begin
        if ((tmp_write_fu_247_p1 == 1'd1)) begin
            meta_table_isTail_d0 = mq_metaReqFifo_V_ent_1_dout;
        end else if (((tmp_write_fu_247_p1 == 1'd0) & (tmp_append_fu_251_p1 == 1'd1))) begin
            meta_table_isTail_d0 = 1'd0;
        end else begin
            meta_table_isTail_d0 = 'bx;
        end
    end else begin
        meta_table_isTail_d0 = 'bx;
    end
end

always @ (*) begin
    if ((((tmp_write_fu_247_p1 == 1'd1) & (tmp_nbreadreq_fu_64_p9 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)) | ((tmp_write_fu_247_p1 == 1'd0) & (tmp_append_fu_251_p1 == 1'd1) & (tmp_nbreadreq_fu_64_p9 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        meta_table_isTail_we0 = 1'b1;
    end else begin
        meta_table_isTail_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_159)) begin
        if ((tmp_write_fu_247_p1 == 1'd1)) begin
            meta_table_next_V_address0 = meta_table_next_V_ad_gep_fu_199_p3;
        end else if (((tmp_write_fu_247_p1 == 1'd0) & (tmp_append_fu_251_p1 == 1'd1))) begin
            meta_table_next_V_address0 = meta_table_next_V_ad_1_gep_fu_174_p3;
        end else if (((tmp_append_fu_251_p1 == 1'd0) & (tmp_write_fu_247_p1 == 1'd0))) begin
            meta_table_next_V_address0 = zext_ln544_fu_255_p1;
        end else begin
            meta_table_next_V_address0 = 'bx;
        end
    end else begin
        meta_table_next_V_address0 = 'bx;
    end
end

always @ (*) begin
    if ((((tmp_write_fu_247_p1 == 1'd1) & (tmp_nbreadreq_fu_64_p9 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)) | ((tmp_write_fu_247_p1 == 1'd0) & (tmp_append_fu_251_p1 == 1'd1) & (tmp_nbreadreq_fu_64_p9 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)) | ((tmp_append_fu_251_p1 == 1'd0) & (tmp_write_fu_247_p1 == 1'd0) & (tmp_nbreadreq_fu_64_p9 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        meta_table_next_V_ce0 = 1'b1;
    end else begin
        meta_table_next_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((((tmp_write_fu_247_p1 == 1'd1) & (tmp_nbreadreq_fu_64_p9 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)) | ((tmp_write_fu_247_p1 == 1'd0) & (tmp_append_fu_251_p1 == 1'd1) & (tmp_nbreadreq_fu_64_p9 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        meta_table_next_V_we0 = 1'b1;
    end else begin
        meta_table_next_V_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_159)) begin
        if ((tmp_write_fu_247_p1 == 1'd1)) begin
            meta_table_valid_address0 = meta_table_valid_add_gep_fu_207_p3;
        end else if (((tmp_append_fu_251_p1 == 1'd0) & (tmp_write_fu_247_p1 == 1'd0))) begin
            meta_table_valid_address0 = zext_ln544_fu_255_p1;
        end else begin
            meta_table_valid_address0 = 'bx;
        end
    end else begin
        meta_table_valid_address0 = 'bx;
    end
end

always @ (*) begin
    if ((((tmp_write_fu_247_p1 == 1'd1) & (tmp_nbreadreq_fu_64_p9 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)) | ((tmp_append_fu_251_p1 == 1'd0) & (tmp_write_fu_247_p1 == 1'd0) & (tmp_nbreadreq_fu_64_p9 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        meta_table_valid_ce0 = 1'b1;
    end else begin
        meta_table_valid_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_write_fu_247_p1 == 1'd1) & (tmp_nbreadreq_fu_64_p9 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        meta_table_valid_we0 = 1'b1;
    end else begin
        meta_table_valid_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_159)) begin
        if ((tmp_write_fu_247_p1 == 1'd1)) begin
            meta_table_value_V_address0 = meta_table_value_V_a_gep_fu_191_p3;
        end else if (((tmp_append_fu_251_p1 == 1'd0) & (tmp_write_fu_247_p1 == 1'd0))) begin
            meta_table_value_V_address0 = zext_ln544_fu_255_p1;
        end else begin
            meta_table_value_V_address0 = 'bx;
        end
    end else begin
        meta_table_value_V_address0 = 'bx;
    end
end

always @ (*) begin
    if ((((tmp_write_fu_247_p1 == 1'd1) & (tmp_nbreadreq_fu_64_p9 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)) | ((tmp_append_fu_251_p1 == 1'd0) & (tmp_write_fu_247_p1 == 1'd0) & (tmp_nbreadreq_fu_64_p9 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        meta_table_value_V_ce0 = 1'b1;
    end else begin
        meta_table_value_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_write_fu_247_p1 == 1'd1) & (tmp_nbreadreq_fu_64_p9 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        meta_table_value_V_we0 = 1'b1;
    end else begin
        meta_table_value_V_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (tmp_nbreadreq_fu_64_p9 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        mq_metaReqFifo_V_app_blk_n = mq_metaReqFifo_V_app_empty_n;
    end else begin
        mq_metaReqFifo_V_app_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((tmp_nbreadreq_fu_64_p9 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        mq_metaReqFifo_V_app_read = 1'b1;
    end else begin
        mq_metaReqFifo_V_app_read = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (tmp_nbreadreq_fu_64_p9 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        mq_metaReqFifo_V_ent_1_blk_n = mq_metaReqFifo_V_ent_1_empty_n;
    end else begin
        mq_metaReqFifo_V_ent_1_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((tmp_nbreadreq_fu_64_p9 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        mq_metaReqFifo_V_ent_1_read = 1'b1;
    end else begin
        mq_metaReqFifo_V_ent_1_read = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (tmp_nbreadreq_fu_64_p9 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        mq_metaReqFifo_V_ent_3_blk_n = mq_metaReqFifo_V_ent_3_empty_n;
    end else begin
        mq_metaReqFifo_V_ent_3_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((tmp_nbreadreq_fu_64_p9 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        mq_metaReqFifo_V_ent_3_read = 1'b1;
    end else begin
        mq_metaReqFifo_V_ent_3_read = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (tmp_nbreadreq_fu_64_p9 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        mq_metaReqFifo_V_ent_4_blk_n = mq_metaReqFifo_V_ent_4_empty_n;
    end else begin
        mq_metaReqFifo_V_ent_4_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((tmp_nbreadreq_fu_64_p9 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        mq_metaReqFifo_V_ent_4_read = 1'b1;
    end else begin
        mq_metaReqFifo_V_ent_4_read = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (tmp_nbreadreq_fu_64_p9 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        mq_metaReqFifo_V_ent_blk_n = mq_metaReqFifo_V_ent_empty_n;
    end else begin
        mq_metaReqFifo_V_ent_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((tmp_nbreadreq_fu_64_p9 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        mq_metaReqFifo_V_ent_read = 1'b1;
    end else begin
        mq_metaReqFifo_V_ent_read = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (tmp_nbreadreq_fu_64_p9 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        mq_metaReqFifo_V_idx_blk_n = mq_metaReqFifo_V_idx_empty_n;
    end else begin
        mq_metaReqFifo_V_idx_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((tmp_nbreadreq_fu_64_p9 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        mq_metaReqFifo_V_idx_read = 1'b1;
    end else begin
        mq_metaReqFifo_V_idx_read = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (tmp_nbreadreq_fu_64_p9 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        mq_metaReqFifo_V_wri_blk_n = mq_metaReqFifo_V_wri_empty_n;
    end else begin
        mq_metaReqFifo_V_wri_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((tmp_nbreadreq_fu_64_p9 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        mq_metaReqFifo_V_wri_read = 1'b1;
    end else begin
        mq_metaReqFifo_V_wri_read = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op53_write_state2 == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        mq_metaRspFifo_V_isT_blk_n = mq_metaRspFifo_V_isT_full_n;
    end else begin
        mq_metaRspFifo_V_isT_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op53_write_state2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        mq_metaRspFifo_V_isT_write = 1'b1;
    end else begin
        mq_metaRspFifo_V_isT_write = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op53_write_state2 == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        mq_metaRspFifo_V_nex_blk_n = mq_metaRspFifo_V_nex_full_n;
    end else begin
        mq_metaRspFifo_V_nex_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op53_write_state2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        mq_metaRspFifo_V_nex_write = 1'b1;
    end else begin
        mq_metaRspFifo_V_nex_write = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op53_write_state2 == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        mq_metaRspFifo_V_val_1_blk_n = mq_metaRspFifo_V_val_1_full_n;
    end else begin
        mq_metaRspFifo_V_val_1_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op53_write_state2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        mq_metaRspFifo_V_val_1_write = 1'b1;
    end else begin
        mq_metaRspFifo_V_val_1_write = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op53_write_state2 == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        mq_metaRspFifo_V_val_blk_n = mq_metaRspFifo_V_val_full_n;
    end else begin
        mq_metaRspFifo_V_val_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op53_write_state2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        mq_metaRspFifo_V_val_write = 1'b1;
    end else begin
        mq_metaRspFifo_V_val_write = 1'b0;
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
    ap_block_pp0_stage0_01001 = ((ap_done_reg == 1'b1) | ((io_acc_block_signal_op53 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (ap_predicate_op53_write_state2 == 1'b1)) | ((ap_start == 1'b1) & ((ap_start == 1'b0) | (ap_done_reg == 1'b1) | ((tmp_nbreadreq_fu_64_p9 == 1'd1) & (io_acc_block_signal_op5 == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_done_reg == 1'b1) | ((io_acc_block_signal_op53 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (ap_predicate_op53_write_state2 == 1'b1)) | ((ap_start == 1'b1) & ((ap_start == 1'b0) | (ap_done_reg == 1'b1) | ((tmp_nbreadreq_fu_64_p9 == 1'd1) & (io_acc_block_signal_op5 == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_done_reg == 1'b1) | ((io_acc_block_signal_op53 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (ap_predicate_op53_write_state2 == 1'b1)) | ((ap_start == 1'b1) & ((ap_start == 1'b0) | (ap_done_reg == 1'b1) | ((tmp_nbreadreq_fu_64_p9 == 1'd1) & (io_acc_block_signal_op5 == 1'b0)))));
end

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((ap_start == 1'b0) | (ap_done_reg == 1'b1) | ((tmp_nbreadreq_fu_64_p9 == 1'd1) & (io_acc_block_signal_op5 == 1'b0)));
end

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = ((io_acc_block_signal_op53 == 1'b0) & (ap_predicate_op53_write_state2 == 1'b1));
end

always @ (*) begin
    ap_condition_159 = ((tmp_nbreadreq_fu_64_p9 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start;

always @ (*) begin
    ap_predicate_op53_write_state2 = ((tmp_append_reg_277 == 1'd0) & (tmp_write_reg_273 == 1'd0) & (tmp_reg_269 == 1'd1));
end

assign io_acc_block_signal_op5 = (mq_metaReqFifo_V_wri_empty_n & mq_metaReqFifo_V_idx_empty_n & mq_metaReqFifo_V_ent_empty_n & mq_metaReqFifo_V_ent_4_empty_n & mq_metaReqFifo_V_ent_3_empty_n & mq_metaReqFifo_V_ent_1_empty_n & mq_metaReqFifo_V_app_empty_n);

assign io_acc_block_signal_op53 = (mq_metaRspFifo_V_val_full_n & mq_metaRspFifo_V_val_1_full_n & mq_metaRspFifo_V_nex_full_n & mq_metaRspFifo_V_isT_full_n);

assign meta_table_isTail_ad_1_gep_fu_182_p3 = zext_ln544_fu_255_p1;

assign meta_table_isTail_ad_gep_fu_215_p3 = zext_ln544_fu_255_p1;

assign meta_table_next_V_ad_1_gep_fu_174_p3 = zext_ln544_fu_255_p1;

assign meta_table_next_V_ad_gep_fu_199_p3 = zext_ln544_fu_255_p1;

assign meta_table_valid_add_gep_fu_207_p3 = zext_ln544_fu_255_p1;

assign meta_table_value_V_a_gep_fu_191_p3 = zext_ln544_fu_255_p1;

assign mq_metaRspFifo_V_isT_din = meta_table_isTail_q0;

assign mq_metaRspFifo_V_nex_din = meta_table_next_V_q0;

assign mq_metaRspFifo_V_val_1_din = meta_table_valid_q0;

assign mq_metaRspFifo_V_val_din = meta_table_value_V_q0;

assign tmp_append_fu_251_p1 = mq_metaReqFifo_V_app_dout;

assign tmp_nbreadreq_fu_64_p9 = (mq_metaReqFifo_V_wri_empty_n & mq_metaReqFifo_V_idx_empty_n & mq_metaReqFifo_V_ent_empty_n & mq_metaReqFifo_V_ent_4_empty_n & mq_metaReqFifo_V_ent_3_empty_n & mq_metaReqFifo_V_ent_1_empty_n & mq_metaReqFifo_V_app_empty_n);

assign tmp_write_fu_247_p1 = mq_metaReqFifo_V_wri_dout;

assign zext_ln544_fu_255_p1 = mq_metaReqFifo_V_idx_dout;

endmodule //mq_meta_table