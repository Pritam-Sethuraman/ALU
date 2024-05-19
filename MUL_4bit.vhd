library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity Declaration
entity MUL_4bit is
  port(
    IN1: in STD_LOGIC_VECTOR(3 downto 0);
    IN2: in STD_LOGIC_VECTOR(3 downto 0);
    OP: out STD_LOGIC_VECTOR(7 downto 0)  
  );
end MUL_4bit;

-- Architecture of the Entity
architecture arch of MUL_4bit is
-- 2-bit Multiplier
component MUL_2bit
  port(
    IN1: in STD_LOGIC_VECTOR(1 downto 0);
    IN2: in STD_LOGIC_VECTOR(1 downto 0);
    OP: out STD_LOGIC_VECTOR(3 downto 0)
  );
end component;

-- 4-bit Adder
component ADD_4bit
  port(
    IN1: in STD_LOGIC_VECTOR(3 downto 0);
    IN2: in STD_LOGIC_VECTOR(3 downto 0);
    Sum: out STD_LOGIC_VECTOR(3 downto 0);
    Cout: out STD_LOGIC
  );
end component;

-- 6-bit Adder
component ADD_6bit
  port(
    IN1: in STD_LOGIC_VECTOR(5 downto 0);
    IN2: in STD_LOGIC_VECTOR(5 downto 0);
    Sum: out STD_LOGIC_VECTOR(5 downto 0)
  );
end component;

-- signals 
signal s1: STD_LOGIC_VECTOR(3 downto 0);
signal s2: STD_LOGIC_VECTOR(3 downto 0);
signal s3: STD_LOGIC_VECTOR(3 downto 0);
signal s4: STD_LOGIC_VECTOR(3 downto 0);
signal s5: STD_LOGIC_VECTOR(4 downto 0);
signal s6: STD_LOGIC_VECTOR(5 downto 0);
signal s7: STD_LOGIC_VECTOR(3 downto 0);
signal s8: STD_LOGIC_VECTOR(5 downto 0);
signal s9: STD_LOGIC_VECTOR(5 downto 0);
signal s10: STD_LOGIC_VECTOR(5 downto 0);

-- Architecture Begins
begin
  U1: MUL_2bit
    port map(IN1 => IN1(1 downto 0), IN2 => IN2(1 downto 0), OP => s1);
  U2: MUL_2bit
    port map(IN1 => IN1(3 downto 2), IN2 => IN2(1 downto 0), OP => s2);
  U3: MUL_2bit
    port map(IN1 => IN1(1 downto 0), IN2 => IN2(3 downto 2), OP => s3);
  U4: MUL_2bit
    port map(IN1 => IN1(3 downto 2), IN2 => IN2(3 downto 2), OP => s4);
  
  OP(1 downto 0) <= s1(1 downto 0);
  
  s7 <= ("00" & s1(3 downto 2));
  U5: ADD_4bit
    port map(IN1 => s2, IN2 => s7, Sum => s5(3 downto 0), Cout => s5(4));
  
  s8 <= ("00" & s3(3 downto 0));
  s9 <= (s4(3 downto 0) & "00");
  U6: ADD_6bit
    port map(IN1 => s8, IN2 => s9, Sum => s6);
  
  s10 <= ('0' & s5);
  U7: ADD_6bit
      port map(IN1 => s10, IN2 => s6, Sum => OP(7 downto 2));
end arch;