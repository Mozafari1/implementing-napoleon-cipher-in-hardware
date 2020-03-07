----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Rahmat Mozafari
-- 
-- Create Date: 02.03.2020 15:42:50
-- Design Name: 
-- Module Name: fsm - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fsm is
generic(
    ASCII_R: STRING :="Enter";
    ASCII_T: STRING :="Enter"
    
    );
  Port ( 
        clk, rst: in std_logic;
        rx_done:  in std_logic;
        ASCII_R_code: in std_logic_vector(7 downto 0);
        --ASCII_R: in std_logic_vector(7 downto 0);
        --ASCII_T: in std_logic_vector(7 downto 0);
        tx_done: in std_logic;               
        clr_A, inc_A, ctr, clr_B, inc_B, wr, tx_start: out std_logic
  );
end fsm;

architecture Behavioral of fsm is
--signal rx_done:  std_logic;
--signal ASCII_R: std_logic_vector(7 downto 0);
-- signal ASCII_T: std_logic_vector(7 downto 0);
--signal tx_done: std_logic;
--signal ASCII_R_code:std_logic_vector(7 downto 0);

type state is( state_0, state_1,state_2,state_3,state_4,state_5,state_6);
signal state_reg, state_nxt: state;

begin
-- State register 

process(clk, rst )
begin
    if(rst ='1') then
        state_reg <= state_0;
        
    elsif rising_edge(clk) then
        state_reg <= state_nxt;
end if;
end process;
-- Next state logic
process(state_reg,rx_done, ASCII_R_code, tx_done)
begin
    state_nxt <= state_reg;
    clr_A <= '0';
    inc_A <='0';
    ctr <= '0'; 
    clr_B <= '0'; 
    inc_B <= '0'; 
    wr <= '0';  
    tx_start <= '0';
    case state_reg is
        when state_0 =>
          inc_A <='1';
          clr_B <= '1';
          state_nxt <=  state_1;
        when state_1 => 
           if (rx_done ='1') then
                   -- 0x0D "enter"
                if (ASCII_R_code = x"0D") then
                    if (ASCII_R ="Enter") then
                        ctr <= '1';
                        wr <= '1';
                        state_nxt <= state_4;
                     else
                     state_nxt  <= state_2;
                     end if;              
                 end if;
            end if;
         when state_2 =>
            wr <= '1';
            state_nxt <= state_3;
         when state_3 =>
            inc_A <='1';
            inc_B  <= '1';
            state_nxt <= state_1;
         when state_4 =>
            clr_B <= '1';
            state_nxt <= state_5;
         when state_5 =>
            if (ASCII_T ="Enter") then
                state_nxt   <= state_0;
            else
                 tx_start <= '1';
                 state_nxt  <= state_6;
            end if;
          when state_6 =>
                if (tx_done ='1')then
                    inc_B <='1';
                    state_nxt <= state_5;
                 end if;
         end case;
          
end process;
end Behavioral;
