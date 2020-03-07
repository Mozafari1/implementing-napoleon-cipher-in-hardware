----------------------------------------------------------------------------------
-- Company: 
-- Engineer: RAHMAT MOZAFARI
-- 
-- Create Date: 06.03.2020 13:45:52
-- Design Name: 
-- Module Name: top_level_tb - Behavioral
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

entity top_level_tb is
end;

architecture bench of top_level_tb is

  component top_level
    Port ( 
          clk,rst,rx,s_tick: in std_logic;
          output: out std_logic
    );
  end component;

  signal clk,rst, rx, s_tick: std_logic;
  signal output: std_logic ;

begin

  uut: top_level port map ( clk    => clk,
                            rst    => rst,
                            rx => rx,
                            s_tick => s_tick,
                            output => output
                            
                            );

  clock_process :process
  begin
       clk <= '0';
       wait for 10 ns;
       clk <= '1';
       wait for 10 ns;
  end process;
  
  stimulus: process
  begin
    rst      <= '1';
    rx <= '1';
    s_tick <= '1';
    wait for 50 ns;
    rst <= '0';
    rx <= '1';
    s_tick <= '1';
    wait for 50 ns;
    rst <= '1';
    rx <= '0';
    s_tick <= '1';
    wait for 50 ns;
    rst <= '0';
    rx <= '0';
    s_tick <= '1';
    wait for 50 ns;
    rst <= '1';
    rx <= '1';
    s_tick <= '0';
    wait for 50 ns;
    rst <= '0';
    rx <= '1';
    s_tick <= '0';
    wait;
  end process;


end;
  
