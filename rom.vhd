----------------------------------------------------------------------------------
-- Company: 
-- Engineer: RAHMAT MOZAFARI
-- 
-- Create Date: 28.02.2020 15:29:44
-- Design Name: 
-- Module Name: rom - Behavioral
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
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rom is
  Port ( 
        addr_B: in std_logic_vector(4 downto 0);
        key_out: out std_logic_vector(7 downto 0)
  );
end rom;

architecture Behavioral of rom is
-- Jean
constant j: std_logic_vector(7 downto 0):= X"6A";
constant e: std_logic_vector(7 downto 0):= X"65";
constant a: std_logic_vector(7 downto 0):= X"61";
constant n: std_logic_vector(7 downto 0):= X"6E";

-- Jacques
constant j2: std_logic_vector(7 downto 0):= X"6A";
constant a2: std_logic_vector(7 downto 0):= X"61";
constant c: std_logic_vector(7 downto 0):= X"63";
constant q: std_logic_vector(7 downto 0):= X"71";
constant u: std_logic_vector(7 downto 0):= X"75";
constant e2: std_logic_vector(7 downto 0):= X"65";
constant s: std_logic_vector(7 downto 0):= X"73";
-- Rousseau 
constant r: std_logic_vector(7 downto 0):= X"72";
constant o: std_logic_vector(7 downto 0):= X"6F";
constant u2: std_logic_vector(7 downto 0):= X"75";
constant s2: std_logic_vector(7 downto 0):= X"73";
constant s3: std_logic_vector(7 downto 0):= X"73";
constant e3: std_logic_vector(7 downto 0):= X"65";
constant a3: std_logic_vector(7 downto 0):= X"61";
constant u3: std_logic_vector(7 downto 0):= X"75";

type rom_key is array (natural range<>) of std_logic_vector(7 downto 0);
constant rom: rom_key := (
                          j,e,a,n,j2, a2,c,q,u,e2,s, r,o,u2,s2,s3,e3,a3,u3
                          );
                          
begin

    process(addr_B)
    
        variable alfa: integer;
            begin
                alfa := conv_integer(addr_B);
                key_out <= rom(alfa);
                end process;
end Behavioral;
