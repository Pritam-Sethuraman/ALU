-- ******************************************************************
-- Date: 19/10/2022
--
-- Author: Pritam Sethuraman
-- 
-- File: DIV4.vhd
-- Description: Incrementer block to increment by '1'. 
-- ******************************************************************

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity INC is
  port(
    DATA_IN: in STD_LOGIC_VECTOR(31 downto 0);
    DATA_OUT: out STD_LOGIC_VECTOR(31 downto 0)
  );
end INC;

architecture INC_arch of INC is
component ADD_32bit
  port(
    IN1: in STD_LOGIC_VECTOR(31 downto 0);
    IN2: in STD_LOGIC_VECTOR(31 downto 0);
    Sum: out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
begin
  U1: ADD_32bit port map(IN1 => DATA_IN, IN2 => "00000000000000000000000000000001", Sum => DATA_OUT);
end INC_arch;