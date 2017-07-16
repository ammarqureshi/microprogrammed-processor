----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity mux_B is

port(B,s0,s1: in std_logic;
Y: out std_logic
);

end mux_B;




architecture Behavioral of mux_B is

begin

--disregard B
Y <= '0'  after 1 ns when s1='0' and s0='0' else

--output is B
B 			after 1 ns when s1='0' and s0='1' else

--output is inverted B
not B 	after 1 ns when s1='1' and s0='0'  else

--output is not 1
not '0'  after 1 ns when s1='1' and s0='1';


end Behavioral;

