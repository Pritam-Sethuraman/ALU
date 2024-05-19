-- ******************************************************************
-- Date: 24/09/2022
--
-- Author: Pritam Sethuraman
--
-- File: HA.vhd
-- Description: Half Adder
-- ******************************************************************

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity half_adder is
  port (
    IN1: in STD_LOGIC;
    IN2: in STD_LOGIC;
    Sum: out STD_LOGIC;
    Cout: out STD_LOGIC
  );
end half_adder;

architecture HA_arch of half_adder is 
begin
  Sum <= IN1 xor IN2;
  Cout <= IN1 and IN2;
end HA_arch;