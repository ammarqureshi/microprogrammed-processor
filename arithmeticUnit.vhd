----------------------------------------------------------------------------------
--arithmetic unit
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity arithmeticUnit is

port(Ain,Bin:in std_logic_vector(15 downto 0);
	s0,s1,cin: in std_logic;
	
--	clk : in std_logic;
	nf:out std_logic;
	zf:out std_logic;
	ovf:out std_logic;
	cout: out std_logic;

	G:out std_logic_vector(15 downto 0)
	
);

end arithmeticUnit;


architecture Behavioral of arithmeticUnit is
signal Y: std_logic_vector(15 downto 0);
 

component ripple_carry_adder_16bits
port(B, A : in std_logic_vector(15 downto 0);
C0 : in std_logic;
S : out std_logic_vector(15 downto 0);
prevCarry: out std_logic;
C4: out std_logic);
end component;


component mux_B 
port(B,s0,s1: in std_logic;
Y: out std_logic
);
end component;

signal ripple_out,ripple_out1:std_logic_vector(15 downto 0 );

signal zfv,cfv: std_logic:='0';

signal z,z1: std_logic :='0';
signal prevCarryV:std_logic;

begin

Bit0: mux_B
port map (Bin(0), s0, s1, Y(0));

Bit1: mux_B
port map (Bin(1), s0, s1, Y(1));

Bit2: mux_B
port map (Bin(2), s0, s1, Y(2));

Bit3: mux_B
port map (Bin(3), s0, s1, Y(3));

Bit4: mux_B
port map (Bin(4), s0, s1, Y(4));

Bit5: mux_B
port map (Bin(5), s0, s1, Y(5));

Bit6: mux_B
port map (Bin(6), s0, s1, Y(6));

Bit7: mux_B
port map (Bin(7), s0, s1, Y(7));

Bit8: mux_B
port map (Bin(8), s0, s1, Y(8));

Bit9: mux_B
port map (Bin(9), s0, s1, Y(9));

Bit10: mux_B
port map (Bin(10), s0, s1, Y(10));

Bit11: mux_B
port map (Bin(11), s0, s1, Y(11));

Bit12: mux_B
port map (Bin(12), s0, s1, Y(12));

Bit13: mux_B
port map (Bin(13), s0, s1, Y(13));

Bit14: mux_B
port map (Bin(14), s0, s1, Y(14));

Bit15: mux_B
port map (Bin(15), s0, s1, Y(15));



adder16:ripple_carry_adder_16bits 
port map(Y,Ain,cin,ripple_out1,prevCarryV,cfv);


G<=ripple_out1;
ripple_out<=ripple_out1;

z1 <=ripple_out(15)
or ripple_out(14) 
or ripple_out(13)
or ripple_out(12)
or ripple_out(11)
or ripple_out(10)
or ripple_out(9)
or ripple_out(8)
or ripple_out(7)
or ripple_out(6)
or ripple_out(5)
or ripple_out(4)
or ripple_out(3)
or ripple_out(2)
or ripple_out(1)
or ripple_out(0);



ovf<=cfv xor prevCarryV;

nf<=ripple_out(15) ;


zf<= not z1 ;

cout<=cfv;


end Behavioral;

