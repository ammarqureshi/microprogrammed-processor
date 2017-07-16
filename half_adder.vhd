----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity half_adder is

port(x,y:in std_logic;
	s,c:out std_logic);

end half_adder;

architecture Behavioral of half_adder is

begin

s<= x xor y;
c<=x and y;


end Behavioral;

