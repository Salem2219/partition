library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity ctrl is
port (clk, rst, start, kgrsz, temp2ltemp1 : in std_logic ;
temp1_ld, temp2_ld, temp3_ld, temp4_ld, h_ld, k_sel, k_ld, hout_ld, a_wr: out std_logic;
addr_sel, aout_sel : out std_logic_vector(1 downto 0));
end ctrl ;

architecture rtl of ctrl is
  type state_type is (s0,s1,s2,s3,s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, s16, s17, s18,s19);
  signal current_state : state_type ;
  signal next_state : state_type ;
begin
  process(clk,rst)
  begin
    if (rst = '1') then
      current_state <= s0;
    elsif (rising_edge(clk)) then
      current_state <= next_state;
    end if;
  end process;

  process (current_state, start, kgrsz, temp2ltemp1)
  begin
    case current_state is
    when s0 =>
    temp1_ld <= '0';
    temp2_ld <= '0';
    temp3_ld <= '0';
    temp4_ld <= '0';
    h_ld <='0';
    k_sel <= '0';
    k_ld <= '0';
    hout_ld <= '0';
    a_wr <= '0';
    addr_sel <= "00";
    aout_sel <= "00";
    next_state <= s1;
    when s1 =>
    temp1_ld <= '1';
    temp2_ld <= '0';
    temp3_ld <= '0';
    temp4_ld <= '0';
    h_ld <='0';
    k_sel <= '0';
    k_ld <= '0';
    hout_ld <= '0';
    a_wr <= '0';
    addr_sel <= "00";
    aout_sel <= "00";
    if (start ='1') then
    next_state <= s2;
    else
    next_state <= s1;
    end if;
    when s2 =>
    temp1_ld <= '0';
    temp2_ld <= '1';
    temp3_ld <= '0';
    temp4_ld <= '0';
    h_ld <='0';
    k_sel <= '0';
    k_ld <= '0';
    hout_ld <= '0';
    a_wr <= '0';
    addr_sel <= "01";
    aout_sel <= "00";
    next_state <= s3;
    when s3 =>
    temp1_ld <= '0';
    temp2_ld <= '0';
    temp3_ld <= '0';
    temp4_ld <= '0';
    h_ld <='0';
    k_sel <= '0';
    k_ld <= '0';
    hout_ld <= '0';
    a_wr <= '1';
    addr_sel <= "00";
    aout_sel <= "01";
    next_state <= s4;
    when s4 =>
    temp1_ld <= '0';
    temp2_ld <= '0';
    temp3_ld <= '0';
    temp4_ld <= '0';
    h_ld <='0';
    k_sel <= '0';
    k_ld <= '0';
    hout_ld <= '0';
    a_wr <= '1';
    addr_sel <= "01";
    aout_sel <= "00";
    next_state <= s5;
    when s5 =>
    temp1_ld <= '1';
    temp2_ld <= '0';
    temp3_ld <= '0';
    temp4_ld <= '0';
    h_ld <='0';
    k_sel <= '0';
    k_ld <= '1';
    hout_ld <= '0';
    a_wr <= '0';
    addr_sel <= "00";
    aout_sel <= "00";
    next_state <= s6;
    when s6 =>
    temp1_ld <= '0';
    temp2_ld <= '1';
    temp3_ld <= '0';
    temp4_ld <= '0';
    h_ld <='0';
    k_sel <= '0';
    k_ld <= '0';
    hout_ld <= '0';
    a_wr <= '0';
    addr_sel <= "10";
    aout_sel <= "00";
    if (kgrsz = '1') then
    next_state <= s14;
    else
    next_state <= s18;
    end if;
    when s7 =>
    temp1_ld <= '0';
    temp2_ld <= '0';
    temp3_ld <= '0';
    temp4_ld <= '0';
    h_ld <='0';
    k_sel <= '0';
    k_ld <= '0';
    hout_ld <= '0';
    a_wr <= '0';
    addr_sel <= "00";
    aout_sel <= "00";
    if(temp2ltemp1 = '1') then
    next_state <= s8;
    else
    next_state <= s13;
    end if;
    when s8 =>
    temp1_ld <= '0';
    temp2_ld <= '0';
    temp3_ld <= '0';
    temp4_ld <= '0';
    h_ld <='1';
    k_sel <= '0';
    k_ld <= '0';
    hout_ld <= '0';
    a_wr <= '0';
    addr_sel <= "00";
    aout_sel <= "00";
    next_state <= s9;
    when s9 =>
    temp1_ld <= '0';
    temp2_ld <= '0';
    temp3_ld <= '1';
    temp4_ld <= '0';
    h_ld <='0';
    k_sel <= '0';
    k_ld <= '0';
    hout_ld <= '0';
    a_wr <= '0';
    addr_sel <= "11";
    aout_sel <= "00";
    next_state <= s10;
    when s10 =>
    temp1_ld <= '0';
    temp2_ld <= '0';
    temp3_ld <= '0';
    temp4_ld <= '0';
    h_ld <='0';
    k_sel <= '0';
    k_ld <= '0';
    hout_ld <= '0';
    a_wr <= '0';
    addr_sel <= "10";
    aout_sel <= "00";
    next_state <= s19;
    when s11 =>
    temp1_ld <= '0';
    temp2_ld <= '0';
    temp3_ld <= '0';
    temp4_ld <= '0';
    h_ld <='0';
    k_sel <= '0';
    k_ld <= '0';
    hout_ld <= '0';
    a_wr <= '1';
    addr_sel <= "11";
    aout_sel <= "11";
    next_state <= s12;
    when s12 =>
    temp1_ld <= '0';
    temp2_ld <= '0';
    temp3_ld <= '0';
    temp4_ld <= '0';
    h_ld <='0';
    k_sel <= '0';
    k_ld <= '0';
    hout_ld <= '0';
    a_wr <= '1';
    addr_sel <= "10";
    aout_sel <= "10";
    next_state <= s13;
    when s13 =>
    temp1_ld <= '0';
    temp2_ld <= '0';
    temp3_ld <= '0';
    temp4_ld <= '0';
    h_ld <='0';
    k_sel <= '1';
    k_ld <= '1';
    hout_ld <= '0';
    a_wr <= '0';
    addr_sel <= "00";
    aout_sel <= "00";
    next_state <= s6;
    when s14 =>
    temp1_ld <= '1';
    temp2_ld <= '0';
    temp3_ld <= '0';
    temp4_ld <= '0';
    h_ld <='0';
    k_sel <= '0';
    k_ld <= '0';
    hout_ld <= '0';
    a_wr <= '0';
    addr_sel <= "00";
    aout_sel <= "00";
    next_state <= s15;
    when s15 =>
    temp1_ld <= '0';
    temp2_ld <= '1';
    temp3_ld <= '0';
    temp4_ld <= '0';
    h_ld <='0';
    k_sel <= '0';
    k_ld <= '0';
    hout_ld <= '0';
    a_wr <= '0';
    addr_sel <= "11";
    aout_sel <= "00";
    next_state <= s16;
    when s16 =>
    temp1_ld <= '0';
    temp2_ld <= '0';
    temp3_ld <= '0';
    temp4_ld <= '0';
    h_ld <='0';
    k_sel <= '0';
    k_ld <= '0';
    hout_ld <= '0';
    a_wr <= '1';
    addr_sel <= "00";
    aout_sel <= "01";
    next_state <= s17;
    when s17 =>
    temp1_ld <= '0';
    temp2_ld <= '0';
    temp3_ld <= '0';
    temp4_ld <= '0';
    h_ld <='0';
    k_sel <= '0';
    k_ld <= '0';
    hout_ld <= '1';
    a_wr <= '1';
    addr_sel <= "11";
    aout_sel <= "00";
    next_state <= s1;
    when s19 =>
    temp1_ld <= '0';
    temp2_ld <= '0';
    temp3_ld <= '0';
    temp4_ld <= '0';
    h_ld <='0';
    k_sel <= '0';
    k_ld <= '0';
    hout_ld <= '0';
    a_wr <= '0';
    addr_sel <= "00";
    aout_sel <= "00";
    next_state <= s11;
    when others =>
    temp1_ld <= '0';
    temp2_ld <= '0';
    temp3_ld <= '0';
    temp4_ld <= '0';
    h_ld <='0';
    k_sel <= '0';
    k_ld <= '0';
    hout_ld <= '1';
    a_wr <= '1';
    addr_sel <= "11";
    aout_sel <= "00";
    next_state <= s7;
    end case;
  end process;
end rtl;
