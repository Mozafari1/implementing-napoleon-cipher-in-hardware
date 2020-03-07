----------------------------------------------------------------------------------
-- Company: 
-- Engineer: RAHMAT MOZAFARRÌ
-- 
-- Create Date: 28.02.2020 17:33:18
-- Design Name: 
-- Module Name: single_port_ram - Behavioral
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
use ieee.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity single_port_ram is
  Port ( 
         rst, clk, we: in std_logic;
         addr_bus: in std_logic_vector(7 downto 0);
         data_bus: in std_logic_vector(7 downto 0);
         data_out: out std_logic_vector(7 downto 0)
         );
end single_port_ram;

architecture Behavioral of single_port_ram is
    type type_ram is array(0 to 2**7) OF std_logic_vector (7 downto 0);
    signal RAM: type_ram := (others => x"FF");
    
begin
process(clk, rst)
begin
if(rst ='1') then
RAM(0) <= x"61";
RAM(1) <= x"62";
RAM(2) <= x"63";
RAM(3) <= x"64";
RAM(4) <= x"65";
RAM(5) <= x"66";
RAM(6) <= x"67";
RAM(7) <= x"68";
RAM(8) <= x"69";
RAM(9) <= x"6A";
RAM(10) <= x"6B";
RAM(11) <= x"6C";
RAM(12) <= x"6D";
RAM(13) <= x"6E";
RAM(14) <= x"6F";
RAM(15) <= x"70";
RAM(16) <= x"71";
RAM(17) <= x"72";
RAM(18) <= x"73";
RAM(19) <= x"74";
RAM(20) <= x"75";
RAM(21) <= x"76";
RAM(22) <= x"77";
RAM(23) <= x"78";
RAM(24) <= x"79";
RAM(25) <= x"7A";

elsif (clk 'event and clk ='1') then
if (we ='1') then
    RAM(TO_INTEGER(UNSIGNED(addr_bus))) <= data_bus;
    end if;
    end if;
end process;


data_out <= RAM(TO_INTEGER(UNSIGNED(addr_bus)));

end Behavioral;
