-- ******************************************************************
-- Date: 19/10/2022
--
-- Author: Pritam Sethuraman
-- 
-- File: DIV4.vhd
-- Description: Divider block to divide by 4. 
-- ******************************************************************

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- entity declaration
entity DIV4 is
  port(
    DATA_IN: in STD_LOGIC_VECTOR(31 downto 0);
    DATA_OUT: out STD_LOGIC_VECTOR(31 downto 0)
  );
end DIV4;

-- architecture 
architecture DIV4_arch of DIV4 is
begin
  DATA_OUT <= "00" & DATA_IN(31 downto 2);
end DIV4_arch;