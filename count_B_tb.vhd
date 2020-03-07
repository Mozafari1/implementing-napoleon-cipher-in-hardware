
library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity count_B_tb is
end;

architecture bench of count_B_tb is

  component count_B
    Port ( 
            clk_B: in std_logic; 
            clr_B: in std_logic;
            addr_c: out std_logic_vector(7 downto 0)
          );
  end component;

  signal clk_B: std_logic;
  signal clr_B: std_logic;
  signal addr_c: std_logic_vector(7 downto 0) ;



begin

  uut: count_B port map ( clk_B       => clk_B,
                          clr_B       => clr_B,
                          addr_c => addr_c );

clock_process :process
begin
     clk_B <= '0';
     wait for 10 ns;
     clk_B <= '1';
     wait for 10 ns;
end process;
  stimulus: process
  begin
  clr_B      <= '0';
  wait for 10 ns;
  clr_B <= '1';
  wait for 20 ns;
  clr_B <= '0';
  wait;


end process;

end;
  