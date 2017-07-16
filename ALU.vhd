----------------------------------------------------------------------------------
--ALU implementation
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ALU is

port(A,B: in std_logic_vector(15 downto 0);
s0,s1,cin,s2:in std_logic;

nf:out std_logic;
zf:out std_logic;
ovf:out std_logic;
cout: out std_logic;


Gout: out std_logic_vector(15 downto 0)

);

end ALU;



architecture Behavioral of ALU is


signal G_arith,G_logic: std_logic_vector(15 downto 0);

component arithmeticUnit

port(Ain,Bin:in std_logic_vector(15 downto 0);
	s0,s1,cin: in std_logic;
	nf:out std_logic;
	zf:out std_logic;
	ovf:out std_logic;
	cout: out std_logic;
	G:out std_logic_vector(15 downto 0)
);
end component;



component logicUnit

port(Ain,Bin:in std_logic_vector(15 downto 0);
	s0,s1: in std_logic;
	G:out std_logic_vector(15 downto 0)
	
);
end component;

component mux_16bit
port ( in0 : in std_logic_vector(15 downto 0);
in1 : in std_logic_vector(15 downto 0);
s : in std_logic;
Z : out std_logic_vector(15 downto 0));

end component;

begin


arithmetic: arithmeticUnit
port map(A,B,s0,s1,cin,nf,zf,ovf,cout,G_arith);

logic: logicUnit
port map(A,B,s0,s1,G_logic);


--select arithmetic or logic unit, the two inputs are G1 AND G2, ARITHMETIC AND LOGIC RESULT RESPECTIVELY.
ALU_MUX: mux_16bit
port map(G_arith,G_logic,s2,Gout);


end Behavioral;

