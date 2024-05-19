library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU_TB is
end ALU_TB;

architecture testbench of ALU_TB is
-- entity under test
component ALU
  port(
    A: in STD_LOGIC_VECTOR(15 downto 0);
    B: in STD_LOGIC_VECTOR(15 downto 0);
    LOAD: in STD_LOGIC;
    CLEAR: in STD_LOGIC;
    CLOCK: in STD_LOGIC;
    END_FLAG: out STD_LOGIC;
    Z: out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;

-- signals
signal P, Q: STD_LOGIC_VECTOR(15 downto 0):= (others => '0');
signal R: STD_LOGIC_VECTOR(31 downto 0):= (others => '0');
signal flag: STD_LOGIC:= '0';
signal en, clk: STD_LOGIC:= '0';
signal clr: STD_LOGIC:= '1';
constant clk_period: TIME:= 10 ns;

begin
  ALU1: ALU
    port map(A => P, B => Q, LOAD => en, CLEAR => clr, CLOCK => clk, END_FLAG => flag, Z => R);
  
  -- Clock
  clk <= not clk after clk_period/2;
  en <= '1';
  clr <= '0';
  
  -- Test Bits
  process
  begin
    P <= "0000000000000000";
    Q <= "0000000000000000";
    wait for 2*clk_period;
    P <= "0001001001011000";
    Q <= "0000101001001001";
    wait for 2*clk_period;
    P <= "0100010101010101";
    Q <= "0010100100100000";
    wait for 2*clk_period;
    P <= "0001110000110000";
    Q <= "0000000111110000";
    wait for 2*clk_period;
    P <= "1000111110000000";
    Q <= "0011100000000010";
    wait for 2*clk_period;
    P <= "0111100001000000";
    Q <= "0000000001111110";
    wait for 2*clk_period;
    P <= "1111111111111111";
    Q <= "1111111111111111";
    wait for 2*clk_period;
  end process;
end testbench;
