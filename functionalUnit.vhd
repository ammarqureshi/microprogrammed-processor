----------------------------------------------------------------------------------
--Funtional Unit
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity functionalUnit is

port(A,B: in std_logic_vector(15 downto 0);
FSIN: in std_logic_vector(4 downto 0);
Z: out std_logic_vector(15 downto 0);
nf:out std_logic;
zf:out std_logic;
ovf:out std_logic;
cout: out std_logic
);

end functionalUnit;


architecture Behavioral of functionalUnit is

component ALU
port(A,B: in std_logic_vector(15 downto 0);
s0,s1,cin,s2:in std_logic;

nf:out std_logic;
zf:out std_logic;
ovf:out std_logic;
cout: out std_logic;

Gout: out std_logic_vector(15 downto 0)
);
end component;

component shifterUnit
port( B: in std_logic_vector(15 downto 0);
Hselect: in  std_logic_vector(1 downto 0);
H:out std_logic_vector(15 downto 0)
);
end component;

component mux_16bit
port ( in0 : in std_logic_vector(15 downto 0);
in1 : in std_logic_vector(15 downto 0);
s : in std_logic;
Z : out std_logic_vector(15 downto 0));

end component;

signal ALU_OUT, SHIFT_OUT: std_logic_vector(15 downto 0);
signal carry_out:std_logic;

begin

arithmetic:ALU
port map(A,B,FSIN(1),FSIN(2),FSIN(0),FSIN(3),nf,zf,ovf,cout,ALU_OUT );

shifter:shifterUnit
port map(B,FSIN(3 downto 2),SHIFT_OUT) ;

--output of ALU and the shifter unit is the input to the MUX F and its output is the input to MUX D.
MUX_F:mux_16bit
port map(ALU_OUT,SHIFT_OUT,FSIN(4),Z);


end Behavioral;

