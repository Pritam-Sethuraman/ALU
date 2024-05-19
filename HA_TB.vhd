-- ******************************************************************
-- Author: Pritam Sethuraman
--
-- File: HA_TB.vhd
--
-- Revision History
--    Version 1.0
--    Date: 24/09/2022
--    Comments: Original
-- ******************************************************************

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity half_adder_testbench is
end half_adder_testbench;

architecture TB_arch of half_adder_testbench is
component half_adder
  port (
    IN1, IN2: in STD_LOGIC;
    SUM, COUT: out STD_LOGIC
  );
end component;

-- test signals
signal P, Q: STD_LOGIC := '0';
signal S, C: STD_LOGIC;

begin
  unit1: half_adder
    port map(IN1 => P, IN2 => Q, SUM => S, COUT => C);
  
  -- test bits
  process
  begin
    P <= '0';
    Q <= '0';
    wait for 100 ns;
    P <= '0';
    Q <= '1';
    wait for 100 ns;
    P <= '1';
    Q <= '0';
    wait for 100 ns;
    P <= '1';
    Q <= '1';
    wait for 100 ns;
    end process;
  
  -- verifier
  process
    variable error_flag: boolean;
  begin
    wait on P, Q;
    wait for 100 ns;
    if ((P = '0' and Q = '0' and S = '0' and C = '0') or
        (P = '0' and Q = '1' and S = '1' and C = '0') or
        (P = '1' and Q = '0' and S = '1' and C = '0') or
        (P = '1' and Q = '1' and S = '0' and C = '1'))
    then
      error_flag := false;
    else
      error_flag := true;
    end if;
    
    -- error reporting
    assert not error_flag
      report "test failed."
      severity note;
  end process; 
end TB_arch;