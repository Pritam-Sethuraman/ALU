-- ******************************************************************
-- Author: Pritam Sethuraman
--
-- File: FA.vhd
--
-- Design Units: 
--    Lorem ipsum
--
-- Library / Package:
--    IEEE.STD_LOGIC_1164: to use STD_LOGIC
--
-- Revision History
--    Version 1.0
--    Date: 24/09/2022
--    Comments: Original
-- ******************************************************************

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
  port (
    IN1: in STD_LOGIC;
    IN2: in STD_LOGIC;
    Cin: in STD_LOGIC;
    Sum: out STD_LOGIC; 
    Cout: out STD_LOGIC
  );
end full_adder;

architecture FA_arch of full_adder is    
begin
  Sum <= IN1 xor IN2 xor Cin;
  Cout <= (IN1 and IN2) or (IN2 and Cin) or (Cin and IN1);
end FA_arch;