library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity dp is
    port (clk, rst, temp1_ld, temp2_ld, temp3_ld, temp4_ld, h_ld, k_sel, k_ld, hout_ld : in std_logic;
    addr_sel, aout_sel : in std_logic_vector(1 downto 0);
    x : in std_logic_vector(3 downto 0);
    a_in : in std_logic_vector(7 downto 0);
    kgrsz, temp2ltemp1 : out std_logic;
    h_out, addr : out std_logic_vector(3 downto 0);
    a_out : out std_logic_vector(7 downto 0));
end dp;

architecture rtl of dp is
    component adder4 is
        port (a, b : in std_logic_vector(3 downto 0);
        y : out std_logic_vector(3 downto 0));
    end component;
    component adder5 is
        port (a, b : in std_logic_vector(4 downto 0);
        y : out std_logic_vector(4 downto 0));
    end component;
    component lessthan is
        port (a, b : in std_logic_vector(7 downto 0);
        y : out std_logic);
    end component;
    component mux2_5 is
        port (s: in std_logic;
        a, b : in std_logic_vector(4 downto 0);
        y: out std_logic_vector(4 downto 0)) ;
    end component;
    component mux4_4 is
        port (sel: in std_logic_vector (1 downto 0);
        a, b, c, d: in std_logic_vector (3 downto 0);
        y: out std_logic_vector(3 downto 0));
    end component;
    component mux4_8 is
        port (sel: in std_logic_vector (1 downto 0);
        a, b, c, d: in std_logic_vector (7 downto 0);
        y: out std_logic_vector(7 downto 0));
    end component;
    component reg4 is
        port (clk, rst, en: in std_logic;
        reg_in: in std_logic_vector(3 downto 0);
        reg_out: out std_logic_vector(3 downto 0));
    end component;
    component reg5 is
        port (clk, rst, en: in std_logic;
        reg_in: in std_logic_vector(4 downto 0);
        reg_out: out std_logic_vector(4 downto 0));
    end component;
    component reg8 is
        port (clk, rst, en: in std_logic;
        reg_in: in std_logic_vector(7 downto 0);
        reg_out: out std_logic_vector(7 downto 0));
    end component;
    signal h, h_in : std_logic_vector(3 downto 0);
    signal k, kplus1, k_in : std_logic_vector(4 downto 0);
    signal temp1, temp2, temp3, temp4 : std_logic_vector(7 downto 0);
    begin
        temp1_reg : reg8 port map (clk, rst, temp1_ld, a_in, temp1);
        temp2_reg : reg8 port map (clk, rst, temp2_ld, a_in, temp2);
        temp3_reg : reg8 port map (clk, rst, temp3_ld, a_in, temp3);
        temp4_reg : reg8 port map (clk, rst, temp4_ld, a_in, temp4);
        h_adder : adder4 port map (h, "0001", h_in);
        h_reg : reg4 port map (clk, rst, h_ld, h_in, h);
        k_adder : adder5 port map (k, "00001", kplus1);
        k_mux : mux2_5 port map (k_sel, "00001", kplus1, k_in);
        k_reg : reg5 port map (clk, rst, k_ld, k_in, k);
        addr_mux : mux4_4 port map (addr_sel, "0000", x, k(3 downto 0), h, addr);
        checkless : lessthan port map (temp2, temp1, temp2ltemp1);
        a_out_mux : mux4_8 port map (aout_sel, temp1, temp2, temp3, temp4, a_out);
        hout_reg : reg4 port map (clk, rst, hout_ld, h, h_out);
        kgrsz <= k(4);
    end rtl;