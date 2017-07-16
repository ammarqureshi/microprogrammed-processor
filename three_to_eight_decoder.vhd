----------------------------------------------------------------------------------
-- 3 to 8 decoder 16 bits
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity three_to_eight_decoder is 
port(
a0: in std_logic;
a1: in std_logic;
a2: in std_logic;
a3: in std_logic;

q0: out std_logic;
q1: out std_logic;
q2: out std_logic;
q3: out std_logic;
q4: out std_logic;
q5: out std_logic;
q6: out std_logic;
q7: out std_logic;
q8: out std_logic
);

end three_to_eight_decoder; 

architecture behvOfDecoder of three_to_eight_decoder is
begin 
--q0<= not a0 and not  a1 and not a2;
--q1<= not a0 and not  a1 and     a2;
--q2<= not a0 and 	   a1 and not a2;
--q3<= not a0 and      a1 and 	 a2;
--q4<= 	   a0 and not  a1 and not a2;
--q5<=     a0 and not  a1 and  	 a2;
--q6<=     a0 and      a1 and not a2;
--q7<=     a0 and      a1 and 	 a2;



q0<= not a0 and not  a1 and not a2 and not a3;
q1<= not a0 and not  a1 and not a2 and 	 a3;
q2<= not a0 and not  a1 and     a2 and not a3; 
q3<= not a0 and not  a1 and 	  a2 and     a3;
q4<= not	a0 and 	   a1 and not a2 and not a3;
q5<= not a0 and      a1 and not a2 and 	 a3;
q6<= not a0 and      a1 and     a2 and not a3;
q7<= not a0 and      a1 and 	  a2 and 	 a3;
q8<= 		a0 and not  a1 and not a2 and not a3;




end behvOfDecoder;
