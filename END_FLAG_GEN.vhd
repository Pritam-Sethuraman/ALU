-- ******************************************************************
-- Date: 29/11/2022
--
-- Author: Pritam Sethuraman
-- 
-- File: END_FLAG_GEN.vhd
-- Description: END_FLAG Generator 
-- ******************************************************************

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity END_FLAG_GEN is
  port(
    CLOCK: in STD_LOGIC;
    CLEAR: in STD_LOGIC;
    Z_IN: in STD_LOGIC_VECTOR(31 downto 0);
    FLAG_OUT: out STD_LOGIC
  );
end END_FLAG_GEN;

architecture arch of END_FLAG_GEN is
begin
  process(Z_IN)
  begin
    if(CLEAR = '1') then
      FLAG_OUT <= '1';
    elsif(CLOCK'event and CLOCK = '1') then
      FLAG_OUT <= '1';
    end if;
  end process;
end arch;