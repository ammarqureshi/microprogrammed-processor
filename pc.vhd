----------------------------------------------------------------------------------
-- program counter implementation
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity pc is

port(extend:in std_logic_vector(15 downto 0);
PL:in std_logic;
PI:in std_logic;
Clk : in std_logic;
pc_out:out std_logic_vector(15 downto 0);
reset:in std_logic

);
end pc;

architecture Behavioral of pc is
--signal pc_val,pc_val2:std_logic_vector(15 downto 0):="0000000000110111";

begin


--
--sync_stuff: process(reset,PI,PL)
--begin
--
--if rising_edge(CLK)then

process(reset,PI,PL)
variable pc_val:std_logic_vector(15 downto 0);

begin
if(reset='1') then
pc_val:=x"ffff";
pc_out<=pc_val;

elsif(PL='1') then 
pc_val:=pc_val + extend;
pc_out<=pc_val;

--else if p0=1 then increment pc;
elsif(PI='1') then
pc_val:=pc_val+1;
pc_out<=pc_val;


end if;
end process;
end Behavioral;


