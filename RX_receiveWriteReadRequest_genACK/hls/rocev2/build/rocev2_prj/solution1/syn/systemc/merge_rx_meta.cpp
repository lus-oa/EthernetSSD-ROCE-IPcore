// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2019.1
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

#include "merge_rx_meta.h"
#include "AESL_pkg.h"

using namespace std;

namespace ap_rtl {

const sc_logic merge_rx_meta::ap_const_logic_1 = sc_dt::Log_1;
const sc_logic merge_rx_meta::ap_const_logic_0 = sc_dt::Log_0;
const sc_lv<1> merge_rx_meta::ap_ST_fsm_pp0_stage0 = "1";
const sc_lv<32> merge_rx_meta::ap_const_lv32_0 = "00000000000000000000000000000000";
const bool merge_rx_meta::ap_const_boolean_1 = true;
const sc_lv<1> merge_rx_meta::ap_const_lv1_1 = "1";
const bool merge_rx_meta::ap_const_boolean_0 = false;
const sc_lv<32> merge_rx_meta::ap_const_lv32_10 = "10000";
const sc_lv<32> merge_rx_meta::ap_const_lv32_1F = "11111";
const sc_lv<32> merge_rx_meta::ap_const_lv32_20 = "100000";
const sc_lv<32> merge_rx_meta::ap_const_lv32_2F = "101111";
const sc_lv<32> merge_rx_meta::ap_const_lv32_30 = "110000";

merge_rx_meta::merge_rx_meta(sc_module_name name) : sc_module(name), mVcdFile(0) {

    SC_METHOD(thread_ap_clk_no_reset_);
    dont_initialize();
    sensitive << ( ap_clk.pos() );

    SC_METHOD(thread_ap_CS_fsm_pp0_stage0);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_block_pp0_stage0);

    SC_METHOD(thread_ap_block_pp0_stage0_01001);
    sensitive << ( ap_start );
    sensitive << ( ap_done_reg );
    sensitive << ( ap_enable_reg_pp0_iter1 );
    sensitive << ( io_acc_block_signal_op7 );
    sensitive << ( ap_predicate_op7_read_state1 );
    sensitive << ( rx_udpMetaFifo_V_empty_n );
    sensitive << ( ap_predicate_op9_read_state1 );
    sensitive << ( io_acc_block_signal_op24 );
    sensitive << ( ap_predicate_op24_write_state2 );

    SC_METHOD(thread_ap_block_pp0_stage0_11001);
    sensitive << ( ap_start );
    sensitive << ( ap_done_reg );
    sensitive << ( ap_enable_reg_pp0_iter1 );
    sensitive << ( io_acc_block_signal_op7 );
    sensitive << ( ap_predicate_op7_read_state1 );
    sensitive << ( rx_udpMetaFifo_V_empty_n );
    sensitive << ( ap_predicate_op9_read_state1 );
    sensitive << ( io_acc_block_signal_op24 );
    sensitive << ( ap_predicate_op24_write_state2 );

    SC_METHOD(thread_ap_block_pp0_stage0_subdone);
    sensitive << ( ap_start );
    sensitive << ( ap_done_reg );
    sensitive << ( ap_enable_reg_pp0_iter1 );
    sensitive << ( io_acc_block_signal_op7 );
    sensitive << ( ap_predicate_op7_read_state1 );
    sensitive << ( rx_udpMetaFifo_V_empty_n );
    sensitive << ( ap_predicate_op9_read_state1 );
    sensitive << ( io_acc_block_signal_op24 );
    sensitive << ( ap_predicate_op24_write_state2 );

    SC_METHOD(thread_ap_block_state1_pp0_stage0_iter0);
    sensitive << ( ap_start );
    sensitive << ( ap_done_reg );
    sensitive << ( io_acc_block_signal_op7 );
    sensitive << ( ap_predicate_op7_read_state1 );
    sensitive << ( rx_udpMetaFifo_V_empty_n );
    sensitive << ( ap_predicate_op9_read_state1 );

    SC_METHOD(thread_ap_block_state2_pp0_stage0_iter1);
    sensitive << ( io_acc_block_signal_op24 );
    sensitive << ( ap_predicate_op24_write_state2 );

    SC_METHOD(thread_ap_done);
    sensitive << ( ap_done_reg );
    sensitive << ( ap_CS_fsm_pp0_stage0 );
    sensitive << ( ap_enable_reg_pp0_iter1 );
    sensitive << ( ap_block_pp0_stage0_11001 );

    SC_METHOD(thread_ap_enable_pp0);
    sensitive << ( ap_idle_pp0 );

    SC_METHOD(thread_ap_enable_reg_pp0_iter0);
    sensitive << ( ap_start );

    SC_METHOD(thread_ap_idle);
    sensitive << ( ap_start );
    sensitive << ( ap_CS_fsm_pp0_stage0 );
    sensitive << ( ap_idle_pp0 );

    SC_METHOD(thread_ap_idle_pp0);
    sensitive << ( ap_enable_reg_pp0_iter0 );
    sensitive << ( ap_enable_reg_pp0_iter1 );

    SC_METHOD(thread_ap_idle_pp0_0to0);
    sensitive << ( ap_enable_reg_pp0_iter0 );

    SC_METHOD(thread_ap_predicate_op24_write_state2);
    sensitive << ( tmp_reg_142 );
    sensitive << ( tmp_64_reg_146 );
    sensitive << ( tmp_65_reg_170 );

    SC_METHOD(thread_ap_predicate_op7_read_state1);
    sensitive << ( tmp_nbreadreq_fu_54_p4 );
    sensitive << ( tmp_64_nbreadreq_fu_64_p3 );

    SC_METHOD(thread_ap_predicate_op9_read_state1);
    sensitive << ( tmp_nbreadreq_fu_54_p4 );
    sensitive << ( tmp_64_nbreadreq_fu_64_p3 );

    SC_METHOD(thread_ap_ready);
    sensitive << ( ap_start );
    sensitive << ( ap_CS_fsm_pp0_stage0 );
    sensitive << ( ap_block_pp0_stage0_11001 );

    SC_METHOD(thread_ap_reset_idle_pp0);
    sensitive << ( ap_start );
    sensitive << ( ap_idle_pp0_0to0 );

    SC_METHOD(thread_io_acc_block_signal_op24);
    sensitive << ( rx_ipUdpMetaFifo_V_t_1_full_n );
    sensitive << ( rx_ipUdpMetaFifo_V_t_full_n );
    sensitive << ( rx_ipUdpMetaFifo_V_m_full_n );
    sensitive << ( rx_ipUdpMetaFifo_V_l_full_n );

    SC_METHOD(thread_io_acc_block_signal_op7);
    sensitive << ( rx_ip2udpMetaFifo_V_s_empty_n );
    sensitive << ( rx_ip2udpMetaFifo_V_1_empty_n );

    SC_METHOD(thread_rx_ip2udpMetaFifo_V_1_blk_n);
    sensitive << ( ap_start );
    sensitive << ( ap_done_reg );
    sensitive << ( ap_CS_fsm_pp0_stage0 );
    sensitive << ( rx_ip2udpMetaFifo_V_1_empty_n );
    sensitive << ( ap_predicate_op7_read_state1 );
    sensitive << ( ap_block_pp0_stage0 );

    SC_METHOD(thread_rx_ip2udpMetaFifo_V_1_read);
    sensitive << ( ap_start );
    sensitive << ( ap_CS_fsm_pp0_stage0 );
    sensitive << ( ap_predicate_op7_read_state1 );
    sensitive << ( ap_block_pp0_stage0_11001 );

    SC_METHOD(thread_rx_ip2udpMetaFifo_V_s_blk_n);
    sensitive << ( ap_start );
    sensitive << ( ap_done_reg );
    sensitive << ( ap_CS_fsm_pp0_stage0 );
    sensitive << ( rx_ip2udpMetaFifo_V_s_empty_n );
    sensitive << ( ap_predicate_op7_read_state1 );
    sensitive << ( ap_block_pp0_stage0 );

    SC_METHOD(thread_rx_ip2udpMetaFifo_V_s_read);
    sensitive << ( ap_start );
    sensitive << ( ap_CS_fsm_pp0_stage0 );
    sensitive << ( ap_predicate_op7_read_state1 );
    sensitive << ( ap_block_pp0_stage0_11001 );

    SC_METHOD(thread_rx_ipUdpMetaFifo_V_l_blk_n);
    sensitive << ( ap_CS_fsm_pp0_stage0 );
    sensitive << ( ap_enable_reg_pp0_iter1 );
    sensitive << ( rx_ipUdpMetaFifo_V_l_full_n );
    sensitive << ( ap_predicate_op24_write_state2 );
    sensitive << ( ap_block_pp0_stage0 );

    SC_METHOD(thread_rx_ipUdpMetaFifo_V_l_din);
    sensitive << ( ap_CS_fsm_pp0_stage0 );
    sensitive << ( ap_enable_reg_pp0_iter1 );
    sensitive << ( ap_predicate_op24_write_state2 );
    sensitive << ( tmp_length_V_reg_165 );
    sensitive << ( ap_block_pp0_stage0_01001 );

    SC_METHOD(thread_rx_ipUdpMetaFifo_V_l_write);
    sensitive << ( ap_CS_fsm_pp0_stage0 );
    sensitive << ( ap_enable_reg_pp0_iter1 );
    sensitive << ( ap_predicate_op24_write_state2 );
    sensitive << ( ap_block_pp0_stage0_11001 );

    SC_METHOD(thread_rx_ipUdpMetaFifo_V_m_blk_n);
    sensitive << ( ap_CS_fsm_pp0_stage0 );
    sensitive << ( ap_enable_reg_pp0_iter1 );
    sensitive << ( rx_ipUdpMetaFifo_V_m_full_n );
    sensitive << ( ap_predicate_op24_write_state2 );
    sensitive << ( ap_block_pp0_stage0 );

    SC_METHOD(thread_rx_ipUdpMetaFifo_V_m_din);
    sensitive << ( ap_CS_fsm_pp0_stage0 );
    sensitive << ( ap_enable_reg_pp0_iter1 );
    sensitive << ( ap_predicate_op24_write_state2 );
    sensitive << ( tmp_my_port_V_reg_160 );
    sensitive << ( ap_block_pp0_stage0_01001 );

    SC_METHOD(thread_rx_ipUdpMetaFifo_V_m_write);
    sensitive << ( ap_CS_fsm_pp0_stage0 );
    sensitive << ( ap_enable_reg_pp0_iter1 );
    sensitive << ( ap_predicate_op24_write_state2 );
    sensitive << ( ap_block_pp0_stage0_11001 );

    SC_METHOD(thread_rx_ipUdpMetaFifo_V_t_1_blk_n);
    sensitive << ( ap_CS_fsm_pp0_stage0 );
    sensitive << ( ap_enable_reg_pp0_iter1 );
    sensitive << ( rx_ipUdpMetaFifo_V_t_1_full_n );
    sensitive << ( ap_predicate_op24_write_state2 );
    sensitive << ( ap_block_pp0_stage0 );

    SC_METHOD(thread_rx_ipUdpMetaFifo_V_t_1_din);
    sensitive << ( ap_CS_fsm_pp0_stage0 );
    sensitive << ( ap_enable_reg_pp0_iter1 );
    sensitive << ( ap_predicate_op24_write_state2 );
    sensitive << ( tmp_their_address_V_reg_150 );
    sensitive << ( ap_block_pp0_stage0_01001 );

    SC_METHOD(thread_rx_ipUdpMetaFifo_V_t_1_write);
    sensitive << ( ap_CS_fsm_pp0_stage0 );
    sensitive << ( ap_enable_reg_pp0_iter1 );
    sensitive << ( ap_predicate_op24_write_state2 );
    sensitive << ( ap_block_pp0_stage0_11001 );

    SC_METHOD(thread_rx_ipUdpMetaFifo_V_t_blk_n);
    sensitive << ( ap_CS_fsm_pp0_stage0 );
    sensitive << ( ap_enable_reg_pp0_iter1 );
    sensitive << ( rx_ipUdpMetaFifo_V_t_full_n );
    sensitive << ( ap_predicate_op24_write_state2 );
    sensitive << ( ap_block_pp0_stage0 );

    SC_METHOD(thread_rx_ipUdpMetaFifo_V_t_din);
    sensitive << ( ap_CS_fsm_pp0_stage0 );
    sensitive << ( ap_enable_reg_pp0_iter1 );
    sensitive << ( ap_predicate_op24_write_state2 );
    sensitive << ( tmp_their_port_V_reg_155 );
    sensitive << ( ap_block_pp0_stage0_01001 );

    SC_METHOD(thread_rx_ipUdpMetaFifo_V_t_write);
    sensitive << ( ap_CS_fsm_pp0_stage0 );
    sensitive << ( ap_enable_reg_pp0_iter1 );
    sensitive << ( ap_predicate_op24_write_state2 );
    sensitive << ( ap_block_pp0_stage0_11001 );

    SC_METHOD(thread_rx_udpMetaFifo_V_blk_n);
    sensitive << ( ap_start );
    sensitive << ( ap_done_reg );
    sensitive << ( ap_CS_fsm_pp0_stage0 );
    sensitive << ( rx_udpMetaFifo_V_empty_n );
    sensitive << ( ap_predicate_op9_read_state1 );
    sensitive << ( ap_block_pp0_stage0 );

    SC_METHOD(thread_rx_udpMetaFifo_V_read);
    sensitive << ( ap_start );
    sensitive << ( ap_CS_fsm_pp0_stage0 );
    sensitive << ( ap_predicate_op9_read_state1 );
    sensitive << ( ap_block_pp0_stage0_11001 );

    SC_METHOD(thread_tmp_64_nbreadreq_fu_64_p3);
    sensitive << ( rx_udpMetaFifo_V_empty_n );

    SC_METHOD(thread_tmp_nbreadreq_fu_54_p4);
    sensitive << ( rx_ip2udpMetaFifo_V_s_empty_n );
    sensitive << ( rx_ip2udpMetaFifo_V_1_empty_n );

    SC_METHOD(thread_tmp_their_port_V_fu_106_p1);
    sensitive << ( rx_udpMetaFifo_V_dout );

    SC_METHOD(thread_ap_NS_fsm);
    sensitive << ( ap_CS_fsm );
    sensitive << ( ap_block_pp0_stage0_subdone );
    sensitive << ( ap_reset_idle_pp0 );

    ap_done_reg = SC_LOGIC_0;
    ap_CS_fsm = "1";
    ap_enable_reg_pp0_iter1 = SC_LOGIC_0;
    static int apTFileNum = 0;
    stringstream apTFilenSS;
    apTFilenSS << "merge_rx_meta_sc_trace_" << apTFileNum ++;
    string apTFn = apTFilenSS.str();
    mVcdFile = sc_create_vcd_trace_file(apTFn.c_str());
    mVcdFile->set_time_unit(1, SC_PS);
    if (1) {
#ifdef __HLS_TRACE_LEVEL_PORT_HIER__
    sc_trace(mVcdFile, ap_clk, "(port)ap_clk");
    sc_trace(mVcdFile, ap_rst, "(port)ap_rst");
    sc_trace(mVcdFile, ap_start, "(port)ap_start");
    sc_trace(mVcdFile, ap_done, "(port)ap_done");
    sc_trace(mVcdFile, ap_continue, "(port)ap_continue");
    sc_trace(mVcdFile, ap_idle, "(port)ap_idle");
    sc_trace(mVcdFile, ap_ready, "(port)ap_ready");
    sc_trace(mVcdFile, rx_ip2udpMetaFifo_V_s_dout, "(port)rx_ip2udpMetaFifo_V_s_dout");
    sc_trace(mVcdFile, rx_ip2udpMetaFifo_V_s_empty_n, "(port)rx_ip2udpMetaFifo_V_s_empty_n");
    sc_trace(mVcdFile, rx_ip2udpMetaFifo_V_s_read, "(port)rx_ip2udpMetaFifo_V_s_read");
    sc_trace(mVcdFile, rx_ip2udpMetaFifo_V_1_dout, "(port)rx_ip2udpMetaFifo_V_1_dout");
    sc_trace(mVcdFile, rx_ip2udpMetaFifo_V_1_empty_n, "(port)rx_ip2udpMetaFifo_V_1_empty_n");
    sc_trace(mVcdFile, rx_ip2udpMetaFifo_V_1_read, "(port)rx_ip2udpMetaFifo_V_1_read");
    sc_trace(mVcdFile, rx_udpMetaFifo_V_dout, "(port)rx_udpMetaFifo_V_dout");
    sc_trace(mVcdFile, rx_udpMetaFifo_V_empty_n, "(port)rx_udpMetaFifo_V_empty_n");
    sc_trace(mVcdFile, rx_udpMetaFifo_V_read, "(port)rx_udpMetaFifo_V_read");
    sc_trace(mVcdFile, rx_ipUdpMetaFifo_V_t_1_din, "(port)rx_ipUdpMetaFifo_V_t_1_din");
    sc_trace(mVcdFile, rx_ipUdpMetaFifo_V_t_1_full_n, "(port)rx_ipUdpMetaFifo_V_t_1_full_n");
    sc_trace(mVcdFile, rx_ipUdpMetaFifo_V_t_1_write, "(port)rx_ipUdpMetaFifo_V_t_1_write");
    sc_trace(mVcdFile, rx_ipUdpMetaFifo_V_t_din, "(port)rx_ipUdpMetaFifo_V_t_din");
    sc_trace(mVcdFile, rx_ipUdpMetaFifo_V_t_full_n, "(port)rx_ipUdpMetaFifo_V_t_full_n");
    sc_trace(mVcdFile, rx_ipUdpMetaFifo_V_t_write, "(port)rx_ipUdpMetaFifo_V_t_write");
    sc_trace(mVcdFile, rx_ipUdpMetaFifo_V_m_din, "(port)rx_ipUdpMetaFifo_V_m_din");
    sc_trace(mVcdFile, rx_ipUdpMetaFifo_V_m_full_n, "(port)rx_ipUdpMetaFifo_V_m_full_n");
    sc_trace(mVcdFile, rx_ipUdpMetaFifo_V_m_write, "(port)rx_ipUdpMetaFifo_V_m_write");
    sc_trace(mVcdFile, rx_ipUdpMetaFifo_V_l_din, "(port)rx_ipUdpMetaFifo_V_l_din");
    sc_trace(mVcdFile, rx_ipUdpMetaFifo_V_l_full_n, "(port)rx_ipUdpMetaFifo_V_l_full_n");
    sc_trace(mVcdFile, rx_ipUdpMetaFifo_V_l_write, "(port)rx_ipUdpMetaFifo_V_l_write");
#endif
#ifdef __HLS_TRACE_LEVEL_INT__
    sc_trace(mVcdFile, ap_done_reg, "ap_done_reg");
    sc_trace(mVcdFile, ap_CS_fsm, "ap_CS_fsm");
    sc_trace(mVcdFile, ap_CS_fsm_pp0_stage0, "ap_CS_fsm_pp0_stage0");
    sc_trace(mVcdFile, ap_enable_reg_pp0_iter0, "ap_enable_reg_pp0_iter0");
    sc_trace(mVcdFile, ap_enable_reg_pp0_iter1, "ap_enable_reg_pp0_iter1");
    sc_trace(mVcdFile, ap_idle_pp0, "ap_idle_pp0");
    sc_trace(mVcdFile, io_acc_block_signal_op7, "io_acc_block_signal_op7");
    sc_trace(mVcdFile, tmp_nbreadreq_fu_54_p4, "tmp_nbreadreq_fu_54_p4");
    sc_trace(mVcdFile, tmp_64_nbreadreq_fu_64_p3, "tmp_64_nbreadreq_fu_64_p3");
    sc_trace(mVcdFile, ap_predicate_op7_read_state1, "ap_predicate_op7_read_state1");
    sc_trace(mVcdFile, ap_predicate_op9_read_state1, "ap_predicate_op9_read_state1");
    sc_trace(mVcdFile, ap_block_state1_pp0_stage0_iter0, "ap_block_state1_pp0_stage0_iter0");
    sc_trace(mVcdFile, io_acc_block_signal_op24, "io_acc_block_signal_op24");
    sc_trace(mVcdFile, tmp_reg_142, "tmp_reg_142");
    sc_trace(mVcdFile, tmp_64_reg_146, "tmp_64_reg_146");
    sc_trace(mVcdFile, tmp_65_reg_170, "tmp_65_reg_170");
    sc_trace(mVcdFile, ap_predicate_op24_write_state2, "ap_predicate_op24_write_state2");
    sc_trace(mVcdFile, ap_block_state2_pp0_stage0_iter1, "ap_block_state2_pp0_stage0_iter1");
    sc_trace(mVcdFile, ap_block_pp0_stage0_11001, "ap_block_pp0_stage0_11001");
    sc_trace(mVcdFile, rx_ip2udpMetaFifo_V_s_blk_n, "rx_ip2udpMetaFifo_V_s_blk_n");
    sc_trace(mVcdFile, ap_block_pp0_stage0, "ap_block_pp0_stage0");
    sc_trace(mVcdFile, rx_ip2udpMetaFifo_V_1_blk_n, "rx_ip2udpMetaFifo_V_1_blk_n");
    sc_trace(mVcdFile, rx_udpMetaFifo_V_blk_n, "rx_udpMetaFifo_V_blk_n");
    sc_trace(mVcdFile, rx_ipUdpMetaFifo_V_t_1_blk_n, "rx_ipUdpMetaFifo_V_t_1_blk_n");
    sc_trace(mVcdFile, rx_ipUdpMetaFifo_V_t_blk_n, "rx_ipUdpMetaFifo_V_t_blk_n");
    sc_trace(mVcdFile, rx_ipUdpMetaFifo_V_m_blk_n, "rx_ipUdpMetaFifo_V_m_blk_n");
    sc_trace(mVcdFile, rx_ipUdpMetaFifo_V_l_blk_n, "rx_ipUdpMetaFifo_V_l_blk_n");
    sc_trace(mVcdFile, tmp_their_address_V_reg_150, "tmp_their_address_V_reg_150");
    sc_trace(mVcdFile, tmp_their_port_V_fu_106_p1, "tmp_their_port_V_fu_106_p1");
    sc_trace(mVcdFile, tmp_their_port_V_reg_155, "tmp_their_port_V_reg_155");
    sc_trace(mVcdFile, tmp_my_port_V_reg_160, "tmp_my_port_V_reg_160");
    sc_trace(mVcdFile, tmp_length_V_reg_165, "tmp_length_V_reg_165");
    sc_trace(mVcdFile, ap_block_pp0_stage0_subdone, "ap_block_pp0_stage0_subdone");
    sc_trace(mVcdFile, ap_block_pp0_stage0_01001, "ap_block_pp0_stage0_01001");
    sc_trace(mVcdFile, ap_NS_fsm, "ap_NS_fsm");
    sc_trace(mVcdFile, ap_idle_pp0_0to0, "ap_idle_pp0_0to0");
    sc_trace(mVcdFile, ap_reset_idle_pp0, "ap_reset_idle_pp0");
    sc_trace(mVcdFile, ap_enable_pp0, "ap_enable_pp0");
#endif

    }
}

merge_rx_meta::~merge_rx_meta() {
    if (mVcdFile) 
        sc_close_vcd_trace_file(mVcdFile);

}

void merge_rx_meta::thread_ap_clk_no_reset_() {
    if ( ap_rst.read() == ap_const_logic_1) {
        ap_CS_fsm = ap_ST_fsm_pp0_stage0;
    } else {
        ap_CS_fsm = ap_NS_fsm.read();
    }
    if ( ap_rst.read() == ap_const_logic_1) {
        ap_done_reg = ap_const_logic_0;
    } else {
        if (esl_seteq<1,1,1>(ap_const_logic_1, ap_continue.read())) {
            ap_done_reg = ap_const_logic_0;
        } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage0.read()) && 
                    esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter1.read()) && 
                    esl_seteq<1,1,1>(ap_block_pp0_stage0_11001.read(), ap_const_boolean_0))) {
            ap_done_reg = ap_const_logic_1;
        }
    }
    if ( ap_rst.read() == ap_const_logic_1) {
        ap_enable_reg_pp0_iter1 = ap_const_logic_0;
    } else {
        if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage0.read()) && 
             esl_seteq<1,1,1>(ap_block_pp0_stage0_subdone.read(), ap_const_boolean_0))) {
            ap_enable_reg_pp0_iter1 = ap_start.read();
        }
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage0.read()) && esl_seteq<1,1,1>(tmp_nbreadreq_fu_54_p4.read(), ap_const_lv1_1) && esl_seteq<1,1,1>(ap_block_pp0_stage0_11001.read(), ap_const_boolean_0))) {
        tmp_64_reg_146 = tmp_64_nbreadreq_fu_64_p3.read();
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage0.read()) && esl_seteq<1,1,1>(tmp_nbreadreq_fu_54_p4.read(), ap_const_lv1_1) && esl_seteq<1,1,1>(ap_const_lv1_1, tmp_64_nbreadreq_fu_64_p3.read()) && esl_seteq<1,1,1>(ap_block_pp0_stage0_11001.read(), ap_const_boolean_0))) {
        tmp_65_reg_170 = rx_udpMetaFifo_V_dout.read().range(48, 48);
        tmp_length_V_reg_165 = rx_udpMetaFifo_V_dout.read().range(47, 32);
        tmp_my_port_V_reg_160 = rx_udpMetaFifo_V_dout.read().range(31, 16);
        tmp_their_address_V_reg_150 = rx_ip2udpMetaFifo_V_s_dout.read();
        tmp_their_port_V_reg_155 = tmp_their_port_V_fu_106_p1.read();
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage0.read()) && esl_seteq<1,1,1>(ap_block_pp0_stage0_11001.read(), ap_const_boolean_0))) {
        tmp_reg_142 = tmp_nbreadreq_fu_54_p4.read();
    }
}

void merge_rx_meta::thread_ap_CS_fsm_pp0_stage0() {
    ap_CS_fsm_pp0_stage0 = ap_CS_fsm.read()[0];
}

void merge_rx_meta::thread_ap_block_pp0_stage0() {
    ap_block_pp0_stage0 = !esl_seteq<1,1,1>(ap_const_boolean_1, ap_const_boolean_1);
}

void merge_rx_meta::thread_ap_block_pp0_stage0_01001() {
    ap_block_pp0_stage0_01001 = (esl_seteq<1,1,1>(ap_done_reg.read(), ap_const_logic_1) || (esl_seteq<1,1,1>(ap_const_logic_1, ap_start.read()) && 
  (esl_seteq<1,1,1>(ap_const_logic_0, ap_start.read()) || 
   (esl_seteq<1,1,1>(ap_const_logic_0, io_acc_block_signal_op7.read()) && 
    esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op7_read_state1.read())) || 
   (esl_seteq<1,1,1>(ap_const_logic_0, rx_udpMetaFifo_V_empty_n.read()) && 
    esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op9_read_state1.read())) || 
   esl_seteq<1,1,1>(ap_done_reg.read(), ap_const_logic_1))) || (esl_seteq<1,1,1>(ap_const_logic_0, io_acc_block_signal_op24.read()) && 
  esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op24_write_state2.read()) && 
  esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter1.read())));
}

void merge_rx_meta::thread_ap_block_pp0_stage0_11001() {
    ap_block_pp0_stage0_11001 = (esl_seteq<1,1,1>(ap_done_reg.read(), ap_const_logic_1) || (esl_seteq<1,1,1>(ap_const_logic_1, ap_start.read()) && 
  (esl_seteq<1,1,1>(ap_const_logic_0, ap_start.read()) || 
   (esl_seteq<1,1,1>(ap_const_logic_0, io_acc_block_signal_op7.read()) && 
    esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op7_read_state1.read())) || 
   (esl_seteq<1,1,1>(ap_const_logic_0, rx_udpMetaFifo_V_empty_n.read()) && 
    esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op9_read_state1.read())) || 
   esl_seteq<1,1,1>(ap_done_reg.read(), ap_const_logic_1))) || (esl_seteq<1,1,1>(ap_const_logic_0, io_acc_block_signal_op24.read()) && 
  esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op24_write_state2.read()) && 
  esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter1.read())));
}

void merge_rx_meta::thread_ap_block_pp0_stage0_subdone() {
    ap_block_pp0_stage0_subdone = (esl_seteq<1,1,1>(ap_done_reg.read(), ap_const_logic_1) || (esl_seteq<1,1,1>(ap_const_logic_1, ap_start.read()) && 
  (esl_seteq<1,1,1>(ap_const_logic_0, ap_start.read()) || 
   (esl_seteq<1,1,1>(ap_const_logic_0, io_acc_block_signal_op7.read()) && 
    esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op7_read_state1.read())) || 
   (esl_seteq<1,1,1>(ap_const_logic_0, rx_udpMetaFifo_V_empty_n.read()) && 
    esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op9_read_state1.read())) || 
   esl_seteq<1,1,1>(ap_done_reg.read(), ap_const_logic_1))) || (esl_seteq<1,1,1>(ap_const_logic_0, io_acc_block_signal_op24.read()) && 
  esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op24_write_state2.read()) && 
  esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter1.read())));
}

void merge_rx_meta::thread_ap_block_state1_pp0_stage0_iter0() {
    ap_block_state1_pp0_stage0_iter0 = (esl_seteq<1,1,1>(ap_const_logic_0, ap_start.read()) || (esl_seteq<1,1,1>(ap_const_logic_0, io_acc_block_signal_op7.read()) && 
  esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op7_read_state1.read())) || (esl_seteq<1,1,1>(ap_const_logic_0, rx_udpMetaFifo_V_empty_n.read()) && 
  esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op9_read_state1.read())) || esl_seteq<1,1,1>(ap_done_reg.read(), ap_const_logic_1));
}

void merge_rx_meta::thread_ap_block_state2_pp0_stage0_iter1() {
    ap_block_state2_pp0_stage0_iter1 = (esl_seteq<1,1,1>(ap_const_logic_0, io_acc_block_signal_op24.read()) && esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op24_write_state2.read()));
}

void merge_rx_meta::thread_ap_done() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage0.read()) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter1.read()) && 
         esl_seteq<1,1,1>(ap_block_pp0_stage0_11001.read(), ap_const_boolean_0))) {
        ap_done = ap_const_logic_1;
    } else {
        ap_done = ap_done_reg.read();
    }
}

void merge_rx_meta::thread_ap_enable_pp0() {
    ap_enable_pp0 = (ap_idle_pp0.read() ^ ap_const_logic_1);
}

void merge_rx_meta::thread_ap_enable_reg_pp0_iter0() {
    ap_enable_reg_pp0_iter0 = ap_start.read();
}

void merge_rx_meta::thread_ap_idle() {
    if ((esl_seteq<1,1,1>(ap_const_logic_0, ap_start.read()) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage0.read()) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_idle_pp0.read()))) {
        ap_idle = ap_const_logic_1;
    } else {
        ap_idle = ap_const_logic_0;
    }
}

void merge_rx_meta::thread_ap_idle_pp0() {
    if ((esl_seteq<1,1,1>(ap_const_logic_0, ap_enable_reg_pp0_iter0.read()) && 
         esl_seteq<1,1,1>(ap_const_logic_0, ap_enable_reg_pp0_iter1.read()))) {
        ap_idle_pp0 = ap_const_logic_1;
    } else {
        ap_idle_pp0 = ap_const_logic_0;
    }
}

void merge_rx_meta::thread_ap_idle_pp0_0to0() {
    if (esl_seteq<1,1,1>(ap_const_logic_0, ap_enable_reg_pp0_iter0.read())) {
        ap_idle_pp0_0to0 = ap_const_logic_1;
    } else {
        ap_idle_pp0_0to0 = ap_const_logic_0;
    }
}

void merge_rx_meta::thread_ap_predicate_op24_write_state2() {
    ap_predicate_op24_write_state2 = (esl_seteq<1,1,1>(ap_const_lv1_1, tmp_reg_142.read()) && esl_seteq<1,1,1>(ap_const_lv1_1, tmp_64_reg_146.read()) && esl_seteq<1,1,1>(ap_const_lv1_1, tmp_65_reg_170.read()));
}

void merge_rx_meta::thread_ap_predicate_op7_read_state1() {
    ap_predicate_op7_read_state1 = (esl_seteq<1,1,1>(tmp_nbreadreq_fu_54_p4.read(), ap_const_lv1_1) && esl_seteq<1,1,1>(ap_const_lv1_1, tmp_64_nbreadreq_fu_64_p3.read()));
}

void merge_rx_meta::thread_ap_predicate_op9_read_state1() {
    ap_predicate_op9_read_state1 = (esl_seteq<1,1,1>(tmp_nbreadreq_fu_54_p4.read(), ap_const_lv1_1) && esl_seteq<1,1,1>(ap_const_lv1_1, tmp_64_nbreadreq_fu_64_p3.read()));
}

void merge_rx_meta::thread_ap_ready() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage0.read()) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_start.read()) && 
         esl_seteq<1,1,1>(ap_block_pp0_stage0_11001.read(), ap_const_boolean_0))) {
        ap_ready = ap_const_logic_1;
    } else {
        ap_ready = ap_const_logic_0;
    }
}

void merge_rx_meta::thread_ap_reset_idle_pp0() {
    if ((esl_seteq<1,1,1>(ap_const_logic_0, ap_start.read()) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_idle_pp0_0to0.read()))) {
        ap_reset_idle_pp0 = ap_const_logic_1;
    } else {
        ap_reset_idle_pp0 = ap_const_logic_0;
    }
}

void merge_rx_meta::thread_io_acc_block_signal_op24() {
    io_acc_block_signal_op24 = (rx_ipUdpMetaFifo_V_t_1_full_n.read() & rx_ipUdpMetaFifo_V_t_full_n.read() & rx_ipUdpMetaFifo_V_m_full_n.read() & rx_ipUdpMetaFifo_V_l_full_n.read());
}

void merge_rx_meta::thread_io_acc_block_signal_op7() {
    io_acc_block_signal_op7 = (rx_ip2udpMetaFifo_V_s_empty_n.read() & rx_ip2udpMetaFifo_V_1_empty_n.read());
}

void merge_rx_meta::thread_rx_ip2udpMetaFifo_V_1_blk_n() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage0.read()) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_start.read()) && 
         esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op7_read_state1.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_0, ap_start.read()) || esl_seteq<1,1,1>(ap_done_reg.read(), ap_const_logic_1)) && 
         esl_seteq<1,1,1>(ap_block_pp0_stage0.read(), ap_const_boolean_0))) {
        rx_ip2udpMetaFifo_V_1_blk_n = rx_ip2udpMetaFifo_V_1_empty_n.read();
    } else {
        rx_ip2udpMetaFifo_V_1_blk_n = ap_const_logic_1;
    }
}

void merge_rx_meta::thread_rx_ip2udpMetaFifo_V_1_read() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage0.read()) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_start.read()) && 
         esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op7_read_state1.read()) && 
         esl_seteq<1,1,1>(ap_block_pp0_stage0_11001.read(), ap_const_boolean_0))) {
        rx_ip2udpMetaFifo_V_1_read = ap_const_logic_1;
    } else {
        rx_ip2udpMetaFifo_V_1_read = ap_const_logic_0;
    }
}

void merge_rx_meta::thread_rx_ip2udpMetaFifo_V_s_blk_n() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage0.read()) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_start.read()) && 
         esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op7_read_state1.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_0, ap_start.read()) || esl_seteq<1,1,1>(ap_done_reg.read(), ap_const_logic_1)) && 
         esl_seteq<1,1,1>(ap_block_pp0_stage0.read(), ap_const_boolean_0))) {
        rx_ip2udpMetaFifo_V_s_blk_n = rx_ip2udpMetaFifo_V_s_empty_n.read();
    } else {
        rx_ip2udpMetaFifo_V_s_blk_n = ap_const_logic_1;
    }
}

void merge_rx_meta::thread_rx_ip2udpMetaFifo_V_s_read() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage0.read()) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_start.read()) && 
         esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op7_read_state1.read()) && 
         esl_seteq<1,1,1>(ap_block_pp0_stage0_11001.read(), ap_const_boolean_0))) {
        rx_ip2udpMetaFifo_V_s_read = ap_const_logic_1;
    } else {
        rx_ip2udpMetaFifo_V_s_read = ap_const_logic_0;
    }
}

void merge_rx_meta::thread_rx_ipUdpMetaFifo_V_l_blk_n() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage0.read()) && 
         esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op24_write_state2.read()) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter1.read()) && 
         esl_seteq<1,1,1>(ap_block_pp0_stage0.read(), ap_const_boolean_0))) {
        rx_ipUdpMetaFifo_V_l_blk_n = rx_ipUdpMetaFifo_V_l_full_n.read();
    } else {
        rx_ipUdpMetaFifo_V_l_blk_n = ap_const_logic_1;
    }
}

void merge_rx_meta::thread_rx_ipUdpMetaFifo_V_l_din() {
    rx_ipUdpMetaFifo_V_l_din = tmp_length_V_reg_165.read();
}

void merge_rx_meta::thread_rx_ipUdpMetaFifo_V_l_write() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage0.read()) && 
         esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op24_write_state2.read()) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter1.read()) && 
         esl_seteq<1,1,1>(ap_block_pp0_stage0_11001.read(), ap_const_boolean_0))) {
        rx_ipUdpMetaFifo_V_l_write = ap_const_logic_1;
    } else {
        rx_ipUdpMetaFifo_V_l_write = ap_const_logic_0;
    }
}

void merge_rx_meta::thread_rx_ipUdpMetaFifo_V_m_blk_n() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage0.read()) && 
         esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op24_write_state2.read()) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter1.read()) && 
         esl_seteq<1,1,1>(ap_block_pp0_stage0.read(), ap_const_boolean_0))) {
        rx_ipUdpMetaFifo_V_m_blk_n = rx_ipUdpMetaFifo_V_m_full_n.read();
    } else {
        rx_ipUdpMetaFifo_V_m_blk_n = ap_const_logic_1;
    }
}

void merge_rx_meta::thread_rx_ipUdpMetaFifo_V_m_din() {
    rx_ipUdpMetaFifo_V_m_din = tmp_my_port_V_reg_160.read();
}

void merge_rx_meta::thread_rx_ipUdpMetaFifo_V_m_write() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage0.read()) && 
         esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op24_write_state2.read()) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter1.read()) && 
         esl_seteq<1,1,1>(ap_block_pp0_stage0_11001.read(), ap_const_boolean_0))) {
        rx_ipUdpMetaFifo_V_m_write = ap_const_logic_1;
    } else {
        rx_ipUdpMetaFifo_V_m_write = ap_const_logic_0;
    }
}

void merge_rx_meta::thread_rx_ipUdpMetaFifo_V_t_1_blk_n() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage0.read()) && 
         esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op24_write_state2.read()) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter1.read()) && 
         esl_seteq<1,1,1>(ap_block_pp0_stage0.read(), ap_const_boolean_0))) {
        rx_ipUdpMetaFifo_V_t_1_blk_n = rx_ipUdpMetaFifo_V_t_1_full_n.read();
    } else {
        rx_ipUdpMetaFifo_V_t_1_blk_n = ap_const_logic_1;
    }
}

void merge_rx_meta::thread_rx_ipUdpMetaFifo_V_t_1_din() {
    rx_ipUdpMetaFifo_V_t_1_din = esl_zext<128,32>(tmp_their_address_V_reg_150.read());
}

void merge_rx_meta::thread_rx_ipUdpMetaFifo_V_t_1_write() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage0.read()) && 
         esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op24_write_state2.read()) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter1.read()) && 
         esl_seteq<1,1,1>(ap_block_pp0_stage0_11001.read(), ap_const_boolean_0))) {
        rx_ipUdpMetaFifo_V_t_1_write = ap_const_logic_1;
    } else {
        rx_ipUdpMetaFifo_V_t_1_write = ap_const_logic_0;
    }
}

void merge_rx_meta::thread_rx_ipUdpMetaFifo_V_t_blk_n() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage0.read()) && 
         esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op24_write_state2.read()) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter1.read()) && 
         esl_seteq<1,1,1>(ap_block_pp0_stage0.read(), ap_const_boolean_0))) {
        rx_ipUdpMetaFifo_V_t_blk_n = rx_ipUdpMetaFifo_V_t_full_n.read();
    } else {
        rx_ipUdpMetaFifo_V_t_blk_n = ap_const_logic_1;
    }
}

void merge_rx_meta::thread_rx_ipUdpMetaFifo_V_t_din() {
    rx_ipUdpMetaFifo_V_t_din = tmp_their_port_V_reg_155.read();
}

void merge_rx_meta::thread_rx_ipUdpMetaFifo_V_t_write() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage0.read()) && 
         esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op24_write_state2.read()) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter1.read()) && 
         esl_seteq<1,1,1>(ap_block_pp0_stage0_11001.read(), ap_const_boolean_0))) {
        rx_ipUdpMetaFifo_V_t_write = ap_const_logic_1;
    } else {
        rx_ipUdpMetaFifo_V_t_write = ap_const_logic_0;
    }
}

void merge_rx_meta::thread_rx_udpMetaFifo_V_blk_n() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage0.read()) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_start.read()) && 
         esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op9_read_state1.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_0, ap_start.read()) || esl_seteq<1,1,1>(ap_done_reg.read(), ap_const_logic_1)) && 
         esl_seteq<1,1,1>(ap_block_pp0_stage0.read(), ap_const_boolean_0))) {
        rx_udpMetaFifo_V_blk_n = rx_udpMetaFifo_V_empty_n.read();
    } else {
        rx_udpMetaFifo_V_blk_n = ap_const_logic_1;
    }
}

void merge_rx_meta::thread_rx_udpMetaFifo_V_read() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage0.read()) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_start.read()) && 
         esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op9_read_state1.read()) && 
         esl_seteq<1,1,1>(ap_block_pp0_stage0_11001.read(), ap_const_boolean_0))) {
        rx_udpMetaFifo_V_read = ap_const_logic_1;
    } else {
        rx_udpMetaFifo_V_read = ap_const_logic_0;
    }
}

void merge_rx_meta::thread_tmp_64_nbreadreq_fu_64_p3() {
    tmp_64_nbreadreq_fu_64_p3 =  (sc_lv<1>) ((rx_udpMetaFifo_V_empty_n.read()));
}

void merge_rx_meta::thread_tmp_nbreadreq_fu_54_p4() {
    tmp_nbreadreq_fu_54_p4 =  (sc_lv<1>) ((rx_ip2udpMetaFifo_V_s_empty_n.read() & rx_ip2udpMetaFifo_V_1_empty_n.read()));
}

void merge_rx_meta::thread_tmp_their_port_V_fu_106_p1() {
    tmp_their_port_V_fu_106_p1 = rx_udpMetaFifo_V_dout.read().range(16-1, 0);
}

void merge_rx_meta::thread_ap_NS_fsm() {
    switch (ap_CS_fsm.read().to_uint64()) {
        case 1 : 
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
break;
        default : 
            ap_NS_fsm = "X";
            break;
    }
}

}
