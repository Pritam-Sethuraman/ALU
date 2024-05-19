-- ******************************************************************
-- Date: 29/09/2022
--
-- Author: Pritam Sethuraman
-- 
-- File: REG_32bit.vhd
-- Description: REG_32bit is a 32-bit register that is loaded when
--              LOAD is recieved and cleared with CLEAR.
-- ******************************************************************

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity Declaration
entity REG_32bit is
  port (
    CLOCK: in STD_LOGIC;
    CLEAR: in STD_LOGIC;
    LOAD: in STD_LOGIC;
    DATA_IN: in STD_LOGIC_VECTOR(31 downto 0);
    DATA_OUT: out STD_LOGIC_VECTOR(31 downto 0)
  );
end REG_32bit;

-- Architecture
architecture REG_32bit_arch of REG_32bit is
-- signals
signal q_reg: STD_LOGIC_VECTOR(31 downto 0);
signal q_next: STD_LOGIC_VECTOR(31 downto 0);

begin
  -- DFF
  process(CLOCK, CLEAR)
  begin
    if (CLEAR = '1') then
      q_reg <= (others => '0');
    elsif (CLOCK'event and CLOCK = '1') then
      q_reg <= q_next;
    end if;
  end process;
  -- next state logic
  q_next <= DATA_IN when LOAD = '1' else
            q_reg;
  -- output logic
  DATA_OUT <= q_reg;
end REG_32bit_arch;
