library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity Declaration
entity ADD_4bit is
  port(
    IN1: in STD_LOGIC_VECTOR(3 downto 0);
    IN2: in STD_LOGIC_VECTOR(3 downto 0);
    Sum: out STD_LOGIC_VECTOR(3 downto 0);
    Cout: out STD_LOGIC
  );
end ADD_4bit;

-- Architecture of the Entity
architecture arch of ADD_4bit is
-- Half Adder
component half_adder
  port(
    IN1: in STD_LOGIC;
    IN2: in STD_LOGIC;
    Sum: out STD_LOGIC;
    Cout: out STD_LOGIC
  );
end component;

-- Full Adder
component full_adder
  port(
    IN1: in STD_LOGIC;
    IN2: in STD_LOGIC;
    Cin: in STD_LOGIC;
    Sum: out STD_LOGIC; 
    Cout: out STD_LOGIC
  );
end component;

-- Internal Signals 
signal S: STD_LOGIC_VECTOR(2 downto 0);

-- Architecture Begins
begin
  HA1: half_adder
    port map(IN1 => IN1(0), IN2 => IN2(0), Sum => Sum(0), Cout => S(0));
  FA1: full_adder
    port map(IN1 => IN1(1), IN2 => IN2(1), Cin => S(0), Sum => Sum(1), Cout => S(1));
  FA2: full_adder
    port map(IN1 => IN1(2), IN2 => IN2(2), Cin => S(1), Sum => Sum(2), Cout => S(2));
  FA3: full_adder
    port map(IN1 => IN1(3), IN2 => IN2(3), Cin => S(2), Sum => Sum(3), Cout => Cout);
end arch;
