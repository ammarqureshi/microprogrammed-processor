----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity logic_unit_1bit is

port(s0,s1,x,y:in std_logic ;
g:out std_logic
);

end logic_unit_1bit;

architecture Behavioral of logic_unit_1bit is


signal and_out,or_out,xor_out,not_out:std_logic;


COMPONENT mux4_to_1
PORT(
in0 : IN std_logic;
in1 : IN std_logic;
in2 : IN std_logic;
in3 : IN std_logic;
s0 : IN std_logic;
s1 : IN std_logic;
Z : OUT std_logic
);
END COMPONENT;



begin


and_out<= x AND y;
or_out<=  x OR y;
xor_out<= x XOR y;
not_out<= NOT x;



--mux 4 to 1 bit

Muxer:mux4_to_1 PORT MAP(and_out,or_out,xor_out,not_out,s0,s1,g);

end Behavioral;

