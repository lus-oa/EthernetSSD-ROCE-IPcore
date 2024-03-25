#include "compute_crc32.h"
#include "AESL_pkg.h"

using namespace std;

namespace ap_rtl {

void compute_crc32::thread_ap_clk_no_reset_() {
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
        ap_enable_reg_pp0_iter0_reg = ap_const_logic_0;
    } else {
        if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage0.read())) {
            ap_enable_reg_pp0_iter0_reg = ap_start.read();
        }
    }
    if ( ap_rst.read() == ap_const_logic_1) {
        ap_enable_reg_pp0_iter1 = ap_const_logic_0;
    } else {
        if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage5.read()) && 
             esl_seteq<1,1,1>(ap_block_pp0_stage5_subdone.read(), ap_const_boolean_0))) {
            ap_enable_reg_pp0_iter1 = ap_enable_reg_pp0_iter0.read();
        } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage0.read()) && 
                    esl_seteq<1,1,1>(ap_block_pp0_stage0_subdone.read(), ap_const_boolean_0) && 
                    esl_seteq<1,1,1>(ap_enable_reg_pp0_iter0.read(), ap_const_logic_0))) {
            ap_enable_reg_pp0_iter1 = ap_const_logic_0;
        }
    }
    if (esl_seteq<1,1,1>(ap_condition_48.read(), ap_const_boolean_1)) {
        if ((esl_seteq<1,1,1>(crcState_load_reg_20216.read(), ap_const_lv1_1) && 
             esl_seteq<1,1,1>(ap_const_lv1_1, currWord_last_V_load_load_fu_14429_p1.read()))) {
            ap_phi_reg_pp0_iter1_crc_1_flag_65_i_reg_433 = ap_const_lv1_1;
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_const_boolean_1)) {
            ap_phi_reg_pp0_iter1_crc_1_flag_65_i_reg_433 = ap_phi_reg_pp0_iter0_crc_1_flag_65_i_reg_433.read();
        }
    }
    if (esl_seteq<1,1,1>(ap_condition_48.read(), ap_const_boolean_1)) {
        if ((esl_seteq<1,1,1>(crcState_load_reg_20216.read(), ap_const_lv1_1) && 
             esl_seteq<1,1,1>(ap_const_lv1_1, currWord_last_V_load_load_fu_14429_p1.read()))) {
            ap_phi_reg_pp0_iter1_crc_1_new_65_i_reg_444 = ap_const_lv32_DEBB20E3;
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_const_boolean_1)) {
            ap_phi_reg_pp0_iter1_crc_1_new_65_i_reg_444 = ap_phi_reg_pp0_iter0_crc_1_new_65_i_reg_444.read();
        }
    }
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read())) {
        if (esl_seteq<1,1,1>(ap_condition_525.read(), ap_const_boolean_1)) {
            crcState = ap_const_lv1_0;
        } else if (esl_seteq<1,1,1>(ap_condition_148.read(), ap_const_boolean_1)) {
            crcState = ap_const_lv1_1;
        }
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage0.read()) && esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter1.read()) && esl_seteq<1,1,1>(ap_block_pp0_stage0_11001.read(), ap_const_boolean_0) && esl_seteq<1,1,1>(ap_const_lv1_1, ap_phi_mux_crc_1_flag_66_i_phi_fu_459_p6.read()))) {
        crc = ap_phi_mux_crc_1_new_66_i_phi_fu_473_p6.read();
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage0.read()) && esl_seteq<1,1,1>(ap_block_pp0_stage0_11001.read(), ap_const_boolean_0))) {
        crcState_load_reg_20216 = crcState.read();
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage1.read()) && esl_seteq<1,1,1>(ap_const_lv1_0, crcState_load_reg_20216.read()) && esl_seteq<1,1,1>(tmp_reg_20220.read(), ap_const_lv1_1) && esl_seteq<1,1,1>(ap_block_pp0_stage1_11001.read(), ap_const_boolean_0))) {
        currWord_data_V = tx_maskedDataFifo_V_1_dout.read();
        currWord_keep_V = tx_maskedDataFifo_V_2_dout.read();
        currWord_last_V = tx_maskedDataFifo_V_s_dout.read();
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage5.read()) && esl_seteq<1,1,1>(ap_block_pp0_stage5_11001.read(), ap_const_boolean_0) && esl_seteq<1,1,1>(crcState_load_reg_20216.read(), ap_const_lv1_1))) {
        currWord_last_V_load_reg_21150 = currWord_last_V.read();
        or_ln791_35_reg_21145 = or_ln791_35_fu_14424_p2.read();
        select_ln791_21_reg_21134 = select_ln791_21_fu_14324_p3.read();
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage5.read()) && esl_seteq<1,1,1>(ap_block_pp0_stage5_11001.read(), ap_const_boolean_0) && esl_seteq<1,1,1>(ap_const_lv1_0, crcState_load_reg_20216.read()) && esl_seteq<1,1,1>(tmp_reg_20220.read(), ap_const_lv1_1) && esl_seteq<1,1,1>(ap_const_lv1_1, tmp_216_reg_20493.read()))) {
        lshr_ln428_172_reg_21124 = select_ln422_172_fu_11262_p3.read().range(31, 1);
        select_ln422_172_reg_21119 = select_ln422_172_fu_11262_p3.read();
    }
    if ((esl_seteq<1,1,1>(ap_const_lv1_0, crcState_load_reg_20216.read()) && esl_seteq<1,1,1>(tmp_reg_20220.read(), ap_const_lv1_1) && esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage2.read()) && esl_seteq<1,1,1>(ap_block_pp0_stage2_11001.read(), ap_const_boolean_0) && esl_seteq<1,1,1>(ap_const_lv1_1, tmp_178_reg_20284.read()))) {
        lshr_ln428_22_reg_21014 = select_ln422_22_fu_2997_p3.read().range(31, 1);
        select_ln422_22_reg_21009 = select_ln422_22_fu_2997_p3.read();
    }
    if ((esl_seteq<1,1,1>(ap_const_lv1_0, crcState_load_reg_20216.read()) && esl_seteq<1,1,1>(tmp_reg_20220.read(), ap_const_lv1_1) && esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage3.read()) && esl_seteq<1,1,1>(ap_block_pp0_stage3_11001.read(), ap_const_boolean_0) && esl_seteq<1,1,1>(ap_const_lv1_1, tmp_182_reg_20306.read()))) {
        lshr_ln428_36_reg_21054 = select_ln422_36_fu_4091_p3.read().range(31, 1);
        select_ln422_36_reg_21049 = select_ln422_36_fu_4091_p3.read();
    }
    if ((esl_seteq<1,1,1>(ap_const_lv1_0, crcState_load_reg_20216.read()) && esl_seteq<1,1,1>(tmp_reg_20220.read(), ap_const_lv1_1) && esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage4.read()) && esl_seteq<1,1,1>(ap_block_pp0_stage4_11001.read(), ap_const_boolean_0) && esl_seteq<1,1,1>(ap_const_lv1_1, tmp_196_reg_20383.read()))) {
        lshr_ln428_88_reg_21089 = select_ln422_88_fu_6477_p3.read().range(31, 1);
        select_ln422_88_reg_21084 = select_ln422_88_fu_6477_p3.read();
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage1.read()) && esl_seteq<1,1,1>(ap_const_lv1_0, crcState_load_reg_20216.read()) && esl_seteq<1,1,1>(tmp_reg_20220.read(), ap_const_lv1_1) && esl_seteq<1,1,1>(ap_block_pp0_stage1_11001.read(), ap_const_boolean_0))) {
        lshr_ln428_9_reg_20279 = select_ln422_8_fu_879_p3.read().range(31, 1);
        p_Result_320_10_i_reg_20389 = tx_maskedDataFifo_V_1_dout.read().range(95, 88);
        p_Result_320_11_i_reg_20400 = tx_maskedDataFifo_V_1_dout.read().range(103, 96);
        p_Result_320_12_i_reg_20411 = tx_maskedDataFifo_V_1_dout.read().range(111, 104);
        p_Result_320_13_i_reg_20422 = tx_maskedDataFifo_V_1_dout.read().range(119, 112);
        p_Result_320_14_i_reg_20433 = tx_maskedDataFifo_V_1_dout.read().range(127, 120);
        p_Result_320_15_i_reg_20444 = tx_maskedDataFifo_V_1_dout.read().range(135, 128);
        p_Result_320_16_i_reg_20455 = tx_maskedDataFifo_V_1_dout.read().range(143, 136);
        p_Result_320_17_i_reg_20466 = tx_maskedDataFifo_V_1_dout.read().range(151, 144);
        p_Result_320_18_i_reg_20477 = tx_maskedDataFifo_V_1_dout.read().range(159, 152);
        p_Result_320_19_i_reg_20488 = tx_maskedDataFifo_V_1_dout.read().range(167, 160);
        p_Result_320_20_i_reg_20499 = tx_maskedDataFifo_V_1_dout.read().range(175, 168);
        p_Result_320_21_i_reg_20510 = tx_maskedDataFifo_V_1_dout.read().range(183, 176);
        p_Result_320_22_i_reg_20521 = tx_maskedDataFifo_V_1_dout.read().range(191, 184);
        p_Result_320_23_i_reg_20532 = tx_maskedDataFifo_V_1_dout.read().range(199, 192);
        p_Result_320_24_i_reg_20543 = tx_maskedDataFifo_V_1_dout.read().range(207, 200);
        p_Result_320_25_i_reg_20554 = tx_maskedDataFifo_V_1_dout.read().range(215, 208);
        p_Result_320_26_i_reg_20565 = tx_maskedDataFifo_V_1_dout.read().range(223, 216);
        p_Result_320_27_i_reg_20576 = tx_maskedDataFifo_V_1_dout.read().range(231, 224);
        p_Result_320_28_i_reg_20587 = tx_maskedDataFifo_V_1_dout.read().range(239, 232);
        p_Result_320_29_i_reg_20598 = tx_maskedDataFifo_V_1_dout.read().range(247, 240);
        p_Result_320_2_i_reg_20290 = tx_maskedDataFifo_V_1_dout.read().range(23, 16);
        p_Result_320_30_i_reg_20609 = tx_maskedDataFifo_V_1_dout.read().range(255, 248);
        p_Result_320_3_i_reg_20301 = tx_maskedDataFifo_V_1_dout.read().range(31, 24);
        p_Result_320_4_i_reg_20312 = tx_maskedDataFifo_V_1_dout.read().range(39, 32);
        p_Result_320_5_i_reg_20323 = tx_maskedDataFifo_V_1_dout.read().range(47, 40);
        p_Result_320_6_i_reg_20334 = tx_maskedDataFifo_V_1_dout.read().range(55, 48);
        p_Result_320_7_i_reg_20345 = tx_maskedDataFifo_V_1_dout.read().range(63, 56);
        p_Result_320_8_i_reg_20356 = tx_maskedDataFifo_V_1_dout.read().range(71, 64);
        p_Result_320_9_i_reg_20367 = tx_maskedDataFifo_V_1_dout.read().range(79, 72);
        p_Result_320_i_reg_20378 = tx_maskedDataFifo_V_1_dout.read().range(87, 80);
        select_ln321_reg_20263 = select_ln321_fu_805_p3.read();
        select_ln422_8_reg_20274 = select_ln422_8_fu_879_p3.read();
        tmp_176_reg_20268 = tx_maskedDataFifo_V_2_dout.read().range(1, 1);
        tmp_178_reg_20284 = tx_maskedDataFifo_V_2_dout.read().range(2, 2);
        tmp_180_reg_20295 = tx_maskedDataFifo_V_2_dout.read().range(3, 3);
        tmp_182_reg_20306 = tx_maskedDataFifo_V_2_dout.read().range(4, 4);
        tmp_184_reg_20317 = tx_maskedDataFifo_V_2_dout.read().range(5, 5);
        tmp_186_reg_20328 = tx_maskedDataFifo_V_2_dout.read().range(6, 6);
        tmp_188_reg_20339 = tx_maskedDataFifo_V_2_dout.read().range(7, 7);
        tmp_190_reg_20350 = tx_maskedDataFifo_V_2_dout.read().range(8, 8);
        tmp_192_reg_20361 = tx_maskedDataFifo_V_2_dout.read().range(9, 9);
        tmp_194_reg_20372 = tx_maskedDataFifo_V_2_dout.read().range(10, 10);
        tmp_196_reg_20383 = tx_maskedDataFifo_V_2_dout.read().range(11, 11);
        tmp_198_reg_20394 = tx_maskedDataFifo_V_2_dout.read().range(12, 12);
        tmp_200_reg_20405 = tx_maskedDataFifo_V_2_dout.read().range(13, 13);
        tmp_202_reg_20416 = tx_maskedDataFifo_V_2_dout.read().range(14, 14);
        tmp_204_reg_20427 = tx_maskedDataFifo_V_2_dout.read().range(15, 15);
        tmp_206_reg_20438 = tx_maskedDataFifo_V_2_dout.read().range(16, 16);
        tmp_208_reg_20449 = tx_maskedDataFifo_V_2_dout.read().range(17, 17);
        tmp_210_reg_20460 = tx_maskedDataFifo_V_2_dout.read().range(18, 18);
        tmp_212_reg_20471 = tx_maskedDataFifo_V_2_dout.read().range(19, 19);
        tmp_214_reg_20482 = tx_maskedDataFifo_V_2_dout.read().range(20, 20);
        tmp_216_reg_20493 = tx_maskedDataFifo_V_2_dout.read().range(21, 21);
        tmp_218_reg_20504 = tx_maskedDataFifo_V_2_dout.read().range(22, 22);
        tmp_220_reg_20515 = tx_maskedDataFifo_V_2_dout.read().range(23, 23);
        tmp_222_reg_20526 = tx_maskedDataFifo_V_2_dout.read().range(24, 24);
        tmp_224_reg_20537 = tx_maskedDataFifo_V_2_dout.read().range(25, 25);
        tmp_226_reg_20548 = tx_maskedDataFifo_V_2_dout.read().range(26, 26);
        tmp_228_reg_20559 = tx_maskedDataFifo_V_2_dout.read().range(27, 27);
        tmp_230_reg_20570 = tx_maskedDataFifo_V_2_dout.read().range(28, 28);
        tmp_232_reg_20581 = tx_maskedDataFifo_V_2_dout.read().range(29, 29);
        tmp_234_reg_20592 = tx_maskedDataFifo_V_2_dout.read().range(30, 30);
        tmp_236_reg_20603 = tx_maskedDataFifo_V_2_dout.read().range(31, 31);
        tmp_data_V_reg_20224 = tx_maskedDataFifo_V_1_dout.read();
        trunc_ln321_reg_20258 = trunc_ln321_fu_509_p1.read();
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage1.read()) && esl_seteq<1,1,1>(crcState_load_reg_20216.read(), ap_const_lv1_1) && esl_seteq<1,1,1>(ap_block_pp0_stage1_11001.read(), ap_const_boolean_0))) {
        lshr_ln452_13_reg_20669 = select_ln446_13_fu_1983_p3.read().range(31, 1);
        p_Result_319_10_i_reg_20779 = currWord_data_V.read().range(351, 344);
        p_Result_319_11_i_reg_20790 = currWord_data_V.read().range(359, 352);
        p_Result_319_12_i_reg_20801 = currWord_data_V.read().range(367, 360);
        p_Result_319_13_i_reg_20812 = currWord_data_V.read().range(375, 368);
        p_Result_319_14_i_reg_20823 = currWord_data_V.read().range(383, 376);
        p_Result_319_15_i_reg_20834 = currWord_data_V.read().range(391, 384);
        p_Result_319_16_i_reg_20845 = currWord_data_V.read().range(399, 392);
        p_Result_319_17_i_reg_20856 = currWord_data_V.read().range(407, 400);
        p_Result_319_18_i_reg_20867 = currWord_data_V.read().range(415, 408);
        p_Result_319_19_i_reg_20878 = currWord_data_V.read().range(423, 416);
        p_Result_319_20_i_reg_20889 = currWord_data_V.read().range(431, 424);
        p_Result_319_21_i_reg_20900 = currWord_data_V.read().range(439, 432);
        p_Result_319_22_i_reg_20911 = currWord_data_V.read().range(447, 440);
        p_Result_319_23_i_reg_20922 = currWord_data_V.read().range(455, 448);
        p_Result_319_24_i_reg_20933 = currWord_data_V.read().range(463, 456);
        p_Result_319_25_i_reg_20944 = currWord_data_V.read().range(471, 464);
        p_Result_319_26_i_reg_20955 = currWord_data_V.read().range(479, 472);
        p_Result_319_27_i_reg_20966 = currWord_data_V.read().range(487, 480);
        p_Result_319_28_i_reg_20977 = currWord_data_V.read().range(495, 488);
        p_Result_319_29_i_reg_20988 = currWord_data_V.read().range(503, 496);
        p_Result_319_2_i_reg_20680 = currWord_data_V.read().range(279, 272);
        p_Result_319_30_i_reg_20999 = currWord_data_V.read().range(511, 504);
        p_Result_319_3_i_reg_20691 = currWord_data_V.read().range(287, 280);
        p_Result_319_4_i_reg_20702 = currWord_data_V.read().range(295, 288);
        p_Result_319_5_i_reg_20713 = currWord_data_V.read().range(303, 296);
        p_Result_319_6_i_reg_20724 = currWord_data_V.read().range(311, 304);
        p_Result_319_7_i_reg_20735 = currWord_data_V.read().range(319, 312);
        p_Result_319_8_i_reg_20746 = currWord_data_V.read().range(327, 320);
        p_Result_319_9_i_reg_20757 = currWord_data_V.read().range(335, 328);
        p_Result_319_i_448_reg_20768 = currWord_data_V.read().range(343, 336);
        p_Val2_74_reg_20614 = currWord_data_V.read();
        select_ln446_13_reg_20664 = select_ln446_13_fu_1983_p3.read();
        select_ln791_reg_20653 = select_ln791_fu_1749_p3.read();
        tmp_112_reg_20648 = currWord_keep_V.read().range(32, 32);
        tmp_114_reg_20658 = currWord_keep_V.read().range(33, 33);
        tmp_116_reg_20674 = currWord_keep_V.read().range(34, 34);
        tmp_118_reg_20685 = currWord_keep_V.read().range(35, 35);
        tmp_120_reg_20696 = currWord_keep_V.read().range(36, 36);
        tmp_122_reg_20707 = currWord_keep_V.read().range(37, 37);
        tmp_124_reg_20718 = currWord_keep_V.read().range(38, 38);
        tmp_126_reg_20729 = currWord_keep_V.read().range(39, 39);
        tmp_128_reg_20740 = currWord_keep_V.read().range(40, 40);
        tmp_130_reg_20751 = currWord_keep_V.read().range(41, 41);
        tmp_132_reg_20762 = currWord_keep_V.read().range(42, 42);
        tmp_134_reg_20773 = currWord_keep_V.read().range(43, 43);
        tmp_136_reg_20784 = currWord_keep_V.read().range(44, 44);
        tmp_138_reg_20795 = currWord_keep_V.read().range(45, 45);
        tmp_140_reg_20806 = currWord_keep_V.read().range(46, 46);
        tmp_142_reg_20817 = currWord_keep_V.read().range(47, 47);
        tmp_144_reg_20828 = currWord_keep_V.read().range(48, 48);
        tmp_146_reg_20839 = currWord_keep_V.read().range(49, 49);
        tmp_148_reg_20850 = currWord_keep_V.read().range(50, 50);
        tmp_150_reg_20861 = currWord_keep_V.read().range(51, 51);
        tmp_152_reg_20872 = currWord_keep_V.read().range(52, 52);
        tmp_154_reg_20883 = currWord_keep_V.read().range(53, 53);
        tmp_156_reg_20894 = currWord_keep_V.read().range(54, 54);
        tmp_158_reg_20905 = currWord_keep_V.read().range(55, 55);
        tmp_160_reg_20916 = currWord_keep_V.read().range(56, 56);
        tmp_162_reg_20927 = currWord_keep_V.read().range(57, 57);
        tmp_164_reg_20938 = currWord_keep_V.read().range(58, 58);
        tmp_166_reg_20949 = currWord_keep_V.read().range(59, 59);
        tmp_168_reg_20960 = currWord_keep_V.read().range(60, 60);
        tmp_170_reg_20971 = currWord_keep_V.read().range(61, 61);
        tmp_172_reg_20982 = currWord_keep_V.read().range(62, 62);
        tmp_174_reg_20993 = currWord_keep_V.read().range(63, 63);
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage5.read()) && esl_seteq<1,1,1>(ap_block_pp0_stage5_11001.read(), ap_const_boolean_0) && esl_seteq<1,1,1>(crcState_load_reg_20216.read(), ap_const_lv1_1) && esl_seteq<1,1,1>(ap_const_lv1_1, tmp_156_reg_20894.read()))) {
        lshr_ln452_175_reg_21140 = xor_ln442_22_fu_14334_p2.read().range(31, 1);
    }
    if ((esl_seteq<1,1,1>(crcState_load_reg_20216.read(), ap_const_lv1_1) && esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage2.read()) && esl_seteq<1,1,1>(ap_block_pp0_stage2_11001.read(), ap_const_boolean_0) && esl_seteq<1,1,1>(ap_const_lv1_1, tmp_118_reg_20685.read()))) {
        lshr_ln452_27_reg_21034 = select_ln446_27_fu_3574_p3.read().range(31, 1);
        select_ln446_27_reg_21029 = select_ln446_27_fu_3574_p3.read();
    }
    if ((esl_seteq<1,1,1>(crcState_load_reg_20216.read(), ap_const_lv1_1) && esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage3.read()) && esl_seteq<1,1,1>(ap_block_pp0_stage3_11001.read(), ap_const_boolean_0) && esl_seteq<1,1,1>(ap_const_lv1_1, tmp_122_reg_20707.read()))) {
        lshr_ln452_41_reg_21069 = select_ln446_41_fu_4594_p3.read().range(31, 1);
        select_ln446_41_reg_21064 = select_ln446_41_fu_4594_p3.read();
    }
    if ((esl_seteq<1,1,1>(crcState_load_reg_20216.read(), ap_const_lv1_1) && esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage4.read()) && esl_seteq<1,1,1>(ap_block_pp0_stage4_11001.read(), ap_const_boolean_0) && esl_seteq<1,1,1>(ap_const_lv1_1, tmp_134_reg_20773.read()))) {
        lshr_ln452_91_reg_21104 = select_ln446_91_fu_8248_p3.read().range(31, 1);
        select_ln446_91_reg_21099 = select_ln446_91_fu_8248_p3.read();
    }
    if ((esl_seteq<1,1,1>(crcState_load_reg_20216.read(), ap_const_lv1_1) && esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage3.read()) && esl_seteq<1,1,1>(ap_block_pp0_stage3_11001.read(), ap_const_boolean_0))) {
        or_ln791_11_reg_21074 = or_ln791_11_fu_4626_p2.read();
        select_ln791_4_reg_21059 = select_ln791_4_fu_4509_p3.read();
    }
    if ((esl_seteq<1,1,1>(crcState_load_reg_20216.read(), ap_const_lv1_1) && esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage4.read()) && esl_seteq<1,1,1>(ap_block_pp0_stage4_11001.read(), ap_const_boolean_0))) {
        or_ln791_19_reg_21109 = or_ln791_19_fu_8300_p2.read();
        select_ln791_10_reg_21094 = select_ln791_10_fu_8099_p3.read();
    }
    if ((esl_seteq<1,1,1>(ap_const_lv1_0, crcState_load_reg_20216.read()) && esl_seteq<1,1,1>(tmp_reg_20220.read(), ap_const_lv1_1) && esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage2.read()) && esl_seteq<1,1,1>(ap_block_pp0_stage2_11001.read(), ap_const_boolean_0))) {
        or_ln791_3_reg_21019 = or_ln791_3_fu_3083_p2.read();
        select_ln791_32_reg_21004 = select_ln791_32_fu_2753_p3.read();
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage5.read()) && esl_seteq<1,1,1>(ap_block_pp0_stage5_11001.read(), ap_const_boolean_0) && esl_seteq<1,1,1>(ap_const_lv1_0, crcState_load_reg_20216.read()) && esl_seteq<1,1,1>(tmp_reg_20220.read(), ap_const_lv1_1))) {
        or_ln791_4_reg_21129 = or_ln791_4_fu_11354_p2.read();
        select_ln791_51_reg_21114 = select_ln791_51_fu_11081_p3.read();
    }
    if ((esl_seteq<1,1,1>(crcState_load_reg_20216.read(), ap_const_lv1_1) && esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage2.read()) && esl_seteq<1,1,1>(ap_block_pp0_stage2_11001.read(), ap_const_boolean_0))) {
        or_ln791_7_reg_21039 = or_ln791_7_fu_3600_p2.read();
        select_ln791_2_reg_21024 = select_ln791_2_fu_3425_p3.read();
    }
    if ((esl_seteq<1,1,1>(ap_const_lv1_0, crcState_load_reg_20216.read()) && esl_seteq<1,1,1>(tmp_reg_20220.read(), ap_const_lv1_1) && esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage3.read()) && esl_seteq<1,1,1>(ap_block_pp0_stage3_11001.read(), ap_const_boolean_0))) {
        select_ln791_34_reg_21044 = select_ln791_34_fu_3910_p3.read();
    }
    if ((esl_seteq<1,1,1>(ap_const_lv1_0, crcState_load_reg_20216.read()) && esl_seteq<1,1,1>(tmp_reg_20220.read(), ap_const_lv1_1) && esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage4.read()) && esl_seteq<1,1,1>(ap_block_pp0_stage4_11001.read(), ap_const_boolean_0))) {
        select_ln791_41_reg_21079 = select_ln791_41_fu_6424_p3.read();
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage0.read()) && esl_seteq<1,1,1>(ap_block_pp0_stage0_11001.read(), ap_const_boolean_0) && esl_seteq<1,1,1>(ap_const_lv1_0, crcState_load_load_fu_483_p1.read()))) {
        tmp_reg_20220 = tmp_nbreadreq_fu_404_p5.read();
    }
}

void compute_crc32::thread_ap_NS_fsm() {
    switch (ap_CS_fsm.read().to_uint64()) {
        case 1 : 
            if ((esl_seteq<1,1,1>(ap_block_pp0_stage0_subdone.read(), ap_const_boolean_0) && esl_seteq<1,1,1>(ap_reset_idle_pp0.read(), ap_const_logic_0) && !(esl_seteq<1,1,1>(ap_const_logic_0, ap_start.read()) && esl_seteq<1,1,1>(ap_const_logic_1, ap_idle_pp0_1to1.read())))) {
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            } else if ((esl_seteq<1,1,1>(ap_block_pp0_stage0_subdone.read(), ap_const_boolean_0) && esl_seteq<1,1,1>(ap_const_logic_1, ap_reset_idle_pp0.read()))) {
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            } else {
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            }
            break;
        case 2 : 
            if (esl_seteq<1,1,1>(ap_block_pp0_stage1_subdone.read(), ap_const_boolean_0)) {
                ap_NS_fsm = ap_ST_fsm_pp0_stage2;
            } else {
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            }
            break;
        case 4 : 
            if (esl_seteq<1,1,1>(ap_block_pp0_stage2_subdone.read(), ap_const_boolean_0)) {
                ap_NS_fsm = ap_ST_fsm_pp0_stage3;
            } else {
                ap_NS_fsm = ap_ST_fsm_pp0_stage2;
            }
            break;
        case 8 : 
            if (esl_seteq<1,1,1>(ap_block_pp0_stage3_subdone.read(), ap_const_boolean_0)) {
                ap_NS_fsm = ap_ST_fsm_pp0_stage4;
            } else {
                ap_NS_fsm = ap_ST_fsm_pp0_stage3;
            }
            break;
        case 16 : 
            if (esl_seteq<1,1,1>(ap_block_pp0_stage4_subdone.read(), ap_const_boolean_0)) {
                ap_NS_fsm = ap_ST_fsm_pp0_stage5;
            } else {
                ap_NS_fsm = ap_ST_fsm_pp0_stage4;
            }
            break;
        case 32 : 
            if (esl_seteq<1,1,1>(ap_block_pp0_stage5_subdone.read(), ap_const_boolean_0)) {
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            } else {
                ap_NS_fsm = ap_ST_fsm_pp0_stage5;
            }
            break;
        default : 
            ap_NS_fsm = "XXXXXX";
            break;
    }
}

}

