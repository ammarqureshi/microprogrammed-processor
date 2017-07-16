----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity mux4_to_1 is
port(in0,in1,in2,in3,s0,s1: in std_logic;
Z: out std_logic
);

end mux4_to_1;

architecture Behavioral of mux4_to_1 is

begin
Z <= 
in0 after 5ns when s1 = '0' and s0 = '0'  else
in1 after 5ns when s1 = '0' and s0 = '1'  else
in2 after 5ns when s1 = '1' and s0 = '0'  else
in3 after 5ns when s1 = '1' and s0 = '1'  else
'0' after 5ns;
end Behavioral;

