// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2019.1
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

#ifndef _stream_merger_HH_
#define _stream_merger_HH_

#include "systemc.h"
#include "AESL_pkg.h"


namespace ap_rtl {

struct stream_merger : public sc_module {
    // Port declarations 16
    sc_in_clk ap_clk;
    sc_in< sc_logic > ap_rst;
    sc_in< sc_logic > ap_start;
    sc_out< sc_logic > ap_done;
    sc_in< sc_logic > ap_continue;
    sc_out< sc_logic > ap_idle;
    sc_out< sc_logic > ap_ready;
    sc_in< sc_lv<50> > rx_exhEventMetaFifo_s_12_dout;
    sc_in< sc_logic > rx_exhEventMetaFifo_s_12_empty_n;
    sc_out< sc_logic > rx_exhEventMetaFifo_s_12_read;
    sc_in< sc_lv<50> > rx_ibhEventFifo_V_dout;
    sc_in< sc_logic > rx_ibhEventFifo_V_empty_n;
    sc_out< sc_logic > rx_ibhEventFifo_V_read;
    sc_out< sc_lv<50> > rx_ackEventFifo_V_din;
    sc_in< sc_logic > rx_ackEventFifo_V_full_n;
    sc_out< sc_logic > rx_ackEventFifo_V_write;


    // Module declarations
    stream_merger(sc_module_name name);
    SC_HAS_PROCESS(stream_merger);

    ~stream_merger();

    sc_trace_file* mVcdFile;

    sc_signal< sc_logic > ap_done_reg;
    sc_signal< sc_lv<1> > ap_CS_fsm;
    sc_signal< sc_logic > ap_CS_fsm_pp0_stage0;
    sc_signal< sc_logic > ap_enable_reg_pp0_iter0;
    sc_signal< sc_logic > ap_enable_reg_pp0_iter1;
    sc_signal< sc_logic > ap_enable_reg_pp0_iter2;
    sc_signal< sc_logic > ap_idle_pp0;
    sc_signal< sc_lv<1> > tmp_nbreadreq_fu_30_p3;
    sc_signal< bool > ap_block_state1_pp0_stage0_iter0;
    sc_signal< sc_lv<1> > tmp_reg_65;
    sc_signal< sc_lv<1> > tmp_8_nbreadreq_fu_44_p3;
    sc_signal< bool > ap_predicate_op9_read_state2;
    sc_signal< bool > ap_block_state2_pp0_stage0_iter1;
    sc_signal< sc_lv<1> > tmp_reg_65_pp0_iter1_reg;
    sc_signal< sc_lv<1> > tmp_8_reg_74;
    sc_signal< bool > ap_predicate_op14_write_state3;
    sc_signal< bool > ap_block_state3_pp0_stage0_iter2;
    sc_signal< bool > ap_block_pp0_stage0_11001;
    sc_signal< sc_logic > rx_exhEventMetaFifo_s_12_blk_n;
    sc_signal< bool > ap_block_pp0_stage0;
    sc_signal< sc_logic > rx_ackEventFifo_V_blk_n;
    sc_signal< sc_logic > rx_ibhEventFifo_V_blk_n;
    sc_signal< sc_lv<50> > tmp56_reg_69;
    sc_signal< sc_lv<50> > tmp56_reg_69_pp0_iter1_reg;
    sc_signal< sc_lv<50> > tmp_2_reg_78;
    sc_signal< bool > ap_block_pp0_stage0_subdone;
    sc_signal< bool > ap_block_pp0_stage0_01001;
    sc_signal< sc_lv<1> > ap_NS_fsm;
    sc_signal< sc_logic > ap_idle_pp0_0to1;
    sc_signal< sc_logic > ap_reset_idle_pp0;
    sc_signal< sc_logic > ap_enable_pp0;
    static const sc_logic ap_const_logic_1;
    static const sc_logic ap_const_logic_0;
    static const sc_lv<1> ap_ST_fsm_pp0_stage0;
    static const sc_lv<32> ap_const_lv32_0;
    static const bool ap_const_boolean_1;
    static const sc_lv<1> ap_const_lv1_1;
    static const sc_lv<1> ap_const_lv1_0;
    static const bool ap_const_boolean_0;
    // Thread declarations
    void thread_ap_clk_no_reset_();
    void thread_ap_CS_fsm_pp0_stage0();
    void thread_ap_block_pp0_stage0();
    void thread_ap_block_pp0_stage0_01001();
    void thread_ap_block_pp0_stage0_11001();
    void thread_ap_block_pp0_stage0_subdone();
    void thread_ap_block_state1_pp0_stage0_iter0();
    void thread_ap_block_state2_pp0_stage0_iter1();
    void thread_ap_block_state3_pp0_stage0_iter2();
    void thread_ap_done();
    void thread_ap_enable_pp0();
    void thread_ap_enable_reg_pp0_iter0();
    void thread_ap_idle();
    void thread_ap_idle_pp0();
    void thread_ap_idle_pp0_0to1();
    void thread_ap_predicate_op14_write_state3();
    void thread_ap_predicate_op9_read_state2();
    void thread_ap_ready();
    void thread_ap_reset_idle_pp0();
    void thread_rx_ackEventFifo_V_blk_n();
    void thread_rx_ackEventFifo_V_din();
    void thread_rx_ackEventFifo_V_write();
    void thread_rx_exhEventMetaFifo_s_12_blk_n();
    void thread_rx_exhEventMetaFifo_s_12_read();
    void thread_rx_ibhEventFifo_V_blk_n();
    void thread_rx_ibhEventFifo_V_read();
    void thread_tmp_8_nbreadreq_fu_44_p3();
    void thread_tmp_nbreadreq_fu_30_p3();
    void thread_ap_NS_fsm();
};

}

using namespace ap_rtl;

#endif