----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity logicUnit_16bits is

port(Ain,Bin:in std_logic_vector(15 downto 0);
	s0,s1: in std_logic;
	G:out std_logic_vector(15 downto 0)
	
);

end logicUnit_16bits;



architecture Behavioral of logicUnit_16bits is

component logic_unit_1bit


port(
s0,s1,x,y:in std_logic;
g:out std_logic
);
end component;


begin


Bit0: logic_unit_1bit
port map (s0,s1, Ain(0),Bin(0), G(0));

Bit1: logic_unit_1bit
port map (s0,s1, Ain(1),Bin(1), G(1));

Bit2: logic_unit_1bit
port map (s0,s1, Ain(2),Bin(2), G(2));

Bit3: logic_unit_1bit
port map (s0,s1, Ain(3),Bin(3), G(3));

Bit4: logic_unit_1bit
port map (s0,s1, Ain(4),Bin(4), G(4));

Bit5: logic_unit_1bit
port map (s0,s1, Ain(5),Bin(5), G(5));

Bit6: logic_unit_1bit
port map (s0,s1, Ain(6),Bin(6), G(6));

Bit7: logic_unit_1bit
port map (s0,s1, Ain(7),Bin(7), G(7));

Bit8: logic_unit_1bit
port map (s0,s1, Ain(8),Bin(8), G(8));

Bit9: logic_unit_1bit
port map (s0,s1, Ain(9),Bin(9), G(9));

Bit10: logic_unit_1bit
port map (s0,s1, Ain(10),Bin(10), G(10));

Bit11: logic_unit_1bit
port map (s0,s1, Ain(11),Bin(11), G(11));

Bit12: logic_unit_1bit
port map (s0,s1, Ain(12),Bin(12), G(12));

Bit13: logic_unit_1bit
port map (s0,s1, Ain(13),Bin(13), G(13));

Bit14: logic_unit_1bit
port map (s0,s1, Ain(14),Bin(14), G(14));

Bit15: logic_unit_1bit
port map (s0,s1, Ain(15),Bin(15), G(15));



end Behavioral;

