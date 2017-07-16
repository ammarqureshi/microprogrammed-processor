----------------------------------------------------------------------------------
--Datapath implementation
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity datapath is

port(
controlWord: in std_logic_vector(21 downto 0); 
constant_in:in std_logic_vector(15 downto 0);
data_in : in std_logic_vector(15 downto 0);			--input to mux D
Clk : in std_logic;
pc_out:in std_logic_vector(15 downto 0);				--input to mux M
dataOut: out std_logic_vector(15 downto 0);			--input to memory from mux M


--data in registers.
reg0 : out std_logic_vector(15 downto 0);
reg1 : out std_logic_vector(15 downto 0);
reg2 : out std_logic_vector(15 downto 0);
reg3 : out std_logic_vector(15 downto 0);
reg4 : out std_logic_vector(15 downto 0);
reg5 : out std_logic_vector(15 downto 0);
reg6 : out std_logic_vector(15 downto 0);
reg7 : out std_logic_vector(15 downto 0);
reg8 : out std_logic_vector(15 downto 0);
--output condition code flags
nf:out std_logic;
zf:out std_logic;
ovf:out std_logic;
cout: out std_logic;

mux_out:out std_logic_vector(15 downto 0)	;				--input to memory
OUTfunct:out std_logic_vector(15 downto 0);
A_DATA:out std_logic_vector(15 downto 0)

);

end datapath;

architecture Behavioral of datapath is

component functionalUnit
port(

A,B: in std_logic_vector(15 downto 0);
FSIN: in std_logic_vector(4 downto 0);
Z: out std_logic_vector(15 downto 0);
nf:out std_logic;
zf:out std_logic;
ovf:out std_logic;
cout: out std_logic);

end component;


component regFiles

Port ( 

--select input for A
srcA_s0 : in std_logic;
srcA_s1 : in std_logic;
srcA_s2 : in std_logic;
srcA_s3 : in std_logic;

--select input for B
srcB_s0 : in std_logic;
srcB_s1 : in std_logic;
srcB_s2 : in std_logic;
srcB_s3 : in std_logic;

--destination register
des_A0 : in std_logic;
des_A1 : in std_logic;
des_A2 : in std_logic;
des_A3 : in std_logic;
--input to write into registers
dataInput: in std_logic_vector(15 downto 0);

--whether register is written or not.
RW		 : in std_logic;

Clk : in std_logic;

-- A and B outputs from registers
A_out,B_out: out std_logic_vector(15 downto 0 );


--data in registers.
reg0 : out std_logic_vector(15 downto 0);
reg1 : out std_logic_vector(15 downto 0);
reg2 : out std_logic_vector(15 downto 0);
reg3 : out std_logic_vector(15 downto 0);
reg4 : out std_logic_vector(15 downto 0);
reg5 : out std_logic_vector(15 downto 0);
reg6 : out std_logic_vector(15 downto 0);
reg7 : out std_logic_vector(15 downto 0);
reg8 : out std_logic_vector(15 downto 0));

end component;

component mux_16bit 

port ( in0 : in std_logic_vector(15 downto 0);
in1 : in std_logic_vector(15 downto 0);
s : in std_logic;
Z : out std_logic_vector(15 downto 0));
end component;



signal data_A,data_B,mux_B_out,mux_D_out, functUnit_out: std_logic_vector(15 downto 0);

signal reg0_q, reg1_q, reg2_q, reg3_q, reg4_q, reg5_q,
reg6_q, reg7_q, reg8_q: std_logic_vector(15 downto 0);

signal selA_0,selA_1,selA_2,selA_3,selB_0,selB_1,selB_2,selB_3,desSel_0,desSel_1,desSel_2,desSel_3: std_logic;

signal MD,RW,MM,MW,MB: std_logic;
signal FSin:std_logic_vector(4 downto 0 );
signal mux_m_out:std_logic_vector(15 downto 0);
signal adrVar:std_logic_vector(15 downto 0);
begin

desSel_3<=controlWord(21);
desSel_2<=controlWord(20);
desSel_1<=controlWord(19);
desSel_0<=controlWord(18);

selA_3<=controlWord(17);
selA_2<=controlWord(16);
selA_1<=controlWord(15);
selA_0<=controlWord(14);

selB_3<=controlWord(13);
selB_2<=controlWord(12);
selB_1<=controlWord(11);
selB_0<=controlWord(10);

MB<=controlWord(9);
FSin<=controlWord(8 downto 4);
MD<=controlWord(3);
RW<=controlWord(2);
MM<=controlWord(1);
MW<=controlWord(0);


adrVar(3 downto 0)<=controlWord(17 downto 14);
adrVar(15 downto 4)<="000000000000";

rgFiles:regFiles
port map(selA_0,selA_1,selA_2,selA_3,selB_0,selB_1,selB_2,selB_3,desSel_0,desSel_1,desSel_2,desSel_3,
mux_D_out,	RW, Clk,	data_A, data_B, 
reg0_q, reg1_q, reg2_q, reg3_q, reg4_q, reg5_q, reg6_q, reg7_q,reg8_q
);



MUX_B:mux_16bit
port map(data_B,constant_in,MB,mux_B_out);


MUX_M:mux_16bit
port map(adrVar,pc_out,MM,mux_m_out);

mux_out<=mux_m_out;

functUnit:functionalUnit
port map(data_A,mux_B_out,FSin,functUnit_out,nf,zf,ovf,cout);

OUTfunct<=functUnit_out;
A_DATA<=data_A;
MUX_D:mux_16bit
port map(functUnit_out,data_in,MD,mux_D_out);



reg0 <= reg0_q;
reg1 <= reg1_q;
reg2 <= reg2_q;
reg3 <= reg3_q;
reg4 <= reg4_q;
reg5 <= reg5_q;
reg6 <= reg6_q;
reg7 <= reg7_q;
reg8 <= reg8_q;

dataOut<=mux_B_out;


end Behavioral;