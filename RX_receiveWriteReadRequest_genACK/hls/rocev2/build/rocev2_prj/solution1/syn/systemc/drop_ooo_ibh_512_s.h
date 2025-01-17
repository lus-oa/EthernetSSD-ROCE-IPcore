// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2019.1
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

#ifndef _drop_ooo_ibh_512_s_HH_
#define _drop_ooo_ibh_512_s_HH_

#include "systemc.h"
#include "AESL_pkg.h"


namespace ap_rtl {

struct drop_ooo_ibh_512_s : public sc_module {
    // Port declarations 28
    sc_in_clk ap_clk;
    sc_in< sc_logic > ap_rst;
    sc_in< sc_logic > ap_start;
    sc_out< sc_logic > ap_done;
    sc_in< sc_logic > ap_continue;
    sc_out< sc_logic > ap_idle;
    sc_out< sc_logic > ap_ready;
    sc_in< sc_lv<512> > rx_exh2dropFifo_V_da_dout;
    sc_in< sc_logic > rx_exh2dropFifo_V_da_empty_n;
    sc_out< sc_logic > rx_exh2dropFifo_V_da_read;
    sc_in< sc_lv<64> > rx_exh2dropFifo_V_ke_dout;
    sc_in< sc_logic > rx_exh2dropFifo_V_ke_empty_n;
    sc_out< sc_logic > rx_exh2dropFifo_V_ke_read;
    sc_in< sc_lv<1> > rx_exh2dropFifo_V_la_dout;
    sc_in< sc_logic > rx_exh2dropFifo_V_la_empty_n;
    sc_out< sc_logic > rx_exh2dropFifo_V_la_read;
    sc_in< sc_lv<1> > rx_ibhDropFifo_V_dout;
    sc_in< sc_logic > rx_ibhDropFifo_V_empty_n;
    sc_out< sc_logic > rx_ibhDropFifo_V_read;
    sc_out< sc_lv<512> > rx_ibhDrop2exhFifo_V_1_din;
    sc_in< sc_logic > rx_ibhDrop2exhFifo_V_1_full_n;
    sc_out< sc_logic > rx_ibhDrop2exhFifo_V_1_write;
    sc_out< sc_lv<64> > rx_ibhDrop2exhFifo_V_2_din;
    sc_in< sc_logic > rx_ibhDrop2exhFifo_V_2_full_n;
    sc_out< sc_logic > rx_ibhDrop2exhFifo_V_2_write;
    sc_out< sc_lv<1> > rx_ibhDrop2exhFifo_V_din;
    sc_in< sc_logic > rx_ibhDrop2exhFifo_V_full_n;
    sc_out< sc_logic > rx_ibhDrop2exhFifo_V_write;


    // Module declarations
    drop_ooo_ibh_512_s(sc_module_name name);
    SC_HAS_PROCESS(drop_ooo_ibh_512_s);

    ~drop_ooo_ibh_512_s();

    sc_trace_file* mVcdFile;

    sc_signal< sc_logic > ap_done_reg;
    sc_signal< sc_lv<1> > ap_CS_fsm;
    sc_signal< sc_logic > ap_CS_fsm_pp0_stage0;
    sc_signal< sc_logic > ap_enable_reg_pp0_iter0;
    sc_signal< sc_logic > ap_enable_reg_pp0_iter1;
    sc_signal< sc_logic > ap_idle_pp0;
    sc_signal< sc_logic > io_acc_block_signal_op6;
    sc_signal< sc_lv<1> > grp_nbreadreq_fu_50_p5;
    sc_signal< bool > ap_predicate_op6_read_state1;
    sc_signal< sc_logic > io_acc_block_signal_op11;
    sc_signal< bool > ap_predicate_op11_read_state1;
    sc_signal< sc_lv<1> > tmp_nbreadreq_fu_72_p3;
    sc_signal< bool > ap_predicate_op18_read_state1;
    sc_signal< bool > ap_block_state1_pp0_stage0_iter0;
    sc_signal< sc_logic > io_acc_block_signal_op34;
    sc_signal< sc_lv<2> > state_5_load_reg_135;
    sc_signal< sc_lv<1> > tmp_107_reg_147;
    sc_signal< bool > ap_predicate_op34_write_state2;
    sc_signal< bool > ap_block_state2_pp0_stage0_iter1;
    sc_signal< bool > ap_block_pp0_stage0_11001;
    sc_signal< sc_lv<2> > state_5;
    sc_signal< sc_logic > rx_ibhDropFifo_V_blk_n;
    sc_signal< bool > ap_block_pp0_stage0;
    sc_signal< sc_logic > rx_exh2dropFifo_V_da_blk_n;
    sc_signal< sc_logic > rx_exh2dropFifo_V_ke_blk_n;
    sc_signal< sc_logic > rx_exh2dropFifo_V_la_blk_n;
    sc_signal< sc_logic > rx_ibhDrop2exhFifo_V_1_blk_n;
    sc_signal< sc_logic > rx_ibhDrop2exhFifo_V_2_blk_n;
    sc_signal< sc_logic > rx_ibhDrop2exhFifo_V_blk_n;
    sc_signal< sc_lv<1> > grp_fu_99_p1;
    sc_signal< sc_lv<512> > tmp_data_V_reg_151;
    sc_signal< sc_lv<64> > tmp_keep_V_reg_156;
    sc_signal< sc_lv<1> > tmp_last_V_reg_161;
    sc_signal< bool > ap_block_pp0_stage0_subdone;
    sc_signal< sc_lv<2> > select_ln600_fu_121_p3;
    sc_signal< bool > ap_block_pp0_stage0_01001;
    sc_signal< sc_lv<1> > ap_NS_fsm;
    sc_signal< sc_logic > ap_idle_pp0_0to0;
    sc_signal< sc_logic > ap_reset_idle_pp0;
    sc_signal< sc_logic > ap_enable_pp0;
    static const sc_logic ap_const_logic_1;
    static const sc_logic ap_const_logic_0;
    static const sc_lv<1> ap_ST_fsm_pp0_stage0;
    static const sc_lv<32> ap_const_lv32_0;
    static const bool ap_const_boolean_1;
    static const sc_lv<2> ap_const_lv2_2;
    static const sc_lv<1> ap_const_lv1_1;
    static const sc_lv<2> ap_const_lv2_1;
    static const sc_lv<2> ap_const_lv2_0;
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
    void thread_ap_done();
    void thread_ap_enable_pp0();
    void thread_ap_enable_reg_pp0_iter0();
    void thread_ap_idle();
    void thread_ap_idle_pp0();
    void thread_ap_idle_pp0_0to0();
    void thread_ap_predicate_op11_read_state1();
    void thread_ap_predicate_op18_read_state1();
    void thread_ap_predicate_op34_write_state2();
    void thread_ap_predicate_op6_read_state1();
    void thread_ap_ready();
    void thread_ap_reset_idle_pp0();
    void thread_grp_fu_99_p1();
    void thread_grp_nbreadreq_fu_50_p5();
    void thread_io_acc_block_signal_op11();
    void thread_io_acc_block_signal_op34();
    void thread_io_acc_block_signal_op6();
    void thread_rx_exh2dropFifo_V_da_blk_n();
    void thread_rx_exh2dropFifo_V_da_read();
    void thread_rx_exh2dropFifo_V_ke_blk_n();
    void thread_rx_exh2dropFifo_V_ke_read();
    void thread_rx_exh2dropFifo_V_la_blk_n();
    void thread_rx_exh2dropFifo_V_la_read();
    void thread_rx_ibhDrop2exhFifo_V_1_blk_n();
    void thread_rx_ibhDrop2exhFifo_V_1_din();
    void thread_rx_ibhDrop2exhFifo_V_1_write();
    void thread_rx_ibhDrop2exhFifo_V_2_blk_n();
    void thread_rx_ibhDrop2exhFifo_V_2_din();
    void thread_rx_ibhDrop2exhFifo_V_2_write();
    void thread_rx_ibhDrop2exhFifo_V_blk_n();
    void thread_rx_ibhDrop2exhFifo_V_din();
    void thread_rx_ibhDrop2exhFifo_V_write();
    void thread_rx_ibhDropFifo_V_blk_n();
    void thread_rx_ibhDropFifo_V_read();
    void thread_select_ln600_fu_121_p3();
    void thread_tmp_nbreadreq_fu_72_p3();
    void thread_ap_NS_fsm();
};

}

using namespace ap_rtl;

#endif
