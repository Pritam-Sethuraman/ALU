-- ******************************************************************
-- Date: 01/12/2022
--
-- Author: Pritam Sethuraman
-- 
-- File: MUL_16bit.vhd
-- Description: 16 bit multiplier which takes two 16 bit values. 
-- ******************************************************************

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- entity declaration
entity MUL_16bit is
  port(
    IN1: in STD_LOGIC_VECTOR(15 downto 0);
    IN2: in STD_LOGIC_VECTOR(15 downto 0);
    OP: out STD_LOGIC_VECTOR(31 downto 0)
  );
end MUL_16bit;

-- architecture
architecture arch of MUL_16bit is
-- 8-bit Multiplier
component MUL_8bit
  port(
    IN1: in STD_LOGIC_VECTOR(7 downto 0);
    IN2: in STD_LOGIC_VECTOR(7 downto 0);
    OP: out STD_LOGIC_VECTOR(15 downto 0)
  );
end component;

-- 16-bit Adder
component ADD_16bit
  port(
    IN1: in STD_LOGIC_VECTOR(15 downto 0);
    IN2: in STD_LOGIC_VECTOR(15 downto 0);
    Sum: out STD_LOGIC_VECTOR(15 downto 0)
  );
end component;

-- 24-bit Adder
component ADD_24bit
  port(
    IN1: in STD_LOGIC_VECTOR(23 downto 0);
    IN2: in STD_LOGIC_VECTOR(23 downto 0);
    Sum: out STD_LOGIC_VECTOR(23 downto 0)
  );
end component;

-- Signals
signal s0: STD_LOGIC_VECTOR(15 downto 0);
signal s1: STD_LOGIC_VECTOR(15 downto 0);
signal s2: STD_LOGIC_VECTOR(15 downto 0);
signal s3: STD_LOGIC_VECTOR(15 downto 0);
signal s4: STD_LOGIC_VECTOR(15 downto 0);
signal s5: STD_LOGIC_VECTOR(23 downto 0);
signal s6: STD_LOGIC_VECTOR(23 downto 0);
signal s7: STD_LOGIC_VECTOR(15 downto 0);
signal s8: STD_LOGIC_VECTOR(23 downto 0);
signal s9: STD_LOGIC_VECTOR(23 downto 0);

begin
  M1: MUL_8bit
    port map(IN1 => IN1(7 downto 0), IN2 => IN2(7 downto 0), OP => s0);
  
  M2: MUL_8bit
    port map(IN1 => IN1(15 downto 8), IN2 => IN2(7 downto 0), OP => s1);
  
  M3: MUL_8bit
    port map(IN1 => IN1(7 downto 0), IN2 => IN2(15 downto 8), OP => s2);
  
  M4: MUL_8bit
    port map(IN1 => IN1(15 downto 8), IN2 => IN2(15 downto 8), OP => s3);
  
  OP(7 downto 0) <= s0(7 downto 0);
  
  s4 <= ("00000000" & s0(15 downto 8));
  A1: ADD_16bit
    port map(IN1 => s1, IN2 => s4, Sum => s7);
  
  s5 <= ("00000000" & s2(15 downto 0));
  s6 <= (s3(15 downto 0) & "00000000");
  A2: ADD_24bit
    port map(IN1 => s5, IN2 => s6, Sum => s8);
  
  s9 <= ("00000000" & s7(15 downto 0));
  A3: ADD_24bit
    port map(IN1 => s8, IN2 => s9, Sum => OP(31 downto 8));
end arch;