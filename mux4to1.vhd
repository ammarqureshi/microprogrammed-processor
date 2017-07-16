----------------------------------------------------------------------------------
--mux 4 to 1 16 bits
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4to1 is

port(B,in1,in2: in std_logic;
s:in std_logic_vector(1 downto 0);		
Z:out std_logic
);

end mux4to1;

architecture Behavioral of mux4to1 is

begin


Z <= B after 1 ns when s="00" else		--transfer B (unchanged)
in1 after 1 ns when s="10" else 			--shift right
in2 after 1 ns when s="01" else			--shift left
'0' after 1 ns;




end Behavioral;

