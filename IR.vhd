----------------------------------------------------------------------------------
--Instruction register
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity IR is

port(
IL:in std_logic;
mem_out:in std_logic_vector(15 downto 0);
opcode:out std_logic_vector(6 downto 0);
DR_out:out std_logic_vector(2 downto 0);
SA_out:out std_logic_vector(2 downto 0);
SB_out:out std_logic_vector(2 downto 0);
CLK:in std_logic
);

end IR;

architecture Behavioral of IR is
begin


opcode<=mem_out(15 downto 9) after 1 ns when IL='1';
SB_out<=mem_out(2 downto 0) after 1 ns when IL='1';
SA_out<=mem_out(5 downto 3) after 1 ns when IL='1';
DR_out<=mem_out(8 downto 6) after 1 ns when IL='1';

end Behavioral;

