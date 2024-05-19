-- ******************************************************************
-- Date: 6/11/2022
--
-- Author: Pritam Sethuraman
-- 
-- File: ALU.vhd
-- Description: Structural implementation of ALU 
-- ******************************************************************

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- entity declaration
entity ALU is
  port(
    A: in STD_LOGIC_VECTOR(15 downto 0);
    B: in STD_LOGIC_VECTOR(15 downto 0);
    LOAD: in STD_LOGIC;
    CLEAR: in STD_LOGIC;
    CLOCK: in STD_LOGIC;
    END_FLAG: out STD_LOGIC;
    Z: out STD_LOGIC_VECTOR(31 downto 0)
  );
end ALU;

-- architecture
architecture RTL of ALU is

-- 16-bit Register
component REG_16bit
  port(
    CLOCK: in STD_LOGIC;
    CLEAR: in STD_LOGIC;
    LOAD: in STD_LOGIC;
    DATA_IN: in STD_LOGIC_VECTOR(15 downto 0);
    DATA_OUT: out STD_LOGIC_VECTOR(15 downto 0)
  );
end component;

-- 32-bit Register
component REG_32bit
  port(
    CLOCK: in STD_LOGIC;
    CLEAR: in STD_LOGIC;
    LOAD: in STD_LOGIC;
    DATA_IN: in STD_LOGIC_VECTOR(31 downto 0);
    DATA_OUT: out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;

-- 16-bit Multiplier
component MUL_16bit
  port(
    IN1: in STD_LOGIC_VECTOR(15 downto 0);
    IN2: in STD_LOGIC_VECTOR(15 downto 0);
    OP: out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;

-- Divider
component DIV4
  port(
    DATA_IN: in STD_LOGIC_VECTOR(31 downto 0);
    DATA_OUT: out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;

-- Incrementor
component INC
  port(
    DATA_IN: in STD_LOGIC_VECTOR(31 downto 0);
    DATA_OUT: out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;

-- END_FLAG Generator
component END_FLAG_GEN
  port(
    CLOCK: in STD_LOGIC;
    CLEAR: in STD_LOGIC;
    Z_IN: in STD_LOGIC_VECTOR(31 downto 0);
    FLAG_OUT: out STD_LOGIC 
  );
end component;

-- signals
signal s1: STD_LOGIC_VECTOR(15 downto 0);
signal s2: STD_LOGIC_VECTOR(15 downto 0);
signal s3: STD_LOGIC_VECTOR(31 downto 0);
signal s4: STD_LOGIC_VECTOR(31 downto 0);
signal s5: STD_LOGIC_VECTOR(31 downto 0);

-- top level RTL begin
begin
  RA: REG_16bit
    port map(CLOCK => CLOCK, CLEAR => CLEAR, LOAD => LOAD, DATA_IN => A, DATA_OUT => s1);
  
  RB: REG_16bit
    port map(CLOCK => CLOCK, CLEAR => CLEAR, LOAD => LOAD, DATA_IN => B, DATA_OUT => s2);
  
  U1: MUL_16bit
    port map(IN1 => s1, IN2 => s2, OP => s3);
  
  U2: DIV4
    port map(DATA_IN => s3, DATA_OUT => s4);
  
  U3: INC
    port map(DATA_IN => s4, DATA_OUT => s5);
  
  U4: END_FLAG_GEN
      port map(CLOCK => CLOCK, CLEAR => CLEAR, Z_IN => s5, FLAG_OUT => END_FLAG);
      
  RZ: REG_32bit
    port map(CLOCK => CLOCK, CLEAR => CLEAR, LOAD => LOAD, DATA_IN => s5, DATA_OUT => Z);  
end RTL;