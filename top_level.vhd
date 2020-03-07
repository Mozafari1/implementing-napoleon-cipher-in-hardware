----------------------------------------------------------------------------------
-----                   
-- Company: 
-- Engineer: RAHMAT MOZAFARI
-- 
-- Create Date: 05.03.2020 18:15:58
-- Design Name: 
-- Module Name: top_level - Behavioral
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

entity top_level is

  Port ( 
        clk,rst,rx,s_tick: in std_logic;
        output: out std_logic
  );
end top_level;

architecture Behavioral of top_level is
-- UART_RX
--signal rx, s_tick: std_logic;
signal rx_done: std_logic;
signal ASCII_R: std_logic_vector(7 downto 0);
component uart_rx
    port(
            clk,rx,s_tick, rst: in std_logic;
            rx_done: out std_logic;
            ASCII_R: out std_logic_vector(7 downto 0)
         );
end component;
-- UART TX
signal tx_done, tx: std_logic;
component uart_tx
    port(
            clk,s_tick, rst: in std_logic;
            tx_start: in std_logic;
            tx_done: out std_logic;
            ASCII_T: in std_logic_vector(7 downto 0);
            tx: out std_logic  
         );
end component;
-- FSM
signal clr_A, inc_A, ctr, clr_B, inc_B, wr, tx_start: std_logic;

component fsm
generic(
      ASCII_R: STRING :="Enter";
      ASCII_T: STRING :="Enter"
      );
  Port ( 
      clk, rst: in std_logic;
      rx_done:  in std_logic;
      ASCII_R_code: in std_logic_vector(7 downto 0);
      --ASCII_T: in std_logic_vector(7 downto 0);
      tx_done: in std_logic;                 
      clr_A, inc_A, ctr, clr_B, inc_B, wr, tx_start: out std_logic
);
end component;

-- Count_mod-m A

signal addr_B: std_logic_vector(4 downto 0);

component mod_m_cnt_A
    Port(
            clk: in std_logic;
            clr_A: in std_logic;
            addr_B: out std_logic_vector(4 downto 0)    
        );
end component;
-- ROM key
signal key_out: std_logic_vector(7 downto 0);
component rom
  Port ( 
      addr_B: in std_logic_vector(4 downto 0);
      key_out: out std_logic_vector(7 downto 0)
);
end component;
-- Cipher

signal cipher_out: std_logic_vector(7 downto 0);
component cipher
      Port (
      
            clk, rst: in std_logic;
            key_in: in std_logic_vector(7 downto 0);
            msg: in std_logic_vector(7 downto 0);
            cipher_out: out std_logic_vector(7 downto 0)
            );
end component;
--  mux
signal data_out_mux:  std_logic_vector(7 downto 0);
component mux
  Port (
      ASCII_R: in std_logic_vector(7 downto 0);
      cipher_in: in std_logic_vector(7 downto 0);
      mux_ctr: in std_logic;
      data_out_mux: out std_logic_vector(7 downto 0)
 );
 end component;
 -- Count B
 signal addr_c: std_logic_vector(7 downto 0);
 component count_B
   Port ( 
         clk_B: in std_logic; 
         clr_B: in std_logic;
         addr_c: out std_logic_vector(7 downto 0)
       );
end component;
-- RAM

signal data_out: std_logic_vector(7 downto 0);
component single_port_ram
  Port ( 
       rst, clk, we: in std_logic;
       addr_bus: in std_logic_vector(7 downto 0);
       data_bus: in std_logic_vector(7 downto 0);
       data_out: out std_logic_vector(7 downto 0)
       );
end component;

begin
-- UART_RX
    uart_R: uart_rx
        port map(
                    clk => clk, rst => rst, rx => rx, s_tick => s_tick,
                    rx_done => rx_done, ASCII_R => ASCII_R
                );
                

-- FSM
    ctr_path: fsm
        generic map ( ASCII_R      =>  "Enter",
                     ASCII_T      =>  "Enter")
        port map(
                 clk => clk, rst => rst,
                 rx_done =>rx_done, ASCII_R_code => ASCII_R, tx_done =>tx_done,
                 clr_A => clr_A, inc_A => inc_A, ctr => ctr,
                 clr_B => clr_B, inc_B => inc_B, wr => wr, tx_start => tx_start
                 );
-- UART_TX
       uart_T: uart_tx
            port map(
                     clk => clk, rst => rst, s_tick => s_tick, tx => tx,
                     tx_start => tx_start, ASCII_T => data_out, tx_done => tx_done
                     );            
-- COUNT A mod -m
    mod_m_cnt: mod_m_cnt_A
             port map(
                        clk => clk, clr_A => rst, addr_B =>addr_B
                        );
-- ROM key
    rom_key: rom
        port map (
                    addr_B => addr_B, key_out => key_out
                    );
-- Cipher
    en_dec: cipher
        port map(
              clk => clk, rst => rst, key_in => key_out, msg => ASCII_R, cipher_out=>cipher_out
              );
-- mux
    MUX_A: mux
        port map
                (
                ASCII_R =>ASCII_R, cipher_in => cipher_out, mux_ctr => ctr, data_out_mux=>data_out_mux
                );
-- count B
    cnt_B: count_B
        port map
                (
                    clk_B => clk, clr_B => rst, addr_c =>addr_c
                  );
-- RAM
    ram: single_port_ram
                port map
                        (
                            clk => clk, rst => rst, we => wr, addr_bus => addr_c, data_bus => data_out_mux, data_out=>data_out
                          );
  output <= tx;
end Behavioral;
