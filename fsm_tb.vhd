----------------------------------------------------------------------------------
-- Company: 
-- Engineer: RAHMAT MOZAFARI
-- 
-- Create Date: 06.03.2020 13:45:52
-- Design Name: 
-- Module Name: fsm_tb - Behavioral
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

entity fsm_tb is
end;

architecture bench of fsm_tb is

  component fsm
    Port ( 
          clk, rst: in std_logic;
          rx_done:  in std_logic;
          ASCII_R: in std_logic_vector(7 downto 0);
          ASCII_T: in std_logic_vector(7 downto 0);
          tx_done: in std_logic;              
          clr_A, inc_A, ctr, clr_B, inc_B, wr, tx_start: out std_logic
    );
  end component;

 signal clk, rst: std_logic;
 signal rx_done:  std_logic;
 signal ASCII_R: std_logic_vector(7 downto 0);
 signal ASCII_T: std_logic_vector(7 downto 0);
 signal tx_done: std_logic;
 signal clr_A, inc_A, ctr, clr_B, inc_B, wr, tx_start: std_logic ;



begin

  uut: fsm port map ( clk      => clk,
                      rst      => rst,
                      rx_done =>rx_done,
                      ASCII_R =>ASCII_R,
                      ASCII_T =>ASCII_T,
                      tx_done =>tx_done,
                      clr_A    => clr_A,
                      inc_A    => inc_A,
                      ctr      => ctr,
                      clr_B    => clr_B,
                      inc_B    => inc_B,
                      wr       => wr,
                      tx_start => tx_start );

clock_process :process
begin
     clk <= '0';
     wait for 10 ns;
     clk <= '1';
     wait for 10 ns;
end process;

stimulus: process
  begin
rst      <= '0';
wait for 10 ns;
rst <= '1';
wait for 20 ns;
rst <= '0';
wait;


end process;
end;