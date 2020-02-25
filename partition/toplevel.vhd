library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity toplevel is
    port (clk, rst, start : in std_logic;
    x : in std_logic_vector(3 downto 0);
    a_in : in std_logic_vector(7 downto 0);
    a_wr : out std_logic;
    addr, h_out : out std_logic_vector(3 downto 0);
    a_out : out std_logic_vector(7 downto 0));
end toplevel;

architecture rtl of toplevel is
    component dp is
        port (clk, rst, temp1_ld, temp2_ld, temp3_ld, temp4_ld, h_ld, k_sel, k_ld, hout_ld : in std_logic;
        addr_sel, aout_sel : in std_logic_vector(1 downto 0);
        x : in std_logic_vector(3 downto 0);
        a_in : in std_logic_vector(7 downto 0);
        kgrsz, temp2ltemp1 : out std_logic;
        h_out, addr : out std_logic_vector(3 downto 0);
        a_out : out std_logic_vector(7 downto 0));
    end component;
    component ctrl is
        port (clk, rst, start, kgrsz, temp2ltemp1 : in std_logic ;
        temp1_ld, temp2_ld, temp3_ld, temp4_ld, h_ld, k_sel, k_ld, hout_ld, a_wr: out std_logic;
        addr_sel, aout_sel : out std_logic_vector(1 downto 0));
    end component;
    signal temp1_ld, temp2_ld, temp3_ld, temp4_ld, h_ld, k_sel, k_ld, hout_ld, kgrsz, temp2ltemp1 : std_logic;
    signal addr_sel, aout_sel : std_logic_vector(1 downto 0);
    begin
        datapath : dp port map (clk, rst, temp1_ld, temp2_ld, temp3_ld, temp4_ld, h_ld, k_sel, k_ld, hout_ld, addr_sel, aout_sel, x, a_in, kgrsz, temp2ltemp1, h_out, addr, a_out);
        control : ctrl port map (clk, rst, start, kgrsz, temp2ltemp1, temp1_ld, temp2_ld, temp3_ld, temp4_ld, h_ld, k_sel, k_ld, hout_ld, a_wr, addr_sel, aout_sel);
    end rtl;