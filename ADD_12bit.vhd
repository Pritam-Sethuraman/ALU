library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ADD_12bit is 
  port(
    IN1: in STD_LOGIC_VECTOR(11 downto 0);
    IN2: in STD_LOGIC_VECTOR(11 downto 0);
    Sum: out STD_LOGIC_VECTOR(11 downto 0)
  );
end ADD_12bit;

architecture arch of ADD_12bit is
component full_adder
  port(
    IN1: in STD_LOGIC;
    IN2: in STD_LOGIC;
    Cin: in STD_LOGIC;
    Sum: out STD_LOGIC; 
    Cout: out STD_LOGIC
  );
end component;

signal c: STD_LOGIC_VECTOR(11 downto 0);

begin
  FA1: full_adder
    port map(IN1 => IN1(0), IN2 => IN2(0), Cin => '0', Sum => Sum(0), Cout => c(0));
  FA2: full_adder
    port map(IN1 => IN1(1), IN2 => IN2(1), Cin => c(0), Sum => Sum(1), Cout => c(1));
  FA3: full_adder
    port map(IN1 => IN1(2), IN2 => IN2(2), Cin => c(1), Sum => Sum(2), Cout => c(2));
  FA4: full_adder
    port map(IN1 => IN1(3), IN2 => IN2(3), Cin => c(2), Sum => Sum(3), Cout => c(3));
  FA5: full_adder
    port map(IN1 => IN1(4), IN2 => IN2(4), Cin => c(3), Sum => Sum(4), Cout => c(4));
  FA6: full_adder
    port map(IN1 => IN1(5), IN2 => IN2(5), Cin => c(4), Sum => Sum(5), Cout => c(5));
  FA7: full_adder
    port map(IN1 => IN1(6), IN2 => IN2(6), Cin => c(5), Sum => Sum(6), Cout => c(6));
  FA8: full_adder
    port map(IN1 => IN1(7), IN2 => IN2(7), Cin => c(6), Sum => Sum(7), Cout => c(7));
  FA9: full_adder
    port map(IN1 => IN1(8), IN2 => IN2(8), Cin => c(7), Sum => Sum(8), Cout => c(8));
  FA10: full_adder
    port map(IN1 => IN1(9), IN2 => IN2(9), Cin => c(8), Sum => Sum(9), Cout => c(9));
  FA11: full_adder
    port map(IN1 => IN1(10), IN2 => IN2(10), Cin => c(9), Sum => Sum(10), Cout => c(10));
  FA12: full_adder
    port map(IN1 => IN1(11), IN2 => IN2(11), Cin => c(10), Sum => Sum(11), Cout => c(11));
end arch;