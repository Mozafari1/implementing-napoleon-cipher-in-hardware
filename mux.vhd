----------------------------------------------------------------------------------
-- Company: 
-- Engineer: RAHMAT MOZAFARI
-- 
-- Create Date: 28.02.2020 16:52:12
-- Design Name: 
-- Module Name: mux - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux is
  Port (
        ASCII_R: in std_logic_vector(7 downto 0);
        cipher_in: in std_logic_vector(7 downto 0);
        mux_ctr: in std_logic;
        data_out_mux: out std_logic_vector(7 downto 0)
   );
end mux;

architecture Behavioral of mux is

begin
data_out_mux <= ASCII_R when (mux_ctr ='1') else cipher_in;

end Behavioral;
