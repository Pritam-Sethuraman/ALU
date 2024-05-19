-- ******************************************************************
-- Date: 19/10/2022
--
-- Author: Pritam Sethuraman
-- 
-- File: MUL_8bit.vhd
-- Description: 8 bit multiplier which takes two 8 bit values. 
-- ******************************************************************

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- entity declaration
entity MUL_8bit is
  port(
    IN1: in STD_LOGIC_VECTOR(7 downto 0);
    IN2: in STD_LOGIC_VECTOR(7 downto 0);
    OP: out STD_LOGIC_VECTOR(15 downto 0)
  );
end MUL_8bit;

-- architecture
architecture arch of MUL_8bit is
-- 4-bit Multiplier 
component MUL_4bit
  port(
    IN1: in STD_LOGIC_VECTOR(3 downto 0);
    IN2: in STD_LOGIC_VECTOR(3 downto 0);
    OP: out STD_LOGIC_VECTOR(7 downto 0)  
  );
end component;

-- 8-bit Adder
component ADD_8bit
  port(
    IN1: in STD_LOGIC_VECTOR(7 downto 0);
    IN2: in STD_LOGIC_VECTOR(7 downto 0);
    Sum: out STD_LOGIC_VECTOR(7 downto 0);
    Cout: out STD_LOGIC
  );
end component;

-- 12-bit Adder
component ADD_12bit
  port(
    IN1: in STD_LOGIC_VECTOR(11 downto 0);
    IN2: in STD_LOGIC_VECTOR(11 downto 0);
    Sum: out STD_LOGIC_VECTOR(11 downto 0)
  );
end component;

-- signals
signal s0: STD_LOGIC_VECTOR(7 downto 0);
signal s1: STD_LOGIC_VECTOR(7 downto 0);
signal s2: STD_LOGIC_VECTOR(7 downto 0);
signal s3: STD_LOGIC_VECTOR(7 downto 0);
signal s4: STD_LOGIC_VECTOR(7 downto 0);
signal s5: STD_LOGIC_VECTOR(8 downto 0);
signal s6: STD_LOGIC_VECTOR(11 downto 0);
signal s7: STD_LOGIC_VECTOR(11 downto 0);
signal s8: STD_LOGIC_VECTOR(11 downto 0);
signal s9: STD_LOGIC_VECTOR(11 downto 0);

begin
  M1: MUL_4bit
    port map(IN1 => IN1(3 downto 0), IN2 => IN2(3 downto 0), OP => s0);
      
  M2: MUL_4bit
    port map(IN1 => IN1(7 downto 4), IN2 => IN2(3 downto 0), OP => s1);
      
  M3: MUL_4bit
    port map(IN1 => IN1(3 downto 0), IN2 => IN2(7 downto 4), OP => s2);
      
  M4: MUL_4bit
    port map(IN1 => IN1(7 downto 4), IN2 => IN2(7 downto 4), OP => s3);
      
  OP(3 downto 0) <= s0(3 downto 0);
  
  s4 <= ("0000" & s0(7 downto 4));
  A1: ADD_8bit
    port map(IN1 => s1, IN2 => s4, Sum => s5(7 downto 0), Cout => s5(8));
  
  s6 <= ("0000" & s2(7 downto 0));
  s7 <= (s3(7 downto 0) & "0000");
  A2: ADD_12bit
    port map(IN1 => s6, IN2 => s7, Sum => s8);
  
  s9 <= ("0000" & s5(7 downto 0));
  A3: ADD_12bit
    port map(IN1 => s9, IN2 => s8, Sum => OP(15 downto 4));
end arch;