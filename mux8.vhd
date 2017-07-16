----------------------------------------------------------------------------------
-- mux 8 to 1 (16 bits)
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux8 is
Port (
in0, in1, in2, in3, in4, in5, in6, in7, in8: in std_logic_vector (15 downto 0);
s0, s1 ,s2, s3: in std_logic;

Z: out std_logic_vector (15 downto 0));
end mux8;


architecture behavioural of mux8 is
begin
Z <= 
in0 after 1 ns when s0 = '0' and s1 = '0' and s2 = '0' and s3='0' else
in1 after 1 ns when s0 = '0' and s1 = '0' and s2 = '0' and s3='1' else
in2 after 1 ns when s0 = '0' and s1 = '0' and s2 = '1' and s3='0' else
in3 after 1 ns when s0 = '0' and s1 = '0' and s2 = '1' and s3='1' else
in4 after 1 ns when s0 = '0' and s1 = '1' and s2 = '0' and s3='0' else
in5 after 1 ns when s0 = '0' and s1 = '1' and s2 = '0' and s3='1' else
in6 after 1 ns when s0 = '0' and s1 = '1' and s2 = '1' and s3='0' else
in7 after 1 ns when s0 = '0' and s1 = '1' and s2 = '1' and s3='1' else
in8 after 1 ns when s0 = '1' and s1 = '0' and s2 = '0' and s3='0' else

X"0000" after 5ns;
end behavioural;

