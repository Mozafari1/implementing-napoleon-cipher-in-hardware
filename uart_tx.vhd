----------------------------------------------------------------------------------
-- Company: 
-- Engineer: RAHMAT MOZAFARI
-- 
-- Create Date: 05.03.2020 19:42:43
-- Design Name: 
-- Module Name: uart_rx - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity uart_tx is
  Port (    
        clk,s_tick, rst: in std_logic;
        tx_start: in std_logic;
        tx_done: out std_logic;
        ASCII_T: in std_logic_vector(7 downto 0);
        tx: out std_logic   
   );
end uart_tx;

architecture Behavioral of uart_tx is
type state_type is (idle, start, data, stop);
signal st_reg, st_nxt: state_type;
signal s_reg, s_nxt: unsigned(3 downto 0);
signal n_reg, n_nxt: unsigned(2 downto 0);
signal b_reg, b_nxt: std_logic_vector(7 downto 0);
signal tx_reg, tx_nxt: std_logic; 
begin
process(clk,rst)
-- state register
    begin
        if rst ='1' then
            st_reg <= idle;
            s_reg <= (others => '0');
            n_reg <= (others => '0');
            b_reg <= (others => '0');
            tx_reg<= '1';
        elsif clk 'event and clk ='1' then
            st_reg <= st_nxt;
            s_reg <= s_nxt;
            n_reg <= n_nxt;
            b_reg <= b_nxt;
            tx_reg <=tx_nxt;
        end if;
end process;
-- next state
process(st_reg, s_reg, n_reg, b_reg, s_tick,tx_reg, tx_start, ASCII_T)
begin
    st_nxt <= st_reg;
    s_nxt  <= s_reg;
    n_nxt  <= n_reg;
    b_nxt  <= b_reg;
    tx_nxt <= tx_reg;
    tx_done<= '0';
    case st_reg is
    when idle =>
        tx_nxt <= '1';
        if tx_start <='1' then
        st_nxt <= start;
        s_nxt <= (others =>'0');
        b_nxt <= ASCII_T;
        end if;
     when start =>
     tx_nxt <= '0';
        if s_tick ='1' then
            if s_reg =15 then
               st_nxt   <= data;
               s_nxt    <= (others =>'0');
               n_nxt    <=  (others => '0');
            else
                s_nxt   <=s_reg +1;
            end if;
        end if;
      when data =>
        tx_nxt    <= b_reg(0); 
        if s_tick ='1' then
            if s_reg =15 then
                s_nxt   <= (others =>'0');
                b_nxt   <= '0' & b_reg(7 downto 1);
                if n_reg = 7 then
                    st_nxt  <= stop;
                else
                    n_nxt <= n_reg +1;
                end if;
              else
                s_nxt   <= s_reg +1;
           end if;
       end if;
    when stop =>
        tx_nxt <='1';
        if s_tick ='1' then
            if s_reg =15 then
                st_nxt  <= idle;
                tx_done <= '1';
            else
                s_nxt  <= s_reg +1;
            end if;
         end if;
     end case;
end process;
tx <= tx_reg;
end Behavioral;
