library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity test is
    port (clk, rst, start : in std_logic;
    x : in std_logic_vector(3 downto 0);
    h_out : out std_logic_vector(3 downto 0));
end test;

architecture rtl of test is
    component toplevel is
        port (clk, rst, start : in std_logic;
        x : in std_logic_vector(3 downto 0);
        a_in : in std_logic_vector(7 downto 0);
        a_wr : out std_logic;
        addr, h_out : out std_logic_vector(3 downto 0);
        a_out : out std_logic_vector(7 downto 0));
    end component;
    component a_ram is
        port(clk, wr : in std_logic;
        addr : in std_logic_vector(3 downto 0);
        din : in std_logic_vector(7 downto 0);
        dout : out std_logic_vector(7 downto 0));
    end component;
    signal a_wr : std_logic;
    signal addr : std_logic_vector(3 downto 0);
    signal a_in, a_out : std_logic_vector(7 downto 0);
    begin
        u1 : toplevel port map (clk, rst, start, x, a_in, a_wr, addr, h_out, a_out);
        u2 : a_ram port map (clk, a_wr, addr, a_out, a_in);
    end rtl;