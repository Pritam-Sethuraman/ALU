library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ADD_32bit_testbench is
end ADD_32bit_testbench;

architecture TB_arch of ADD_32bit_testbench is
component ADD_32bit
  port (
    IN1: in STD_LOGIC_VECTOR(31 downto 0);
    IN2: in STD_LOGIC_VECTOR(31 downto 0);
    Sum: out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;

-- test signals
signal A, B: STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
signal S: STD_LOGIC_VECTOR(31 downto 0);

begin
  unit1: ADD_32bit
    port map(IN1 => A, IN2 => B, Sum => S);
  
  -- test bits
  process
  begin
    A <= "00111111111111111111111111111111";
    B <= "00000000000000000000000001111100";
    wait for 100 ns;
    A <= "00110000001111111111111111111111";
    B <= "00000000001110000000000001111100";
    wait for 100 ns;
  end process;
end TB_arch;