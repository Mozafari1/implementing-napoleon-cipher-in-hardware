----------------------------------------------------------------------------------
-- Company: 
-- Engineer: RAHMAT MOZAFARI
-- 
-- Create Date: 06.03.2020 13:45:52
-- Design Name: 
-- Module Name: modulo m counter_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity mod_m_cnt_A_tb is
end;

architecture bench of mod_m_cnt_A_tb is

  component mod_m_cnt_A
    Port ( 
          clk: in std_logic;
          clr_A: in std_logic;
          addr_bus: out std_logic_vector(4 downto 0)
    );
  end component;

  signal clk, clr_A: std_logic;
  signal addr_bus: std_logic_vector(4 downto 0) ;


begin

  uut: mod_m_cnt_A port map ( clk      => clk,
                              clr_A    => clr_A,
                              addr_bus => addr_bus );
clock_process :process
begin
     clk <= '0';
     wait for 10 ns;
     clk <= '1';
     wait for 10 ns;
end process;

  stimulus: process
  begin
    clr_A      <= '0';
    wait for 10 ns;
    clr_A <= '1';
    wait for 20 ns;
    clr_A <= '0';
    wait;
 

  end process;

end;
  