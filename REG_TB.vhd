library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity REG_TB is
end REG_TB;

architecture testbench of REG_TB is
component REG_32bit
  port(
    CLOCK: in STD_LOGIC;
    CLEAR: in STD_LOGIC;
    LOAD: in STD_LOGIC;
    DATA_IN: in STD_LOGIC_VECTOR(31 downto 0);
    DATA_OUT: out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;

signal A: STD_LOGIC_VECTOR(31 downto 0);
signal A_reg: STD_LOGIC_VECTOR(31 downto 0);
signal clk: STD_LOGIC:= '0';
signal clr: STD_LOGIC:= '0';
signal en: STD_LOGIC:= '1';
constant clk_period: TIME:= 10 ns; 

begin
  -- Unit Under Test
  U1: REG_32bit
    port map(CLOCK => clk, CLEAR => clr, LOAD => en, DATA_IN => A, DATA_OUT => A_reg);
  
  -- Clock
  clk <= not clk after clk_period/2;

  -- Test Bits
  process
  begin
    A <= "00000000000000000000000000000000";
    wait for 100 ns;
    clr <= '1';
    wait for clk_period;
    clr <= '0';
    A <= "00001000010000010000000000000000";
    wait for 100 ns;
    clr <= '1';
    wait for clk_period;
    clr <= '0';
    A <= "10000010010011000000000000000000";
    wait for 100 ns;
    clr <= '1';
    wait for clk_period;
    clr <= '0';
    A <= "11111111111111110000000000000000";
    wait for 100 ns;
    clr <= '0';
    wait for clk_period;
  end process;
  
  -- Verifier
  process
    variable error_flag: boolean;
  begin
    wait on A;
    wait for 100 ns;
    if ((A = "00000000000000000000000000000000" and A_reg = "00000000000000000000000000000000") or
        (A = "00001000010000010000000000000000" and A_reg = "00001000010000010000000000000000") or
        (A = "10000010010011000000000000000000" and A_reg = "10000010010011000000000000000000") or
        (A = "11111111111111110000000000000000" and A_reg = "11111111111111110000000000000000"))
    then
      error_flag := false;
    else
      error_flag := true;
    end if;
    
    -- Error Reporting
    assert not error_flag
      report "test failed."
      severity note;
  end process;
end testbench;