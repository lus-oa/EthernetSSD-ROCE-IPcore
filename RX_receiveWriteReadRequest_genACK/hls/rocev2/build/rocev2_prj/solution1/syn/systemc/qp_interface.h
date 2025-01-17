// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2019.1
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

#ifndef _qp_interface_HH_
#define _qp_interface_HH_

#include "systemc.h"
#include "AESL_pkg.h"


namespace ap_rtl {

struct qp_interface : public sc_module {
    // Port declarations 19
    sc_in_clk ap_clk;
    sc_in< sc_logic > ap_rst;
    sc_in< sc_logic > ap_start;
    sc_out< sc_logic > ap_done;
    sc_in< sc_logic > ap_continue;
    sc_out< sc_logic > ap_idle;
    sc_out< sc_logic > ap_ready;
    sc_in< sc_logic > contextIn_V_TVALID;
    sc_in< sc_lv<123> > stateTable2qpi_rsp_V_dout;
    sc_in< sc_logic > stateTable2qpi_rsp_V_empty_n;
    sc_out< sc_logic > stateTable2qpi_rsp_V_read;
    sc_out< sc_lv<68> > qpi2stateTable_upd_r_1_din;
    sc_in< sc_logic > qpi2stateTable_upd_r_1_full_n;
    sc_out< sc_logic > qpi2stateTable_upd_r_1_write;
    sc_out< sc_lv<48> > if2msnTable_init_V_din;
    sc_in< sc_logic > if2msnTable_init_V_full_n;
    sc_out< sc_logic > if2msnTable_init_V_write;
    sc_in< sc_lv<144> > contextIn_V_TDATA;
    sc_out< sc_logic > contextIn_V_TREADY;


    // Module declarations
    qp_interface(sc_module_name name);
    SC_HAS_PROCESS(qp_interface);

    ~qp_interface();

    sc_trace_file* mVcdFile;

    sc_signal< sc_logic > ap_done_reg;
    sc_signal< sc_lv<1> > ap_CS_fsm;
    sc_signal< sc_logic > ap_CS_fsm_pp0_stage0;
    sc_signal< sc_logic > ap_enable_reg_pp0_iter0;
    sc_signal< sc_logic > ap_enable_reg_pp0_iter1;
    sc_signal< sc_logic > ap_idle_pp0;
    sc_signal< sc_lv<1> > tmp_36_nbreadreq_fu_96_p3;
    sc_signal< bool > ap_predicate_op7_read_state1;
    sc_signal< sc_lv<1> > tmp_nbreadreq_fu_110_p3;
    sc_signal< bool > ap_predicate_op22_read_state1;
    sc_signal< bool > ap_block_state1_pp0_stage0_iter0;
    sc_signal< sc_lv<1> > qp_fsmState_load_reg_312;
    sc_signal< sc_lv<1> > tmp_36_reg_316;
    sc_signal< bool > ap_predicate_op31_write_state2;
    sc_signal< sc_lv<1> > tmp_reg_325;
    sc_signal< bool > ap_predicate_op40_write_state2;
    sc_signal< bool > ap_predicate_op44_write_state2;
    sc_signal< bool > ap_block_state2_pp0_stage0_iter1;
    sc_signal< bool > ap_block_pp0_stage0_11001;
    sc_signal< sc_lv<1> > qp_fsmState;
    sc_signal< sc_lv<3> > context_newState;
    sc_signal< sc_lv<24> > context_qp_num_V;
    sc_signal< sc_lv<24> > context_remote_psn_V;
    sc_signal< sc_lv<24> > context_local_psn_V;
    sc_signal< sc_lv<16> > context_r_key_V;
    sc_signal< sc_logic > contextIn_V_TDATA_blk_n;
    sc_signal< bool > ap_block_pp0_stage0;
    sc_signal< sc_logic > qpi2stateTable_upd_r_1_blk_n;
    sc_signal< sc_logic > stateTable2qpi_rsp_V_blk_n;
    sc_signal< sc_logic > if2msnTable_init_V_blk_n;
    sc_signal< sc_lv<16> > tmp_qpn_V_12_reg_320;
    sc_signal< bool > ap_block_pp0_stage0_subdone;
    sc_signal< sc_lv<3> > trunc_ln109_fu_142_p1;
    sc_signal< sc_lv<68> > tmp_1_2_fu_249_p4;
    sc_signal< bool > ap_block_pp0_stage0_01001;
    sc_signal< sc_lv<68> > tmp_3_fu_280_p6;
    sc_signal< sc_lv<68> > tmp_1_fu_238_p5;
    sc_signal< sc_lv<16> > tmp_qpn_V_fu_264_p1;
    sc_signal< sc_lv<32> > tmp_30_i_fu_299_p3;
    sc_signal< sc_lv<1> > ap_NS_fsm;
    sc_signal< sc_logic > ap_idle_pp0_0to0;
    sc_signal< sc_logic > ap_reset_idle_pp0;
    sc_signal< sc_logic > ap_enable_pp0;
    sc_signal< bool > ap_condition_102;
    sc_signal< bool > ap_condition_172;
    static const sc_logic ap_const_logic_1;
    static const sc_logic ap_const_logic_0;
    static const sc_lv<1> ap_ST_fsm_pp0_stage0;
    static const sc_lv<32> ap_const_lv32_0;
    static const bool ap_const_boolean_1;
    static const sc_lv<1> ap_const_lv1_0;
    static const sc_lv<1> ap_const_lv1_1;
    static const bool ap_const_boolean_0;
    static const sc_lv<32> ap_const_lv32_3;
    static const sc_lv<32> ap_const_lv32_1A;
    static const sc_lv<32> ap_const_lv32_1B;
    static const sc_lv<32> ap_const_lv32_32;
    static const sc_lv<32> ap_const_lv32_33;
    static const sc_lv<32> ap_const_lv32_4A;
    static const sc_lv<32> ap_const_lv32_4B;
    static const sc_lv<32> ap_const_lv32_5A;
    static const sc_lv<32> ap_const_lv32_12;
    static const sc_lv<68> ap_const_lv68_0;
    static const sc_lv<32> ap_const_lv32_F;
    static const sc_lv<32> ap_const_lv32_43;
    // Thread declarations
    void thread_ap_clk_no_reset_();
    void thread_ap_CS_fsm_pp0_stage0();
    void thread_ap_block_pp0_stage0();
    void thread_ap_block_pp0_stage0_01001();
    void thread_ap_block_pp0_stage0_11001();
    void thread_ap_block_pp0_stage0_subdone();
    void thread_ap_block_state1_pp0_stage0_iter0();
    void thread_ap_block_state2_pp0_stage0_iter1();
    void thread_ap_condition_102();
    void thread_ap_condition_172();
    void thread_ap_done();
    void thread_ap_enable_pp0();
    void thread_ap_enable_reg_pp0_iter0();
    void thread_ap_idle();
    void thread_ap_idle_pp0();
    void thread_ap_idle_pp0_0to0();
    void thread_ap_predicate_op22_read_state1();
    void thread_ap_predicate_op31_write_state2();
    void thread_ap_predicate_op40_write_state2();
    void thread_ap_predicate_op44_write_state2();
    void thread_ap_predicate_op7_read_state1();
    void thread_ap_ready();
    void thread_ap_reset_idle_pp0();
    void thread_contextIn_V_TDATA_blk_n();
    void thread_contextIn_V_TREADY();
    void thread_if2msnTable_init_V_blk_n();
    void thread_if2msnTable_init_V_din();
    void thread_if2msnTable_init_V_write();
    void thread_qpi2stateTable_upd_r_1_blk_n();
    void thread_qpi2stateTable_upd_r_1_din();
    void thread_qpi2stateTable_upd_r_1_write();
    void thread_stateTable2qpi_rsp_V_blk_n();
    void thread_stateTable2qpi_rsp_V_read();
    void thread_tmp_1_2_fu_249_p4();
    void thread_tmp_1_fu_238_p5();
    void thread_tmp_30_i_fu_299_p3();
    void thread_tmp_36_nbreadreq_fu_96_p3();
    void thread_tmp_3_fu_280_p6();
    void thread_tmp_nbreadreq_fu_110_p3();
    void thread_tmp_qpn_V_fu_264_p1();
    void thread_trunc_ln109_fu_142_p1();
    void thread_ap_NS_fsm();
};

}

using namespace ap_rtl;

#endif
