library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
entity mux4_4 is
port (sel: in std_logic_vector (1 downto 0);
a, b, c, d: in std_logic_vector (3 downto 0);
y: out std_logic_vector(3 downto 0));
end mux4_4;
architecture first of mux4_4 is
begin
    y <= a when sel = "00" else
b when sel = "01" else
c when sel = "10" else
d; --when sel = "11"
end first;