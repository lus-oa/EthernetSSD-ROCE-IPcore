-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2019.1
-- Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity process_ipv4_512_s is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    rx_crc2ipFifo_V_data_dout : IN STD_LOGIC_VECTOR (511 downto 0);
    rx_crc2ipFifo_V_data_empty_n : IN STD_LOGIC;
    rx_crc2ipFifo_V_data_read : OUT STD_LOGIC;
    rx_crc2ipFifo_V_keep_dout : IN STD_LOGIC_VECTOR (63 downto 0);
    rx_crc2ipFifo_V_keep_empty_n : IN STD_LOGIC;
    rx_crc2ipFifo_V_keep_read : OUT STD_LOGIC;
    rx_crc2ipFifo_V_last_dout : IN STD_LOGIC_VECTOR (0 downto 0);
    rx_crc2ipFifo_V_last_empty_n : IN STD_LOGIC;
    rx_crc2ipFifo_V_last_read : OUT STD_LOGIC;
    rx_process2dropFifo_1_5_din : OUT STD_LOGIC_VECTOR (511 downto 0);
    rx_process2dropFifo_1_5_full_n : IN STD_LOGIC;
    rx_process2dropFifo_1_5_write : OUT STD_LOGIC;
    rx_process2dropFifo_2_4_din : OUT STD_LOGIC_VECTOR (63 downto 0);
    rx_process2dropFifo_2_4_full_n : IN STD_LOGIC;
    rx_process2dropFifo_2_4_write : OUT STD_LOGIC;
    rx_process2dropFifo_s_6_din : OUT STD_LOGIC_VECTOR (0 downto 0);
    rx_process2dropFifo_s_6_full_n : IN STD_LOGIC;
    rx_process2dropFifo_s_6_write : OUT STD_LOGIC;
    rx_process2dropLengt_1_din : OUT STD_LOGIC_VECTOR (3 downto 0);
    rx_process2dropLengt_1_full_n : IN STD_LOGIC;
    rx_process2dropLengt_1_write : OUT STD_LOGIC;
    rx_ip2udpMetaFifo_V_s_din : OUT STD_LOGIC_VECTOR (31 downto 0);
    rx_ip2udpMetaFifo_V_s_full_n : IN STD_LOGIC;
    rx_ip2udpMetaFifo_V_s_write : OUT STD_LOGIC;
    rx_ip2udpMetaFifo_V_1_din : OUT STD_LOGIC_VECTOR (15 downto 0);
    rx_ip2udpMetaFifo_V_1_full_n : IN STD_LOGIC;
    rx_ip2udpMetaFifo_V_1_write : OUT STD_LOGIC );
end;


architecture behav of process_ipv4_512_s is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv16_0 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
    constant ap_const_lv9_0 : STD_LOGIC_VECTOR (8 downto 0) := "000000000";
    constant ap_const_lv25_9F : STD_LOGIC_VECTOR (24 downto 0) := "0000000000000000010011111";
    constant ap_const_lv159_lc_2 : STD_LOGIC_VECTOR (158 downto 0) := "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv32_9F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000010011111";
    constant ap_const_lv160_lc_3 : STD_LOGIC_VECTOR (159 downto 0) := "1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv160_lc_4 : STD_LOGIC_VECTOR (159 downto 0) := "1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111";
    constant ap_const_lv160_lc_5 : STD_LOGIC_VECTOR (159 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001";
    constant ap_const_lv16_1 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000001";
    constant ap_const_lv32_60 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001100000";
    constant ap_const_lv32_7F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001111111";
    constant ap_const_lv32_18 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011000";
    constant ap_const_lv32_1F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011111";
    constant ap_const_lv32_10 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010000";
    constant ap_const_lv32_17 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010111";

    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal io_acc_block_signal_op5 : STD_LOGIC;
    signal tmp_nbreadreq_fu_98_p5 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal io_acc_block_signal_op57 : STD_LOGIC;
    signal tmp_reg_427 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln75_reg_449 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_predicate_op57_write_state2 : BOOLEAN;
    signal metaWritten_3_load_reg_453 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_predicate_op60_write_state2 : BOOLEAN;
    signal io_acc_block_signal_op65 : STD_LOGIC;
    signal ap_predicate_op65_write_state2 : BOOLEAN;
    signal ap_block_state2_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal header_ready : STD_LOGIC_VECTOR (0 downto 0) := "0";
    signal header_idx_3 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
    signal header_header_V_6 : STD_LOGIC_VECTOR (159 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000001000101";
    signal metaWritten_3 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    signal rx_crc2ipFifo_V_data_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal rx_crc2ipFifo_V_keep_blk_n : STD_LOGIC;
    signal rx_crc2ipFifo_V_last_blk_n : STD_LOGIC;
    signal rx_process2dropFifo_1_5_blk_n : STD_LOGIC;
    signal rx_process2dropFifo_2_4_blk_n : STD_LOGIC;
    signal rx_process2dropFifo_s_6_blk_n : STD_LOGIC;
    signal rx_process2dropLengt_1_blk_n : STD_LOGIC;
    signal rx_ip2udpMetaFifo_V_s_blk_n : STD_LOGIC;
    signal rx_ip2udpMetaFifo_V_1_blk_n : STD_LOGIC;
    signal tmp_data_V_reg_431 : STD_LOGIC_VECTOR (511 downto 0);
    signal tmp_keep_V_reg_436 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_last_V_reg_441 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln75_fu_324_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal metaWritten_3_load_load_fu_330_p1 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln143_fu_354_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal ap_phi_mux_phi_ln75_phi_fu_153_p4 : STD_LOGIC_VECTOR (15 downto 0);
    signal ap_phi_reg_pp0_iter0_phi_ln75_reg_150 : STD_LOGIC_VECTOR (15 downto 0);
    signal header_ready_load_load_fu_196_p1 : STD_LOGIC_VECTOR (0 downto 0);
    signal add_ln69_fu_317_p2 : STD_LOGIC_VECTOR (15 downto 0);
    signal ap_phi_mux_write_flag_1_i_i_phi_fu_162_p4 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_phi_reg_pp0_iter0_write_flag_1_i_i_reg_159 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_phi_mux_metaWritten_5_flag_1_phi_fu_173_p6 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_phi_reg_pp0_iter0_metaWritten_5_flag_1_reg_170 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln143_fu_340_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln143_fu_346_p3 : STD_LOGIC_VECTOR (15 downto 0);
    signal p_Result_s_fu_305_p2 : STD_LOGIC_VECTOR (159 downto 0);
    signal xor_ln143_fu_334_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal Lo_assign_fu_205_p3 : STD_LOGIC_VECTOR (24 downto 0);
    signal trunc_ln414_fu_227_p1 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln414_fu_221_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal st3_fu_231_p3 : STD_LOGIC_VECTOR (159 downto 0);
    signal tmp_V_4_fu_213_p1 : STD_LOGIC_VECTOR (159 downto 0);
    signal select_ln414_fu_239_p3 : STD_LOGIC_VECTOR (159 downto 0);
    signal tmp_40_fu_247_p4 : STD_LOGIC_VECTOR (159 downto 0);
    signal select_ln414_15_fu_265_p3 : STD_LOGIC_VECTOR (159 downto 0);
    signal select_ln414_16_fu_273_p3 : STD_LOGIC_VECTOR (159 downto 0);
    signal and_ln414_fu_281_p2 : STD_LOGIC_VECTOR (159 downto 0);
    signal xor_ln414_fu_287_p2 : STD_LOGIC_VECTOR (159 downto 0);
    signal select_ln414_14_fu_257_p3 : STD_LOGIC_VECTOR (159 downto 0);
    signal and_ln414_10_fu_293_p2 : STD_LOGIC_VECTOR (159 downto 0);
    signal and_ln414_11_fu_299_p2 : STD_LOGIC_VECTOR (159 downto 0);
    signal p_Result_128_1_i_i_fu_408_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal p_Result_128_i_i_i_fu_398_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_idle_pp0_0to0 : STD_LOGIC;
    signal ap_reset_idle_pp0 : STD_LOGIC;
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_condition_130 : BOOLEAN;


begin




    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
                    ap_enable_reg_pp0_iter1 <= ap_start;
                end if; 
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((header_ready_load_load_fu_196_p1 = ap_const_lv1_0) and (tmp_nbreadreq_fu_98_p5 = ap_const_lv1_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                header_header_V_6 <= p_Result_s_fu_305_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((tmp_nbreadreq_fu_98_p5 = ap_const_lv1_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                header_idx_3 <= select_ln143_fu_346_p3;
                header_ready <= and_ln143_fu_340_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((or_ln143_fu_354_p2 = ap_const_lv1_1) and (tmp_nbreadreq_fu_98_p5 = ap_const_lv1_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                metaWritten_3 <= xor_ln143_fu_334_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((tmp_nbreadreq_fu_98_p5 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                metaWritten_3_load_reg_453 <= metaWritten_3;
                or_ln75_reg_449 <= or_ln75_fu_324_p2;
                tmp_data_V_reg_431 <= rx_crc2ipFifo_V_data_dout;
                tmp_keep_V_reg_436 <= rx_crc2ipFifo_V_keep_dout;
                tmp_last_V_reg_441 <= rx_crc2ipFifo_V_last_dout;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                tmp_reg_427 <= tmp_nbreadreq_fu_98_p5;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_CS_fsm, ap_block_pp0_stage0_subdone, ap_reset_idle_pp0)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_pp0_stage0 => 
                ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    Lo_assign_fu_205_p3 <= (header_idx_3 & ap_const_lv9_0);
    add_ln69_fu_317_p2 <= std_logic_vector(unsigned(ap_const_lv16_1) + unsigned(header_idx_3));
    and_ln143_fu_340_p2 <= (xor_ln143_fu_334_p2 and or_ln75_fu_324_p2);
    and_ln414_10_fu_293_p2 <= (xor_ln414_fu_287_p2 and header_header_V_6);
    and_ln414_11_fu_299_p2 <= (select_ln414_14_fu_257_p3 and and_ln414_fu_281_p2);
    and_ln414_fu_281_p2 <= (select_ln414_16_fu_273_p3 and select_ln414_15_fu_265_p3);
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_01001_assign_proc : process(ap_start, ap_done_reg, ap_enable_reg_pp0_iter1, io_acc_block_signal_op5, tmp_nbreadreq_fu_98_p5, io_acc_block_signal_op57, ap_predicate_op57_write_state2, rx_process2dropLengt_1_full_n, ap_predicate_op60_write_state2, io_acc_block_signal_op65, ap_predicate_op65_write_state2)
    begin
                ap_block_pp0_stage0_01001 <= ((ap_done_reg = ap_const_logic_1) or ((ap_start = ap_const_logic_1) and ((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1) or ((tmp_nbreadreq_fu_98_p5 = ap_const_lv1_1) and (io_acc_block_signal_op5 = ap_const_logic_0)))) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (((rx_process2dropLengt_1_full_n = ap_const_logic_0) and (ap_predicate_op60_write_state2 = ap_const_boolean_1)) or ((io_acc_block_signal_op57 = ap_const_logic_0) and (ap_predicate_op57_write_state2 = ap_const_boolean_1)) or ((io_acc_block_signal_op65 = ap_const_logic_0) and (ap_predicate_op65_write_state2 = ap_const_boolean_1)))));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(ap_start, ap_done_reg, ap_enable_reg_pp0_iter1, io_acc_block_signal_op5, tmp_nbreadreq_fu_98_p5, io_acc_block_signal_op57, ap_predicate_op57_write_state2, rx_process2dropLengt_1_full_n, ap_predicate_op60_write_state2, io_acc_block_signal_op65, ap_predicate_op65_write_state2)
    begin
                ap_block_pp0_stage0_11001 <= ((ap_done_reg = ap_const_logic_1) or ((ap_start = ap_const_logic_1) and ((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1) or ((tmp_nbreadreq_fu_98_p5 = ap_const_lv1_1) and (io_acc_block_signal_op5 = ap_const_logic_0)))) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (((rx_process2dropLengt_1_full_n = ap_const_logic_0) and (ap_predicate_op60_write_state2 = ap_const_boolean_1)) or ((io_acc_block_signal_op57 = ap_const_logic_0) and (ap_predicate_op57_write_state2 = ap_const_boolean_1)) or ((io_acc_block_signal_op65 = ap_const_logic_0) and (ap_predicate_op65_write_state2 = ap_const_boolean_1)))));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(ap_start, ap_done_reg, ap_enable_reg_pp0_iter1, io_acc_block_signal_op5, tmp_nbreadreq_fu_98_p5, io_acc_block_signal_op57, ap_predicate_op57_write_state2, rx_process2dropLengt_1_full_n, ap_predicate_op60_write_state2, io_acc_block_signal_op65, ap_predicate_op65_write_state2)
    begin
                ap_block_pp0_stage0_subdone <= ((ap_done_reg = ap_const_logic_1) or ((ap_start = ap_const_logic_1) and ((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1) or ((tmp_nbreadreq_fu_98_p5 = ap_const_lv1_1) and (io_acc_block_signal_op5 = ap_const_logic_0)))) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (((rx_process2dropLengt_1_full_n = ap_const_logic_0) and (ap_predicate_op60_write_state2 = ap_const_boolean_1)) or ((io_acc_block_signal_op57 = ap_const_logic_0) and (ap_predicate_op57_write_state2 = ap_const_boolean_1)) or ((io_acc_block_signal_op65 = ap_const_logic_0) and (ap_predicate_op65_write_state2 = ap_const_boolean_1)))));
    end process;


    ap_block_state1_pp0_stage0_iter0_assign_proc : process(ap_start, ap_done_reg, io_acc_block_signal_op5, tmp_nbreadreq_fu_98_p5)
    begin
                ap_block_state1_pp0_stage0_iter0 <= ((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1) or ((tmp_nbreadreq_fu_98_p5 = ap_const_lv1_1) and (io_acc_block_signal_op5 = ap_const_logic_0)));
    end process;


    ap_block_state2_pp0_stage0_iter1_assign_proc : process(io_acc_block_signal_op57, ap_predicate_op57_write_state2, rx_process2dropLengt_1_full_n, ap_predicate_op60_write_state2, io_acc_block_signal_op65, ap_predicate_op65_write_state2)
    begin
                ap_block_state2_pp0_stage0_iter1 <= (((rx_process2dropLengt_1_full_n = ap_const_logic_0) and (ap_predicate_op60_write_state2 = ap_const_boolean_1)) or ((io_acc_block_signal_op57 = ap_const_logic_0) and (ap_predicate_op57_write_state2 = ap_const_boolean_1)) or ((io_acc_block_signal_op65 = ap_const_logic_0) and (ap_predicate_op65_write_state2 = ap_const_boolean_1)));
    end process;


    ap_condition_130_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, tmp_nbreadreq_fu_98_p5, ap_block_pp0_stage0)
    begin
                ap_condition_130 <= ((tmp_nbreadreq_fu_98_p5 = ap_const_lv1_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0));
    end process;


    ap_done_assign_proc : process(ap_done_reg, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_done_reg;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);
    ap_enable_reg_pp0_iter0 <= ap_start;

    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_idle_pp0)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_idle_pp0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_0to0_assign_proc : process(ap_enable_reg_pp0_iter0)
    begin
        if ((ap_enable_reg_pp0_iter0 = ap_const_logic_0)) then 
            ap_idle_pp0_0to0 <= ap_const_logic_1;
        else 
            ap_idle_pp0_0to0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_phi_mux_metaWritten_5_flag_1_phi_fu_173_p6_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, tmp_nbreadreq_fu_98_p5, ap_block_pp0_stage0, or_ln75_fu_324_p2, metaWritten_3_load_load_fu_330_p1, ap_phi_reg_pp0_iter0_metaWritten_5_flag_1_reg_170)
    begin
        if (((metaWritten_3_load_load_fu_330_p1 = ap_const_lv1_0) and (or_ln75_fu_324_p2 = ap_const_lv1_1) and (tmp_nbreadreq_fu_98_p5 = ap_const_lv1_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            ap_phi_mux_metaWritten_5_flag_1_phi_fu_173_p6 <= ap_const_lv1_1;
        elsif ((((metaWritten_3_load_load_fu_330_p1 = ap_const_lv1_1) and (or_ln75_fu_324_p2 = ap_const_lv1_1) and (tmp_nbreadreq_fu_98_p5 = ap_const_lv1_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0)) or ((or_ln75_fu_324_p2 = ap_const_lv1_0) and (tmp_nbreadreq_fu_98_p5 = ap_const_lv1_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0)))) then 
            ap_phi_mux_metaWritten_5_flag_1_phi_fu_173_p6 <= ap_const_lv1_0;
        else 
            ap_phi_mux_metaWritten_5_flag_1_phi_fu_173_p6 <= ap_phi_reg_pp0_iter0_metaWritten_5_flag_1_reg_170;
        end if; 
    end process;


    ap_phi_mux_phi_ln75_phi_fu_153_p4_assign_proc : process(header_idx_3, ap_phi_reg_pp0_iter0_phi_ln75_reg_150, header_ready_load_load_fu_196_p1, add_ln69_fu_317_p2, ap_condition_130)
    begin
        if ((ap_const_boolean_1 = ap_condition_130)) then
            if ((header_ready_load_load_fu_196_p1 = ap_const_lv1_0)) then 
                ap_phi_mux_phi_ln75_phi_fu_153_p4 <= add_ln69_fu_317_p2;
            elsif ((header_ready_load_load_fu_196_p1 = ap_const_lv1_1)) then 
                ap_phi_mux_phi_ln75_phi_fu_153_p4 <= header_idx_3;
            else 
                ap_phi_mux_phi_ln75_phi_fu_153_p4 <= ap_phi_reg_pp0_iter0_phi_ln75_reg_150;
            end if;
        else 
            ap_phi_mux_phi_ln75_phi_fu_153_p4 <= ap_phi_reg_pp0_iter0_phi_ln75_reg_150;
        end if; 
    end process;


    ap_phi_mux_write_flag_1_i_i_phi_fu_162_p4_assign_proc : process(header_ready_load_load_fu_196_p1, ap_phi_reg_pp0_iter0_write_flag_1_i_i_reg_159, ap_condition_130)
    begin
        if ((ap_const_boolean_1 = ap_condition_130)) then
            if ((header_ready_load_load_fu_196_p1 = ap_const_lv1_0)) then 
                ap_phi_mux_write_flag_1_i_i_phi_fu_162_p4 <= ap_const_lv1_1;
            elsif ((header_ready_load_load_fu_196_p1 = ap_const_lv1_1)) then 
                ap_phi_mux_write_flag_1_i_i_phi_fu_162_p4 <= ap_const_lv1_0;
            else 
                ap_phi_mux_write_flag_1_i_i_phi_fu_162_p4 <= ap_phi_reg_pp0_iter0_write_flag_1_i_i_reg_159;
            end if;
        else 
            ap_phi_mux_write_flag_1_i_i_phi_fu_162_p4 <= ap_phi_reg_pp0_iter0_write_flag_1_i_i_reg_159;
        end if; 
    end process;

    ap_phi_reg_pp0_iter0_metaWritten_5_flag_1_reg_170 <= "X";
    ap_phi_reg_pp0_iter0_phi_ln75_reg_150 <= "XXXXXXXXXXXXXXXX";
    ap_phi_reg_pp0_iter0_write_flag_1_i_i_reg_159 <= "X";

    ap_predicate_op57_write_state2_assign_proc : process(tmp_reg_427, or_ln75_reg_449)
    begin
                ap_predicate_op57_write_state2 <= ((or_ln75_reg_449 = ap_const_lv1_1) and (tmp_reg_427 = ap_const_lv1_1));
    end process;


    ap_predicate_op60_write_state2_assign_proc : process(tmp_reg_427, or_ln75_reg_449, metaWritten_3_load_reg_453)
    begin
                ap_predicate_op60_write_state2 <= ((metaWritten_3_load_reg_453 = ap_const_lv1_0) and (or_ln75_reg_449 = ap_const_lv1_1) and (tmp_reg_427 = ap_const_lv1_1));
    end process;


    ap_predicate_op65_write_state2_assign_proc : process(tmp_reg_427, or_ln75_reg_449, metaWritten_3_load_reg_453)
    begin
                ap_predicate_op65_write_state2 <= ((metaWritten_3_load_reg_453 = ap_const_lv1_0) and (or_ln75_reg_449 = ap_const_lv1_1) and (tmp_reg_427 = ap_const_lv1_1));
    end process;


    ap_ready_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_reset_idle_pp0_assign_proc : process(ap_start, ap_idle_pp0_0to0)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_idle_pp0_0to0 = ap_const_logic_1))) then 
            ap_reset_idle_pp0 <= ap_const_logic_1;
        else 
            ap_reset_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;

    header_ready_load_load_fu_196_p1 <= header_ready;
    icmp_ln414_fu_221_p2 <= "1" when (unsigned(Lo_assign_fu_205_p3) > unsigned(ap_const_lv25_9F)) else "0";
    io_acc_block_signal_op5 <= (rx_crc2ipFifo_V_last_empty_n and rx_crc2ipFifo_V_keep_empty_n and rx_crc2ipFifo_V_data_empty_n);
    io_acc_block_signal_op57 <= (rx_process2dropFifo_s_6_full_n and rx_process2dropFifo_2_4_full_n and rx_process2dropFifo_1_5_full_n);
    io_acc_block_signal_op65 <= (rx_ip2udpMetaFifo_V_s_full_n and rx_ip2udpMetaFifo_V_1_full_n);
    metaWritten_3_load_load_fu_330_p1 <= metaWritten_3;
    or_ln143_fu_354_p2 <= (rx_crc2ipFifo_V_last_dout or ap_phi_mux_metaWritten_5_flag_1_phi_fu_173_p6);
    or_ln75_fu_324_p2 <= (header_ready or ap_phi_mux_write_flag_1_i_i_phi_fu_162_p4);
    p_Result_128_1_i_i_fu_408_p4 <= header_header_V_6(23 downto 16);
    p_Result_128_i_i_i_fu_398_p4 <= header_header_V_6(31 downto 24);
    p_Result_s_fu_305_p2 <= (and_ln414_11_fu_299_p2 or and_ln414_10_fu_293_p2);

    rx_crc2ipFifo_V_data_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_pp0_stage0, rx_crc2ipFifo_V_data_empty_n, tmp_nbreadreq_fu_98_p5, ap_block_pp0_stage0)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (tmp_nbreadreq_fu_98_p5 = ap_const_lv1_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            rx_crc2ipFifo_V_data_blk_n <= rx_crc2ipFifo_V_data_empty_n;
        else 
            rx_crc2ipFifo_V_data_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    rx_crc2ipFifo_V_data_read_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, tmp_nbreadreq_fu_98_p5, ap_block_pp0_stage0_11001)
    begin
        if (((tmp_nbreadreq_fu_98_p5 = ap_const_lv1_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            rx_crc2ipFifo_V_data_read <= ap_const_logic_1;
        else 
            rx_crc2ipFifo_V_data_read <= ap_const_logic_0;
        end if; 
    end process;


    rx_crc2ipFifo_V_keep_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_pp0_stage0, rx_crc2ipFifo_V_keep_empty_n, tmp_nbreadreq_fu_98_p5, ap_block_pp0_stage0)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (tmp_nbreadreq_fu_98_p5 = ap_const_lv1_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            rx_crc2ipFifo_V_keep_blk_n <= rx_crc2ipFifo_V_keep_empty_n;
        else 
            rx_crc2ipFifo_V_keep_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    rx_crc2ipFifo_V_keep_read_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, tmp_nbreadreq_fu_98_p5, ap_block_pp0_stage0_11001)
    begin
        if (((tmp_nbreadreq_fu_98_p5 = ap_const_lv1_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            rx_crc2ipFifo_V_keep_read <= ap_const_logic_1;
        else 
            rx_crc2ipFifo_V_keep_read <= ap_const_logic_0;
        end if; 
    end process;


    rx_crc2ipFifo_V_last_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_pp0_stage0, rx_crc2ipFifo_V_last_empty_n, tmp_nbreadreq_fu_98_p5, ap_block_pp0_stage0)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (tmp_nbreadreq_fu_98_p5 = ap_const_lv1_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            rx_crc2ipFifo_V_last_blk_n <= rx_crc2ipFifo_V_last_empty_n;
        else 
            rx_crc2ipFifo_V_last_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    rx_crc2ipFifo_V_last_read_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, tmp_nbreadreq_fu_98_p5, ap_block_pp0_stage0_11001)
    begin
        if (((tmp_nbreadreq_fu_98_p5 = ap_const_lv1_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            rx_crc2ipFifo_V_last_read <= ap_const_logic_1;
        else 
            rx_crc2ipFifo_V_last_read <= ap_const_logic_0;
        end if; 
    end process;


    rx_ip2udpMetaFifo_V_1_blk_n_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, rx_ip2udpMetaFifo_V_1_full_n, ap_predicate_op65_write_state2, ap_block_pp0_stage0)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_predicate_op65_write_state2 = ap_const_boolean_1) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            rx_ip2udpMetaFifo_V_1_blk_n <= rx_ip2udpMetaFifo_V_1_full_n;
        else 
            rx_ip2udpMetaFifo_V_1_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    rx_ip2udpMetaFifo_V_1_din <= (p_Result_128_1_i_i_fu_408_p4 & p_Result_128_i_i_i_fu_398_p4);

    rx_ip2udpMetaFifo_V_1_write_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_predicate_op65_write_state2, ap_block_pp0_stage0_11001)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_predicate_op65_write_state2 = ap_const_boolean_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            rx_ip2udpMetaFifo_V_1_write <= ap_const_logic_1;
        else 
            rx_ip2udpMetaFifo_V_1_write <= ap_const_logic_0;
        end if; 
    end process;


    rx_ip2udpMetaFifo_V_s_blk_n_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, rx_ip2udpMetaFifo_V_s_full_n, ap_predicate_op65_write_state2, ap_block_pp0_stage0)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_predicate_op65_write_state2 = ap_const_boolean_1) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            rx_ip2udpMetaFifo_V_s_blk_n <= rx_ip2udpMetaFifo_V_s_full_n;
        else 
            rx_ip2udpMetaFifo_V_s_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    rx_ip2udpMetaFifo_V_s_din <= header_header_V_6(127 downto 96);

    rx_ip2udpMetaFifo_V_s_write_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_predicate_op65_write_state2, ap_block_pp0_stage0_11001)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_predicate_op65_write_state2 = ap_const_boolean_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            rx_ip2udpMetaFifo_V_s_write <= ap_const_logic_1;
        else 
            rx_ip2udpMetaFifo_V_s_write <= ap_const_logic_0;
        end if; 
    end process;


    rx_process2dropFifo_1_5_blk_n_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, rx_process2dropFifo_1_5_full_n, ap_predicate_op57_write_state2, ap_block_pp0_stage0)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_predicate_op57_write_state2 = ap_const_boolean_1) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            rx_process2dropFifo_1_5_blk_n <= rx_process2dropFifo_1_5_full_n;
        else 
            rx_process2dropFifo_1_5_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    rx_process2dropFifo_1_5_din <= tmp_data_V_reg_431;

    rx_process2dropFifo_1_5_write_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_predicate_op57_write_state2, ap_block_pp0_stage0_11001)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_predicate_op57_write_state2 = ap_const_boolean_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            rx_process2dropFifo_1_5_write <= ap_const_logic_1;
        else 
            rx_process2dropFifo_1_5_write <= ap_const_logic_0;
        end if; 
    end process;


    rx_process2dropFifo_2_4_blk_n_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, rx_process2dropFifo_2_4_full_n, ap_predicate_op57_write_state2, ap_block_pp0_stage0)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_predicate_op57_write_state2 = ap_const_boolean_1) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            rx_process2dropFifo_2_4_blk_n <= rx_process2dropFifo_2_4_full_n;
        else 
            rx_process2dropFifo_2_4_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    rx_process2dropFifo_2_4_din <= tmp_keep_V_reg_436;

    rx_process2dropFifo_2_4_write_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_predicate_op57_write_state2, ap_block_pp0_stage0_11001)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_predicate_op57_write_state2 = ap_const_boolean_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            rx_process2dropFifo_2_4_write <= ap_const_logic_1;
        else 
            rx_process2dropFifo_2_4_write <= ap_const_logic_0;
        end if; 
    end process;


    rx_process2dropFifo_s_6_blk_n_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, rx_process2dropFifo_s_6_full_n, ap_predicate_op57_write_state2, ap_block_pp0_stage0)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_predicate_op57_write_state2 = ap_const_boolean_1) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            rx_process2dropFifo_s_6_blk_n <= rx_process2dropFifo_s_6_full_n;
        else 
            rx_process2dropFifo_s_6_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    rx_process2dropFifo_s_6_din <= tmp_last_V_reg_441;

    rx_process2dropFifo_s_6_write_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_predicate_op57_write_state2, ap_block_pp0_stage0_11001)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_predicate_op57_write_state2 = ap_const_boolean_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            rx_process2dropFifo_s_6_write <= ap_const_logic_1;
        else 
            rx_process2dropFifo_s_6_write <= ap_const_logic_0;
        end if; 
    end process;


    rx_process2dropLengt_1_blk_n_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, rx_process2dropLengt_1_full_n, ap_predicate_op60_write_state2, ap_block_pp0_stage0)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_predicate_op60_write_state2 = ap_const_boolean_1) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            rx_process2dropLengt_1_blk_n <= rx_process2dropLengt_1_full_n;
        else 
            rx_process2dropLengt_1_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    rx_process2dropLengt_1_din <= header_header_V_6(4 - 1 downto 0);

    rx_process2dropLengt_1_write_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_predicate_op60_write_state2, ap_block_pp0_stage0_11001)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_predicate_op60_write_state2 = ap_const_boolean_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            rx_process2dropLengt_1_write <= ap_const_logic_1;
        else 
            rx_process2dropLengt_1_write <= ap_const_logic_0;
        end if; 
    end process;

    select_ln143_fu_346_p3 <= 
        ap_const_lv16_0 when (rx_crc2ipFifo_V_last_dout(0) = '1') else 
        ap_phi_mux_phi_ln75_phi_fu_153_p4;
    select_ln414_14_fu_257_p3 <= 
        tmp_40_fu_247_p4 when (icmp_ln414_fu_221_p2(0) = '1') else 
        tmp_V_4_fu_213_p1;
    select_ln414_15_fu_265_p3 <= 
        ap_const_lv160_lc_3 when (icmp_ln414_fu_221_p2(0) = '1') else 
        ap_const_lv160_lc_4;
    select_ln414_16_fu_273_p3 <= 
        ap_const_lv160_lc_5 when (icmp_ln414_fu_221_p2(0) = '1') else 
        ap_const_lv160_lc_4;
    select_ln414_fu_239_p3 <= 
        st3_fu_231_p3 when (icmp_ln414_fu_221_p2(0) = '1') else 
        tmp_V_4_fu_213_p1;
    st3_fu_231_p3 <= (trunc_ln414_fu_227_p1 & ap_const_lv159_lc_2);
    
    tmp_40_fu_247_p4_proc : process(select_ln414_fu_239_p3)
    variable vlo_cpy : STD_LOGIC_VECTOR(160+32 - 1 downto 0);
    variable vhi_cpy : STD_LOGIC_VECTOR(160+32 - 1 downto 0);
    variable v0_cpy : STD_LOGIC_VECTOR(160 - 1 downto 0);
    variable tmp_40_fu_247_p4_i : integer;
    variable section : STD_LOGIC_VECTOR(160 - 1 downto 0);
    variable tmp_mask : STD_LOGIC_VECTOR(160 - 1 downto 0);
    variable resvalue, res_value, res_mask : STD_LOGIC_VECTOR(160 - 1 downto 0);
    begin
        vlo_cpy := (others => '0');
        vlo_cpy(8 - 1 downto 0) := ap_const_lv32_9F(8 - 1 downto 0);
        vhi_cpy := (others => '0');
        vhi_cpy(8 - 1 downto 0) := ap_const_lv32_0(8 - 1 downto 0);
        v0_cpy := select_ln414_fu_239_p3;
        if (vlo_cpy(8 - 1 downto 0) > vhi_cpy(8 - 1 downto 0)) then
            vhi_cpy(8-1 downto 0) := std_logic_vector(160-1-unsigned(ap_const_lv32_0(8-1 downto 0)));
            vlo_cpy(8-1 downto 0) := std_logic_vector(160-1-unsigned(ap_const_lv32_9F(8-1 downto 0)));
            for tmp_40_fu_247_p4_i in 0 to 160-1 loop
                v0_cpy(tmp_40_fu_247_p4_i) := select_ln414_fu_239_p3(160-1-tmp_40_fu_247_p4_i);
            end loop;
        end if;
        res_value := std_logic_vector(shift_right(unsigned(v0_cpy), to_integer(unsigned('0' & vlo_cpy(8-1 downto 0)))));

        section := (others=>'0');
        section(8-1 downto 0) := std_logic_vector(unsigned(vhi_cpy(8-1 downto 0)) - unsigned(vlo_cpy(8-1 downto 0)));
        tmp_mask := (others => '1');
        res_mask := std_logic_vector(shift_left(unsigned(tmp_mask),to_integer(unsigned('0' & section(31-1 downto 0)))));
        res_mask := res_mask(160-2 downto 0) & '0';
        resvalue := res_value and not res_mask;
        tmp_40_fu_247_p4 <= resvalue(160-1 downto 0);
    end process;

    tmp_V_4_fu_213_p1 <= rx_crc2ipFifo_V_data_dout(160 - 1 downto 0);
    tmp_nbreadreq_fu_98_p5 <= (0=>(rx_crc2ipFifo_V_last_empty_n and rx_crc2ipFifo_V_keep_empty_n and rx_crc2ipFifo_V_data_empty_n), others=>'-');
    trunc_ln414_fu_227_p1 <= rx_crc2ipFifo_V_data_dout(1 - 1 downto 0);
    xor_ln143_fu_334_p2 <= (rx_crc2ipFifo_V_last_dout xor ap_const_lv1_1);
    xor_ln414_fu_287_p2 <= (ap_const_lv160_lc_4 xor and_ln414_fu_281_p2);
end behav;