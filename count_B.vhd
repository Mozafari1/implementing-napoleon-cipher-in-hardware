----------------------------------------------------------------------------------
-- Company: 
-- Engineer: RAHMAT MOZAFARI
-- 
-- Create Date: 28.02.2020 16:59:31
-- Design Name: 
-- Module Name: count_B - Behavioral
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
--          8 bits


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

entity count_B is
  Port ( 
          clk_B: in std_logic; 
          clr_B: in std_logic;
          addr_c: out std_logic_vector(7 downto 0)
        );

end count_B;

architecture Behavioral of count_B is
-- singal clr_B,inc_B std_logic;
signal count_up_B: std_logic_vector(7 downto 0);

begin
process(clk_B, clr_B)
begin
    if clr_B ='1' then
        count_up_B <= "00000000";
    elsif (clk_B'event and clk_B ='1') then
        count_up_B <= count_up_B +1;
    end if;
end process;
addr_c <= count_up_B;

end Behavioral;
