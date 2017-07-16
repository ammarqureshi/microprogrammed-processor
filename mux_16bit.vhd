-----------------------------------------------------------------------------
--mux 2 to 1 (16 bits)
-----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity mux_16bit is

port ( in0 : in std_logic_vector(15 downto 0);
in1 : in std_logic_vector(15 downto 0);
s : in std_logic;
Z : out std_logic_vector(15 downto 0));
end mux_16bit;

architecture Behavioral of mux_16bit is

begin

Z <= in0 after 1 ns when s='0' else
in1 after 1 ns when s='1'else
"0000000000000000" after 1 ns;

end Behavioral;