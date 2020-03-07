----------------------------------------------------------------------------------
-- Company: 
-- Engineer: RAHMAT MOZAFARI
-- 
-- Create Date: 05.03.2020 17:50:30
-- Design Name: 
-- Module Name: cipher - Behavioral
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
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity cipher is
  Port (
        
        clk, rst: in std_logic;
        key_in: in std_logic_vector(7 downto 0);
        msg: in std_logic_vector(7 downto 0);
        cipher_out: out std_logic_vector(7 downto 0)
     );
end cipher;

architecture Behavioral of cipher is
signal cipher: std_logic_vector(7 downto 0);

begin
    process(clk, rst)
    begin
        if(rst ='1')then
            cipher <= X"00";
        elsif (clk 'event and clk ='1') then
            if (key_in > msg) then
                cipher <= key_in - msg -x"1";
             else
                cipher <= key_in + x"1A" - msg - x"1";
            end if;
          end if;
         cipher_out <= cipher+X"61";
       end process;
end Behavioral;
