library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ADD_32bit is 
  port(
    IN1: in STD_LOGIC_VECTOR(31 downto 0);
    IN2: in STD_LOGIC_VECTOR(31 downto 0);
    Sum: out STD_LOGIC_VECTOR(31 downto 0)
  );
end ADD_32bit;

architecture arch of ADD_32bit is
component full_adder
  port(
    IN1: in STD_LOGIC;
    IN2: in STD_LOGIC;
    Cin: in STD_LOGIC;
    Sum: out STD_LOGIC; 
    Cout: out STD_LOGIC
  );
end component;

signal c: STD_LOGIC_VECTOR(31 downto 0);

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
  FA13: full_adder
    port map(IN1 => IN1(12), IN2 => IN2(12), Cin => c(11), Sum => Sum(12), Cout => c(12));
  FA14: full_adder
    port map(IN1 => IN1(13), IN2 => IN2(13), Cin => c(12), Sum => Sum(13), Cout => c(13));
  FA15: full_adder
    port map(IN1 => IN1(14), IN2 => IN2(14), Cin => c(13), Sum => Sum(14), Cout => c(14));
  FA16: full_adder
    port map(IN1 => IN1(15), IN2 => IN2(15), Cin => c(14), Sum => Sum(15), Cout => c(15));
  FA17: full_adder
    port map(IN1 => IN1(16), IN2 => IN2(16), Cin => c(15), Sum => Sum(16), Cout => c(16));
  FA18: full_adder
    port map(IN1 => IN1(17), IN2 => IN2(17), Cin => c(16), Sum => Sum(17), Cout => c(17));
  FA19: full_adder
    port map(IN1 => IN1(18), IN2 => IN2(18), Cin => c(17), Sum => Sum(18), Cout => c(18));
  FA20: full_adder
    port map(IN1 => IN1(19), IN2 => IN2(19), Cin => c(18), Sum => Sum(19), Cout => c(19));
  FA21: full_adder
    port map(IN1 => IN1(20), IN2 => IN2(20), Cin => c(19), Sum => Sum(20), Cout => c(20));
  FA22: full_adder
    port map(IN1 => IN1(21), IN2 => IN2(21), Cin => c(20), Sum => Sum(21), Cout => c(21));
  FA23: full_adder
    port map(IN1 => IN1(22), IN2 => IN2(22), Cin => c(21), Sum => Sum(22), Cout => c(22));
  FA24: full_adder
    port map(IN1 => IN1(23), IN2 => IN2(23), Cin => c(22), Sum => Sum(23), Cout => c(23));
  FA25: full_adder
    port map(IN1 => IN1(24), IN2 => IN2(24), Cin => c(23), Sum => Sum(24), Cout => c(24));
  FA26: full_adder
    port map(IN1 => IN1(25), IN2 => IN2(25), Cin => c(24), Sum => Sum(25), Cout => c(25));
  FA27: full_adder
    port map(IN1 => IN1(26), IN2 => IN2(26), Cin => c(25), Sum => Sum(26), Cout => c(26));
  FA28: full_adder
    port map(IN1 => IN1(27), IN2 => IN2(27), Cin => c(26), Sum => Sum(27), Cout => c(27));
  FA29: full_adder
    port map(IN1 => IN1(28), IN2 => IN2(28), Cin => c(27), Sum => Sum(28), Cout => c(28));
  FA30: full_adder
    port map(IN1 => IN1(29), IN2 => IN2(29), Cin => c(28), Sum => Sum(29), Cout => c(29));
  FA31: full_adder
    port map(IN1 => IN1(30), IN2 => IN2(30), Cin => c(29), Sum => Sum(30), Cout => c(30));
  FA32: full_adder
    port map(IN1 => IN1(31), IN2 => IN2(31), Cin => c(30), Sum => Sum(31), Cout => c(31));
end arch;