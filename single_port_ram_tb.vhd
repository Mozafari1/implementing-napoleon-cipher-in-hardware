----------------------------------------------------------------------------------
-- Company: 
-- Engineer: RAHMAT MOZAFARI
-- 
-- Create Date: 05.03.2020 21:38:47
-- Design Name: 
-- Module Name: single_port_ram_tb - Behavioral
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

entity single_port_ram_tb is
end;

architecture bench of single_port_ram_tb is

  component single_port_ram
    Port ( 
           rst, clk, we: in std_logic;
           addr_bus: in std_logic_vector(7 downto 0);
           data_bus: in std_logic_vector(7 downto 0);
           data_out: out std_logic_vector(7 downto 0)
           );
  end component;

  signal rst, clk, we: std_logic;
  signal addr_bus: std_logic_vector(7 downto 0);
  signal data_bus: std_logic_vector(7 downto 0);
  signal data_out: std_logic_vector(7 downto 0) ;


begin

  uut: single_port_ram port map ( rst      => rst,
                                  clk      => clk,
                                  we       => we,
                                  addr_bus => addr_bus,
                                  data_bus => data_bus,
                                  data_out => data_out );
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
      we     <= '0';
      wait for 100 ns;
      rst <= '0';
      we     <= '1';
      wait for 100 ns;
      rst      <= '1';
      we     <= '1';
      wait;
    
    
    end process;
end ;
