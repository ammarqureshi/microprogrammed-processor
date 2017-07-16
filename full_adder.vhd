----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity full_adder is

port(x,y,z:in std_logic ;
		s,c:out std_logic);

end full_adder;

architecture Behavioral of full_adder is

component half_adder
port(x,y:in std_logic;
		s,c:out std_logic);

end component;

signal hs,hc,tc: std_logic;

begin

HA1: half_adder
port map(x,y,hs,hc);

HA2: half_adder
port map(hs,z,s,tc);
c<=tc or hc;

end Behavioral;

