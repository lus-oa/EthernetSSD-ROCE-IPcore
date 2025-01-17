// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2019.1
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

#ifndef _udp_rshiftWordByOcte_HH_
#define _udp_rshiftWordByOcte_HH_

#include "systemc.h"
#include "AESL_pkg.h"


namespace ap_rtl {

struct udp_rshiftWordByOcte : public sc_module {
    // Port declarations 25
    sc_in_clk ap_clk;
    sc_in< sc_logic > ap_rst;
    sc_in< sc_logic > ap_start;
    sc_out< sc_logic > ap_done;
    sc_in< sc_logic > ap_continue;
    sc_out< sc_logic > ap_idle;
    sc_out< sc_logic > ap_ready;
    sc_in< sc_lv<512> > rx_udp2shiftFifo_V_d_dout;
    sc_in< sc_logic > rx_udp2shiftFifo_V_d_empty_n;
    sc_out< sc_logic > rx_udp2shiftFifo_V_d_read;
    sc_in< sc_lv<64> > rx_udp2shiftFifo_V_k_dout;
    sc_in< sc_logic > rx_udp2shiftFifo_V_k_empty_n;
    sc_out< sc_logic > rx_udp2shiftFifo_V_k_read;
    sc_in< sc_lv<1> > rx_udp2shiftFifo_V_l_dout;
    sc_in< sc_logic > rx_udp2shiftFifo_V_l_empty_n;
    sc_out< sc_logic > rx_udp2shiftFifo_V_l_read;
    sc_out< sc_lv<512> > rx_udp2ibFifo_V_data_din;
    sc_in< sc_logic > rx_udp2ibFifo_V_data_full_n;
    sc_out< sc_logic > rx_udp2ibFifo_V_data_write;
    sc_out< sc_lv<64> > rx_udp2ibFifo_V_keep_din;
    sc_in< sc_logic > rx_udp2ibFifo_V_keep_full_n;
    sc_out< sc_logic > rx_udp2ibFifo_V_keep_write;
    sc_out< sc_lv<1> > rx_udp2ibFifo_V_last_din;
    sc_in< sc_logic > rx_udp2ibFifo_V_last_full_n;
    sc_out< sc_logic > rx_udp2ibFifo_V_last_write;


    // Module declarations
    udp_rshiftWordByOcte(sc_module_name name);
    SC_HAS_PROCESS(udp_rshiftWordByOcte);

    ~udp_rshiftWordByOcte();

    sc_trace_file* mVcdFile;

    sc_signal< sc_logic > ap_done_reg;
    sc_signal< sc_lv<1> > ap_CS_fsm;
    sc_signal< sc_logic > ap_CS_fsm_pp0_stage0;
    sc_signal< sc_logic > ap_enable_reg_pp0_iter0;
    sc_signal< sc_logic > ap_enable_reg_pp0_iter1;
    sc_signal< sc_logic > ap_idle_pp0;
    sc_signal< sc_logic > io_acc_block_signal_op7;
    sc_signal< sc_lv<1> > fsmState_load_load_fu_146_p1;
    sc_signal< sc_lv<1> > tmp_nbreadreq_fu_70_p5;
    sc_signal< bool > ap_predicate_op7_read_state1;
    sc_signal< bool > ap_block_state1_pp0_stage0_iter0;
    sc_signal< sc_logic > io_acc_block_signal_op39;
    sc_signal< sc_lv<1> > fsmState_load_reg_263;
    sc_signal< sc_lv<1> > tmp_reg_267;
    sc_signal< sc_lv<1> > rs_firstWord_load_reg_287;
    sc_signal< bool > ap_predicate_op39_write_state2;
    sc_signal< sc_logic > io_acc_block_signal_op49;
    sc_signal< bool > ap_block_state2_pp0_stage0_iter1;
    sc_signal< bool > ap_block_pp0_stage0_11001;
    sc_signal< sc_lv<1> > fsmState;
    sc_signal< sc_lv<512> > prevWord_data_V_14;
    sc_signal< sc_lv<64> > prevWord_keep_V_15;
    sc_signal< sc_lv<1> > rs_firstWord;
    sc_signal< sc_logic > rx_udp2shiftFifo_V_d_blk_n;
    sc_signal< bool > ap_block_pp0_stage0;
    sc_signal< sc_logic > rx_udp2shiftFifo_V_k_blk_n;
    sc_signal< sc_logic > rx_udp2shiftFifo_V_l_blk_n;
    sc_signal< sc_logic > rx_udp2ibFifo_V_data_blk_n;
    sc_signal< sc_logic > rx_udp2ibFifo_V_keep_blk_n;
    sc_signal< sc_logic > rx_udp2ibFifo_V_last_blk_n;
    sc_signal< sc_lv<512> > tmp_data_V_3_reg_271;
    sc_signal< sc_lv<64> > tmp_keep_V_3_reg_277;
    sc_signal< sc_lv<1> > tmp_last_V_fu_158_p1;
    sc_signal< sc_lv<1> > rs_firstWord_load_load_fu_162_p1;
    sc_signal< sc_lv<1> > tmp_last_V_1_fu_176_p2;
    sc_signal< sc_lv<1> > tmp_last_V_1_reg_291;
    sc_signal< bool > ap_block_pp0_stage0_subdone;
    sc_signal< sc_lv<1> > ap_phi_mux_p_0256_2_0_i_phi_fu_109_p4;
    sc_signal< sc_lv<1> > ap_phi_reg_pp0_iter0_p_0256_2_0_i_reg_106;
    sc_signal< sc_lv<1> > ap_phi_mux_rs_firstWord_new_0_i_phi_fu_120_p4;
    sc_signal< sc_lv<1> > ap_phi_reg_pp0_iter0_rs_firstWord_new_0_i_reg_117;
    sc_signal< sc_lv<512> > p_Result_s_fu_214_p3;
    sc_signal< bool > ap_block_pp0_stage0_01001;
    sc_signal< sc_lv<512> > p_Result_2_fu_245_p3;
    sc_signal< sc_lv<64> > p_Result_1_fu_226_p3;
    sc_signal< sc_lv<64> > p_Result_3_fu_254_p3;
    sc_signal< sc_lv<56> > p_Result_9_i_fu_166_p4;
    sc_signal< sc_lv<64> > trunc_ln647_fu_211_p1;
    sc_signal< sc_lv<448> > grp_fu_128_p4;
    sc_signal< sc_lv<8> > trunc_ln647_1_fu_223_p1;
    sc_signal< sc_lv<56> > grp_fu_137_p4;
    sc_signal< sc_lv<1> > ap_NS_fsm;
    sc_signal< sc_logic > ap_idle_pp0_0to0;
    sc_signal< sc_logic > ap_reset_idle_pp0;
    sc_signal< sc_logic > ap_enable_pp0;
    sc_signal< bool > ap_condition_183;
    sc_signal< bool > ap_condition_170;
    sc_signal< bool > ap_condition_103;
    sc_signal< bool > ap_condition_193;
    static const sc_logic ap_const_logic_1;
    static const sc_logic ap_const_logic_0;
    static const sc_lv<1> ap_ST_fsm_pp0_stage0;
    static const sc_lv<32> ap_const_lv32_0;
    static const bool ap_const_boolean_1;
    static const sc_lv<1> ap_const_lv1_0;
    static const sc_lv<1> ap_const_lv1_1;
    static const bool ap_const_boolean_0;
    static const sc_lv<64> ap_const_lv64_0;
    static const sc_lv<32> ap_const_lv32_40;
    static const sc_lv<32> ap_const_lv32_1FF;
    static const sc_lv<32> ap_const_lv32_8;
    static const sc_lv<32> ap_const_lv32_3F;
    static const sc_lv<56> ap_const_lv56_0;
    static const sc_lv<8> ap_const_lv8_0;
    // Thread declarations
    void thread_ap_clk_no_reset_();
    void thread_ap_CS_fsm_pp0_stage0();
    void thread_ap_block_pp0_stage0();
    void thread_ap_block_pp0_stage0_01001();
    void thread_ap_block_pp0_stage0_11001();
    void thread_ap_block_pp0_stage0_subdone();
    void thread_ap_block_state1_pp0_stage0_iter0();
    void thread_ap_block_state2_pp0_stage0_iter1();
    void thread_ap_condition_103();
    void thread_ap_condition_170();
    void thread_ap_condition_183();
    void thread_ap_condition_193();
    void thread_ap_done();
    void thread_ap_enable_pp0();
    void thread_ap_enable_reg_pp0_iter0();
    void thread_ap_idle();
    void thread_ap_idle_pp0();
    void thread_ap_idle_pp0_0to0();
    void thread_ap_phi_mux_p_0256_2_0_i_phi_fu_109_p4();
    void thread_ap_phi_mux_rs_firstWord_new_0_i_phi_fu_120_p4();
    void thread_ap_phi_reg_pp0_iter0_p_0256_2_0_i_reg_106();
    void thread_ap_phi_reg_pp0_iter0_rs_firstWord_new_0_i_reg_117();
    void thread_ap_predicate_op39_write_state2();
    void thread_ap_predicate_op7_read_state1();
    void thread_ap_ready();
    void thread_ap_reset_idle_pp0();
    void thread_fsmState_load_load_fu_146_p1();
    void thread_grp_fu_128_p4();
    void thread_grp_fu_137_p4();
    void thread_io_acc_block_signal_op39();
    void thread_io_acc_block_signal_op49();
    void thread_io_acc_block_signal_op7();
    void thread_p_Result_1_fu_226_p3();
    void thread_p_Result_2_fu_245_p3();
    void thread_p_Result_3_fu_254_p3();
    void thread_p_Result_9_i_fu_166_p4();
    void thread_p_Result_s_fu_214_p3();
    void thread_rs_firstWord_load_load_fu_162_p1();
    void thread_rx_udp2ibFifo_V_data_blk_n();
    void thread_rx_udp2ibFifo_V_data_din();
    void thread_rx_udp2ibFifo_V_data_write();
    void thread_rx_udp2ibFifo_V_keep_blk_n();
    void thread_rx_udp2ibFifo_V_keep_din();
    void thread_rx_udp2ibFifo_V_keep_write();
    void thread_rx_udp2ibFifo_V_last_blk_n();
    void thread_rx_udp2ibFifo_V_last_din();
    void thread_rx_udp2ibFifo_V_last_write();
    void thread_rx_udp2shiftFifo_V_d_blk_n();
    void thread_rx_udp2shiftFifo_V_d_read();
    void thread_rx_udp2shiftFifo_V_k_blk_n();
    void thread_rx_udp2shiftFifo_V_k_read();
    void thread_rx_udp2shiftFifo_V_l_blk_n();
    void thread_rx_udp2shiftFifo_V_l_read();
    void thread_tmp_last_V_1_fu_176_p2();
    void thread_tmp_last_V_fu_158_p1();
    void thread_tmp_nbreadreq_fu_70_p5();
    void thread_trunc_ln647_1_fu_223_p1();
    void thread_trunc_ln647_fu_211_p1();
    void thread_ap_NS_fsm();
};

}

using namespace ap_rtl;

#endif
