library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity Declaration
entity MUL_2bit is
  port(
    IN1: in STD_LOGIC_VECTOR(1 downto 0);
    IN2: in STD_LOGIC_VECTOR(1 downto 0);
    OP: out STD_LOGIC_VECTOR(3 downto 0)  
  );
end MUL_2bit;

-- Architecture of the Entity
architecture arch of MUL_2bit is
-- signal 
signal s1: STD_LOGIC;
signal s2: STD_LOGIC;
signal s3: STD_LOGIC;
signal s4: STD_LOGIC;
begin
  OP(0) <= IN1(0) and IN2(0);
  
  s1 <= IN1(1) and IN2(0);
  s2 <= IN1(0) and IN2(1);
  OP(1) <= s1 xor s2;
  
  s3 <= s1 and s2;
  s4 <= IN1(1) and IN2(1);
  OP(2) <= s3 xor s4;
  
  OP(3) <= s3 and s4;
end arch;