----------------------------------------------------------------------------------
-- Company: 
-- Engineer: RAHMAT MOZAFARI
-- 
-- Create Date: 03.03.2020 10:02:31
-- Design Name: 
-- Module Name: mod_m_cnt_A - Behavioral
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
use IEEE.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mod_m_cnt_A is
  Port ( 
        clk: in std_logic;
        clr_A: in std_logic;
        addr_B: out std_logic_vector(4 downto 0)
  );
end mod_m_cnt_A;

architecture Behavioral of mod_m_cnt_A is

--signal inc_A: std_logic;
signal cnt: std_logic_vector(4 downto 0);
begin

-- mod 18
process(clk, clr_A) 
    begin 
    if(clr_A ='1') then
        cnt  <="00000";
        --inc_A <= '0';
    elsif clk'event and clk='1' then
        if cnt = "10010" then
            cnt <= "00000";
         else
            --inc_A <= '1';
            cnt <= cnt + 1;
        end if;
        end if;
     end process;
     
    addr_B   <= cnt;
    
end Behavioral;
