----------------------------------------------------------------------------------
-- zero fill implementation
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity zero_fill is

port(SBin:in std_logic_vector(2 downto 0);
SBout:out std_logic_vector(15 downto 0)
);


end zero_fill;

architecture Behavioral of zero_fill is


begin

SBout(2 downto 0)<=SBin(2 downto 0);
SBout(15 downto 3)<="0000000000000";


end Behavioral;

