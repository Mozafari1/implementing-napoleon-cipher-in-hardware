----------------------------------------------------------------------------------
-- Company: 
-- Engineer: RAHMAT MOZAFARI
-- 
-- Create Date: 28.02.2020 16:22:16
-- Design Name: 
-- Module Name: up_counter - Behavioral
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
--            Counter A

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity up_counter is
  Port ( 
        clk: in std_logic; 
        clr: in std_logic;
        count_out: out std_logic_vector(4 downto 0)
        );
end up_counter;

architecture Behavioral of up_counter is
signal count_up: std_logic_vector(4 downto 0);

begin
process(clk, clr)
begin
    if clr ='1' then
        count_up <= "00000";
    elsif (clk'event and clk ='1') then
        count_up <= count_up +1;
    end if;
end process;
count_out <= count_up;

end Behavioral;
