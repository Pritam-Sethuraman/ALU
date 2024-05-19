library ieee;
use ieee.std_logic_1164.all;

entity MUL_TB is
end MUL_TB;

architecture testbench of MUL_TB is
  component MUL_16bit
    port(
      IN1: in STD_LOGIC_VECTOR(15 downto 0);
      IN2: in STD_LOGIC_VECTOR(15 downto 0);
      OP: out STD_LOGIC_VECTOR(31 downto 0)
    );
  end component;
  
  signal A, B: STD_LOGIC_VECTOR(15 downto 0):= (others => '0');
  signal AB: STD_LOGIC_VECTOR(31 downto 0):= (others => '0');
begin
  unit1: MUL_16bit
    port map(IN1 => A, IN2 => B, OP => AB);
  process
  begin
    A <= "0000000000000000";
    B <= "0000000000000000";
    wait for 100 ns;
    A <= "0111011101110111";
    B <= "1111111111111111";
    wait for 100 ns;
    A <= "1111111111111111";
    B <= "1111111111111111";
    wait for 100 ns;
  end process;
  
  process
    variable error_flag: boolean;
  begin
    wait on A, B;
    wait for 100 ns;
    if ((A = "0000000000000000" and B = "0000000000000000" and AB = "00000000000000000000000000000000") or
        (A = "0111011101110111" and B = "1111111111111111" and AB = "01110111011101101000100010001001") or
        (A = "1111111111111111" and B = "1111111111111111" and AB = "11111111111111100000000000000001"))
    then
      error_flag := false;
    else
      error_flag := true;
    end if;
    -- error reporting
    assert not error_flag
      report "test failed."
      severity note;
  end process; 
end testbench;