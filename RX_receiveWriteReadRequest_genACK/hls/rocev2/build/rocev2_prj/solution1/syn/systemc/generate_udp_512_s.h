// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2019.1
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

#ifndef _generate_udp_512_s_HH_
#define _generate_udp_512_s_HH_

#include "systemc.h"
#include "AESL_pkg.h"


namespace ap_rtl {

struct generate_udp_512_s : public sc_module {
    // Port declarations 37
    sc_in_clk ap_clk;
    sc_in< sc_logic > ap_rst;
    sc_in< sc_logic > ap_start;
    sc_out< sc_logic > ap_done;
    sc_in< sc_logic > ap_continue;
    sc_out< sc_logic > ap_idle;
    sc_out< sc_logic > ap_ready;
    sc_in< sc_lv<512> > tx_shift2udpFifo_V_d_dout;
    sc_in< sc_logic > tx_shift2udpFifo_V_d_empty_n;
    sc_out< sc_logic > tx_shift2udpFifo_V_d_read;
    sc_in< sc_lv<64> > tx_shift2udpFifo_V_k_dout;
    sc_in< sc_logic > tx_shift2udpFifo_V_k_empty_n;
    sc_out< sc_logic > tx_shift2udpFifo_V_k_read;
    sc_in< sc_lv<1> > tx_shift2udpFifo_V_l_dout;
    sc_in< sc_logic > tx_shift2udpFifo_V_l_empty_n;
    sc_out< sc_logic > tx_shift2udpFifo_V_l_read;
    sc_in< sc_lv<16> > tx_udpMetaFifo_V_the_dout;
    sc_in< sc_logic > tx_udpMetaFifo_V_the_empty_n;
    sc_out< sc_logic > tx_udpMetaFifo_V_the_read;
    sc_in< sc_lv<16> > tx_udpMetaFifo_V_my_s_dout;
    sc_in< sc_logic > tx_udpMetaFifo_V_my_s_empty_n;
    sc_out< sc_logic > tx_udpMetaFifo_V_my_s_read;
    sc_in< sc_lv<16> > tx_udpMetaFifo_V_len_dout;
    sc_in< sc_logic > tx_udpMetaFifo_V_len_empty_n;
    sc_out< sc_logic > tx_udpMetaFifo_V_len_read;
    sc_in< sc_lv<1> > tx_udpMetaFifo_V_val_dout;
    sc_in< sc_logic > tx_udpMetaFifo_V_val_empty_n;
    sc_out< sc_logic > tx_udpMetaFifo_V_val_read;
    sc_out< sc_lv<512> > tx_udp2ipFifo_V_data_din;
    sc_in< sc_logic > tx_udp2ipFifo_V_data_full_n;
    sc_out< sc_logic > tx_udp2ipFifo_V_data_write;
    sc_out< sc_lv<64> > tx_udp2ipFifo_V_keep_din;
    sc_in< sc_logic > tx_udp2ipFifo_V_keep_full_n;
    sc_out< sc_logic > tx_udp2ipFifo_V_keep_write;
    sc_out< sc_lv<1> > tx_udp2ipFifo_V_last_din;
    sc_in< sc_logic > tx_udp2ipFifo_V_last_full_n;
    sc_out< sc_logic > tx_udp2ipFifo_V_last_write;


    // Module declarations
    generate_udp_512_s(sc_module_name name);
    SC_HAS_PROCESS(generate_udp_512_s);

    ~generate_udp_512_s();

    sc_trace_file* mVcdFile;

    sc_signal< sc_logic > ap_done_reg;
    sc_signal< sc_lv<1> > ap_CS_fsm;
    sc_signal< sc_logic > ap_CS_fsm_pp0_stage0;
    sc_signal< sc_logic > ap_enable_reg_pp0_iter0;
    sc_signal< sc_logic > ap_enable_reg_pp0_iter1;
    sc_signal< sc_logic > ap_idle_pp0;
    sc_signal< sc_logic > io_acc_block_signal_op6;
    sc_signal< sc_lv<1> > grp_nbreadreq_fu_100_p5;
    sc_signal< bool > ap_predicate_op6_read_state1;
    sc_signal< sc_logic > io_acc_block_signal_op14;
    sc_signal< bool > ap_predicate_op14_read_state1;
    sc_signal< sc_logic > io_acc_block_signal_op21;
    sc_signal< sc_lv<1> > tmp_nbreadreq_fu_122_p6;
    sc_signal< bool > ap_predicate_op21_read_state1;
    sc_signal< bool > ap_block_state1_pp0_stage0_iter0;
    sc_signal< sc_logic > io_acc_block_signal_op71;
    sc_signal< sc_lv<2> > state_4_load_reg_476;
    sc_signal< sc_lv<1> > tmp_86_reg_480;
    sc_signal< bool > ap_predicate_op71_write_state2;
    sc_signal< sc_logic > io_acc_block_signal_op75;
    sc_signal< sc_lv<1> > tmp_85_reg_489;
    sc_signal< bool > ap_predicate_op75_write_state2;
    sc_signal< bool > ap_block_state2_pp0_stage0_iter1;
    sc_signal< bool > ap_block_pp0_stage0_11001;
    sc_signal< sc_lv<2> > state_4;
    sc_signal< sc_lv<16> > header_idx_5;
    sc_signal< sc_lv<64> > header_header_V_7;
    sc_signal< sc_logic > tx_udpMetaFifo_V_the_blk_n;
    sc_signal< bool > ap_block_pp0_stage0;
    sc_signal< sc_logic > tx_udpMetaFifo_V_my_s_blk_n;
    sc_signal< sc_logic > tx_udpMetaFifo_V_len_blk_n;
    sc_signal< sc_logic > tx_udpMetaFifo_V_val_blk_n;
    sc_signal< sc_logic > tx_shift2udpFifo_V_d_blk_n;
    sc_signal< sc_logic > tx_shift2udpFifo_V_k_blk_n;
    sc_signal< sc_logic > tx_shift2udpFifo_V_l_blk_n;
    sc_signal< sc_logic > tx_udp2ipFifo_V_data_blk_n;
    sc_signal< sc_logic > tx_udp2ipFifo_V_keep_blk_n;
    sc_signal< sc_logic > tx_udp2ipFifo_V_last_blk_n;
    sc_signal< sc_lv<512> > reg_173;
    sc_signal< sc_lv<64> > reg_178;
    sc_signal< sc_lv<1> > grp_fu_169_p1;
    sc_signal< sc_lv<1> > tmp_last_V_41_reg_484;
    sc_signal< sc_lv<1> > tmp_last_V_reg_493;
    sc_signal< sc_lv<1> > tmp_reg_498;
    sc_signal< bool > ap_block_pp0_stage0_subdone;
    sc_signal< sc_lv<2> > select_ln145_fu_193_p3;
    sc_signal< sc_lv<16> > select_ln84_fu_447_p3;
    sc_signal< sc_lv<64> > p_Result_s_fu_319_p5;
    sc_signal< sc_lv<512> > currWord_data_V_1_fu_455_p3;
    sc_signal< bool > ap_block_pp0_stage0_01001;
    sc_signal< sc_lv<1> > xor_ln145_fu_187_p2;
    sc_signal< sc_lv<8> > trunc_ln647_fu_235_p1;
    sc_signal< sc_lv<8> > p_Result_128_i_i_i_fu_225_p4;
    sc_signal< sc_lv<16> > agg_result_V_0_1_i_i_fu_239_p3;
    sc_signal< sc_lv<8> > trunc_ln647_16_fu_273_p1;
    sc_signal< sc_lv<8> > p_Result_128_i_i_fu_263_p4;
    sc_signal< sc_lv<64> > p_Result_78_fu_251_p5;
    sc_signal< sc_lv<16> > agg_result_V_0_1_i_i_1_fu_277_p3;
    sc_signal< sc_lv<8> > trunc_ln647_17_fu_307_p1;
    sc_signal< sc_lv<8> > p_Result_128_i_i2_fu_297_p4;
    sc_signal< sc_lv<64> > p_Result_79_fu_285_p5;
    sc_signal< sc_lv<16> > agg_result_V_0_1_i_i_2_fu_311_p3;
    sc_signal< sc_lv<19> > tmp_87_fu_351_p3;
    sc_signal< sc_lv<19> > tmp_88_fu_365_p3;
    sc_signal< sc_lv<26> > zext_ln647_fu_373_p1;
    sc_signal< sc_lv<1> > icmp_ln647_fu_377_p2;
    sc_signal< sc_lv<1> > trunc_ln647_18_fu_383_p1;
    sc_signal< sc_lv<1> > tmp_89_fu_387_p3;
    sc_signal< sc_lv<1> > select_ln647_fu_395_p3;
    sc_signal< sc_lv<64> > zext_ln647_1_fu_403_p1;
    sc_signal< sc_lv<64> > select_ln647_5_fu_407_p3;
    sc_signal< sc_lv<64> > select_ln647_6_fu_415_p3;
    sc_signal< sc_lv<64> > p_Result_80_fu_423_p2;
    sc_signal< sc_lv<1> > icmp_ln84_fu_359_p2;
    sc_signal< sc_lv<16> > add_ln87_fu_441_p2;
    sc_signal< sc_lv<512> > p_Result_77_fu_429_p5;
    sc_signal< sc_lv<1> > ap_NS_fsm;
    sc_signal< sc_logic > ap_idle_pp0_0to0;
    sc_signal< sc_logic > ap_reset_idle_pp0;
    sc_signal< sc_logic > ap_enable_pp0;
    sc_signal< bool > ap_condition_201;
    sc_signal< bool > ap_condition_196;
    sc_signal< bool > ap_condition_142;
    sc_signal< bool > ap_condition_233;
    static const sc_logic ap_const_logic_1;
    static const sc_logic ap_const_logic_0;
    static const sc_lv<1> ap_ST_fsm_pp0_stage0;
    static const sc_lv<32> ap_const_lv32_0;
    static const bool ap_const_boolean_1;
    static const sc_lv<2> ap_const_lv2_2;
    static const sc_lv<1> ap_const_lv1_1;
    static const sc_lv<2> ap_const_lv2_3;
    static const sc_lv<2> ap_const_lv2_0;
    static const bool ap_const_boolean_0;
    static const sc_lv<16> ap_const_lv16_0;
    static const sc_lv<64> ap_const_lv64_0;
    static const sc_lv<32> ap_const_lv32_8;
    static const sc_lv<32> ap_const_lv32_F;
    static const sc_lv<32> ap_const_lv32_10;
    static const sc_lv<32> ap_const_lv32_1F;
    static const sc_lv<32> ap_const_lv32_20;
    static const sc_lv<32> ap_const_lv32_2F;
    static const sc_lv<3> ap_const_lv3_0;
    static const sc_lv<19> ap_const_lv19_0;
    static const sc_lv<26> ap_const_lv26_0;
    static const sc_lv<32> ap_const_lv32_3F;
    static const sc_lv<64> ap_const_lv64_FFFFFFFFFFFFFFFF;
    static const sc_lv<16> ap_const_lv16_1;
    // Thread declarations
    void thread_ap_clk_no_reset_();
    void thread_add_ln87_fu_441_p2();
    void thread_agg_result_V_0_1_i_i_1_fu_277_p3();
    void thread_agg_result_V_0_1_i_i_2_fu_311_p3();
    void thread_agg_result_V_0_1_i_i_fu_239_p3();
    void thread_ap_CS_fsm_pp0_stage0();
    void thread_ap_block_pp0_stage0();
    void thread_ap_block_pp0_stage0_01001();
    void thread_ap_block_pp0_stage0_11001();
    void thread_ap_block_pp0_stage0_subdone();
    void thread_ap_block_state1_pp0_stage0_iter0();
    void thread_ap_block_state2_pp0_stage0_iter1();
    void thread_ap_condition_142();
    void thread_ap_condition_196();
    void thread_ap_condition_201();
    void thread_ap_condition_233();
    void thread_ap_done();
    void thread_ap_enable_pp0();
    void thread_ap_enable_reg_pp0_iter0();
    void thread_ap_idle();
    void thread_ap_idle_pp0();
    void thread_ap_idle_pp0_0to0();
    void thread_ap_predicate_op14_read_state1();
    void thread_ap_predicate_op21_read_state1();
    void thread_ap_predicate_op6_read_state1();
    void thread_ap_predicate_op71_write_state2();
    void thread_ap_predicate_op75_write_state2();
    void thread_ap_ready();
    void thread_ap_reset_idle_pp0();
    void thread_currWord_data_V_1_fu_455_p3();
    void thread_grp_fu_169_p1();
    void thread_grp_nbreadreq_fu_100_p5();
    void thread_icmp_ln647_fu_377_p2();
    void thread_icmp_ln84_fu_359_p2();
    void thread_io_acc_block_signal_op14();
    void thread_io_acc_block_signal_op21();
    void thread_io_acc_block_signal_op6();
    void thread_io_acc_block_signal_op71();
    void thread_io_acc_block_signal_op75();
    void thread_p_Result_128_i_i2_fu_297_p4();
    void thread_p_Result_128_i_i_fu_263_p4();
    void thread_p_Result_128_i_i_i_fu_225_p4();
    void thread_p_Result_77_fu_429_p5();
    void thread_p_Result_78_fu_251_p5();
    void thread_p_Result_79_fu_285_p5();
    void thread_p_Result_80_fu_423_p2();
    void thread_p_Result_s_fu_319_p5();
    void thread_select_ln145_fu_193_p3();
    void thread_select_ln647_5_fu_407_p3();
    void thread_select_ln647_6_fu_415_p3();
    void thread_select_ln647_fu_395_p3();
    void thread_select_ln84_fu_447_p3();
    void thread_tmp_87_fu_351_p3();
    void thread_tmp_88_fu_365_p3();
    void thread_tmp_89_fu_387_p3();
    void thread_tmp_nbreadreq_fu_122_p6();
    void thread_trunc_ln647_16_fu_273_p1();
    void thread_trunc_ln647_17_fu_307_p1();
    void thread_trunc_ln647_18_fu_383_p1();
    void thread_trunc_ln647_fu_235_p1();
    void thread_tx_shift2udpFifo_V_d_blk_n();
    void thread_tx_shift2udpFifo_V_d_read();
    void thread_tx_shift2udpFifo_V_k_blk_n();
    void thread_tx_shift2udpFifo_V_k_read();
    void thread_tx_shift2udpFifo_V_l_blk_n();
    void thread_tx_shift2udpFifo_V_l_read();
    void thread_tx_udp2ipFifo_V_data_blk_n();
    void thread_tx_udp2ipFifo_V_data_din();
    void thread_tx_udp2ipFifo_V_data_write();
    void thread_tx_udp2ipFifo_V_keep_blk_n();
    void thread_tx_udp2ipFifo_V_keep_din();
    void thread_tx_udp2ipFifo_V_keep_write();
    void thread_tx_udp2ipFifo_V_last_blk_n();
    void thread_tx_udp2ipFifo_V_last_din();
    void thread_tx_udp2ipFifo_V_last_write();
    void thread_tx_udpMetaFifo_V_len_blk_n();
    void thread_tx_udpMetaFifo_V_len_read();
    void thread_tx_udpMetaFifo_V_my_s_blk_n();
    void thread_tx_udpMetaFifo_V_my_s_read();
    void thread_tx_udpMetaFifo_V_the_blk_n();
    void thread_tx_udpMetaFifo_V_the_read();
    void thread_tx_udpMetaFifo_V_val_blk_n();
    void thread_tx_udpMetaFifo_V_val_read();
    void thread_xor_ln145_fu_187_p2();
    void thread_zext_ln647_1_fu_403_p1();
    void thread_zext_ln647_fu_373_p1();
    void thread_ap_NS_fsm();
};

}

using namespace ap_rtl;

#endif