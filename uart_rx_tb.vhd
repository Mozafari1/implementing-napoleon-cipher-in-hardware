----------------------------------------------------------------------------------
-- Company: 
-- Engineer: RAHMAT MOZAFARI
-- 
-- Create Date: 06.03.2020 13:45:52
-- Design Name: 
-- Module Name: uart_rx_tb - Behavioral
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

entity uart_rx_tb is
end;

architecture bench of uart_rx_tb is

  component uart_rx
    Port (    
          clk,rx,s_tick, rst: in std_logic;
          rx_done: out std_logic;
          ASCII_R: out std_logic_vector(7 downto 0)   
     );
  end component;

  signal clk,rx,s_tick, rst: std_logic;
  signal rx_done: std_logic;
  signal ASCII_R: std_logic_vector(7 downto 0) ;

begin

  uut: uart_rx port map ( clk      => clk,
                          rx       => rx,
                          s_tick   => s_tick,
                          rst      => rst,
                          rx_done  => rx_done,
                          ASCII_R => ASCII_R );
                          
                          
clock_process :process
begin
     clk <= '0';
     wait for 10 ns;
     clk <= '1';
     wait for 10 ns;
end process;
stimulus: process
begin
--rx,s_tick, rst
rst      <= '1';
wait for 20 ns;
rst <= '0';
s_tick <= '1';
rx <= '1';
wait for 20 ns;
s_tick <= '0';
rx <= '1';
wait for 20 ns;
s_tick <= '1';
rx <= '0';
wait for 20 ns;
s_tick <= '0';
rx <= '0';

wait;


end process;
end ;
