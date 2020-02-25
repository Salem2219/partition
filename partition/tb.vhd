library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity tb is
end tb ;

architecture behav of tb is
  constant clockperiod: time:= 0.1 ns;
  signal clk: std_logic:='0';
  signal rst,start: std_logic;
  signal x, h_out : std_logic_vector(3 downto 0);
  component test
    port (clk, rst, start : in std_logic;
    x : in std_logic_vector(3 downto 0);
    h_out : out std_logic_vector(3 downto 0));
  end component ;
  begin
    clk <= not clk after clockperiod /2;
    rst <= '1' , '0' after 0.1 ns;
    start <= '0' , '1' after 0.1 ns, '0' after 0.5 ns;
    x <= "1001";
    dut: test port map(clk,rst,start,x,h_out);
  end behav;