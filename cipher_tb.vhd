----------------------------------------------------------------------------------
-- Company: 
-- Engineer: RAHMAT MOZAFARI
-- 
-- Create Date: 06.03.2020 13:45:52
-- Design Name: 
-- Module Name: cipher_tb - Behavioral
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

entity cipher_tb is
end;

architecture bench of cipher_tb is

  component cipher
    Port (
          clk, rst: in std_logic;
          key_in: in std_logic_vector(7 downto 0);
          msg: in std_logic_vector(7 downto 0);
          cipher_out: out std_logic_vector(7 downto 0)
       );
  end component;

  signal clk, rst: std_logic;
  signal key_in: std_logic_vector(7 downto 0);
  signal msg: std_logic_vector(7 downto 0);
  signal cipher_out: std_logic_vector(7 downto 0) ;


begin

  uut: cipher port map ( clk      => clk,
                         rst      => rst,
                         key_in      => key_in,
                         msg      => msg,
                         cipher_out => cipher_out );


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
  wait for 10 ns;
  rst <= '0';
  wait for 20 ns;
  key_in <= X"6A";
  msg <= X"6D";
  wait for 20 ns;
  key_in <= X"65";
  msg <= X"61";
  wait for 20 ns;
  key_in <= X"61";
  msg <= X"6B";
  wait for 20 ns;
  key_in <= X"6E";
  msg <= X"65";
  
  wait for 20 ns;
  key_in <= X"6A";
  msg <= X"65";
  wait for 20 ns;
  key_in <= X"61";
  msg <= X"76";
  wait for 20 ns;
  key_in <= X"63";
  msg <= X"65";
  wait for 20 ns;
  key_in <= X"71";
  msg <= X"72";
  
  wait for 20 ns;
  key_in <= X"75";
  wait for 20 ns;
  key_in <= X"79";
  

  rst <= '0';
  wait;


end process;
end;
  