-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
--
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity read_req_table_req_table_max_fwd_re_ram is 
    generic(
            MEM_TYPE    : string := "block"; 
            DWIDTH     : integer := 24; 
            AWIDTH     : integer := 9; 
            MEM_SIZE    : integer := 500
    ); 
    port (
          addr1     : in std_logic_vector(AWIDTH-1 downto 0); 
          ce1       : in std_logic; 
          d1        : in std_logic_vector(DWIDTH-1 downto 0); 
          we1       : in std_logic; 
          clk        : in std_logic 
    ); 
end entity; 


architecture rtl of read_req_table_req_table_max_fwd_re_ram is 

type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
shared variable ram : mem_array := (others=>(others=>'0'));

attribute syn_ramstyle : string; 
attribute syn_ramstyle of ram : variable is "block_ram";
attribute ram_style : string;
attribute ram_style of ram : variable is MEM_TYPE;

begin 



p_memory_access_1: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce1 = '1') then 
            if (we1 = '1') then 
                ram(CONV_INTEGER(addr1)) := d1; 
            end if;
        end if;
    end if;
end process;


end rtl;

Library IEEE;
use IEEE.std_logic_1164.all;

entity read_req_table_req_table_max_fwd_re is
    generic (
        DataWidth : INTEGER := 24;
        AddressRange : INTEGER := 500;
        AddressWidth : INTEGER := 9);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address1 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce1 : IN STD_LOGIC;
        we1 : IN STD_LOGIC;
        d1 : IN STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of read_req_table_req_table_max_fwd_re is
    component read_req_table_req_table_max_fwd_re_ram is
        port (
            clk : IN STD_LOGIC;
            addr1 : IN STD_LOGIC_VECTOR;
            ce1 : IN STD_LOGIC;
            we1 : IN STD_LOGIC;
            d1 : IN STD_LOGIC_VECTOR);
    end component;



begin
    read_req_table_req_table_max_fwd_re_ram_U :  component read_req_table_req_table_max_fwd_re_ram
    port map (
        clk => clk,
        addr1 => address1,
        ce1 => ce1,
        we1 => we1,
        d1 => d1);

end architecture;


