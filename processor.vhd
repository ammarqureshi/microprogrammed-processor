----------------------------------------------------------------------------------
-- processor implementation
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity processor is

port(CLK:in std_logic;
reset:in std_logic;
MEMORY_OUT:out std_logic_vector(15 downto 0);
A:out std_logic_vector(2 downto 0);
B:out std_logic_vector(2 downto 0);
D:out std_logic_vector(2 downto 0);
controlWordOut:out std_logic_vector(21 downto 0);
ProgCount: out std_logic_vector(15 downto 0);
PI_OUT:OUT STD_LOGIC;
IR_Reg_out:OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
B_INPUT:OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
C_adr:out std_logic_vector(7 downto 0);
IL_out:out std_logic;
function_out:out std_logic_vector(4 downto 0);
unitFunct:out std_logic_vector(15 downto 0);
data_A_in:out std_logic_vector(15 downto 0);
wholeControl:out std_logic_vector(27 downto 0);
OUTPUT_CONTROL:out std_logic_vector(12 downto 0);
MD_OUT:OUT STD_LOGIC;
--controlInput: in std_logic_vector(21 downto 0);
 reg0_p,reg1_p,reg2_p,reg3_p,reg4_p,reg5_p,reg6_p,reg7_p,reg8_p:out std_logic_vector(15 downto 0)


);

end processor;



architecture Behavioral of processor is

--port map of program counter
component pc

port(extend:in std_logic_vector(15 downto 0);
PL:in std_logic;
PI:in std_logic;
Clk : in std_logic;
pc_out:out std_logic_vector(15 downto 0);
reset:in std_logic

);
end component;


--port map of MUX S
component mux_S
port(
notZ:in std_logic;
notC:in std_logic;
N:in std_logic;
Z:in std_logic;
V:in std_logic;
C:in std_logic;
one:in std_logic;
zero:in std_logic;
MS_sel:in std_logic_vector(2 downto 0);
mux_s_out: out std_logic
);
end component;


--port map of instruction register IR
component IR
port(IL:in std_logic;
mem_out:in std_logic_vector(15 downto 0);
opcode:out std_logic_vector(6 downto 0);
DR_out:out std_logic_vector(2 downto 0);
SA_out:out std_logic_vector(2 downto 0);
SB_out:out std_logic_vector(2 downto 0);
CLK:in std_logic
);
end component;


--port map of MUX C
component mux_C
port(MC:in std_logic;
NA:in std_logic_vector(7 downto 0);
IR_out:in std_logic_vector(7 downto 0);
mux_c_out: out std_logic_vector(7 downto 0)
);
end component;


--port map of CAR-Control Address Register.
component CAR
port(
mux_c_out:in std_logic_vector(7 downto 0);
mux_s_out:in std_logic;
car_out:out std_logic_vector(7 downto 0);
CLK:in std_logic;
reset:in std_logic
);
end component;

--port map of control memory
component control_memory
Port ( MW : out std_logic;
MM : out std_logic;
RW : out std_logic;
MD : out std_logic;
FS_out : out std_logic_vector(4 downto 0);
MB : out std_logic;
TB : out std_logic;
TA : out std_logic;
TD : out std_logic;
PL : out std_logic;
PI : out std_logic;
IL : out std_logic;
MC : out std_logic;
MS_out : out std_logic_vector(2 downto 0);
NA : out std_logic_vector(7 downto 0);
IN_CAR : in std_logic_vector(7 downto 0));
end component;


--component of datapath
component datapath
port(
controlWord: in std_logic_vector(21 downto 0);
constant_in:in std_logic_vector(15 downto 0);
data_in : in std_logic_vector(15 downto 0);			--input to mux D
Clk : in std_logic;
pc_out:in std_logic_vector(15 downto 0);				--input to mux M
dataOut: out std_logic_vector(15 downto 0);			--input to memory


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

mux_out:out std_logic_vector(15 downto 0);					--input to memory
OUTfunct:out std_logic_vector(15 downto 0);
A_DATA:out std_logic_vector(15 downto 0)

);

end component;


--componet of memory module
component memory
Port ( address : in  std_logic_vector(15 downto 0);
write_data : in std_logic_vector(15 downto 0);
MemWrite: in std_logic;
read_data : out std_logic_vector(15 downto 0);
CLK: in std_logic);
end component;


--component of extend filler
component sign_extend
port(AD:in std_logic_vector(5 downto 0);
se_bits:out std_logic_vector(15 downto 0)
);
end component;



--component of zero filler
component zero_fill
port(SBin:in std_logic_vector(2 downto 0);
SBout:out std_logic_vector(15 downto 0)
);
end component;


signal pc_val,extend_out: std_logic_vector(15 downto 0);
signal PI_val,PL_val:std_logic;
signal extend_in:std_logic_vector(5 downto 0);
signal controlWord_in:std_logic_vector(21 downto 0);
signal SB_in:std_logic_vector(2 downto 0);
signal zero_fill_out:std_logic_vector(15 downto 0);
signal SB_out:std_logic_vector(15 downto 0);
signal mem_out:std_logic_vector(15 downto 0);		--data in for mux d in datapath
signal Clock: std_logic;
signal addressOut:std_logic_vector(15 downto 0);		--address out A
signal reg0_d,reg1_d,reg2_d,reg3_d,reg4_d,reg5_d,reg6_d,reg7_d,reg8_d:std_logic_vector(15 downto 0 );
signal Nflag,Cflag,Vflag,Zflag:std_logic;
signal muxM_out:std_logic_vector(15 downto 0);		--input for memory module, output of mux M'
signal datain_Mem:std_logic_vector(15 downto 0);
--signal MW_sig:std_logic;									--memmory wirte enable bit for memmory module.
--signal MC_sig:std_logic;									--enable bit for mux C from control mem
--signal MS_sig:std_logic_vector(2 downto 0);		--ms select bit from control mem, input to mux S
--signal NA_sig:std_logic_vector(7 downto 0);
--signal IL_sig:std_logic;									--IL bit for IR from control memory
signal IR_out:std_logic_vector(7 downto 0);			--output of IR input to MUX C
signal muxC_out:std_logic_vector(7 downto 0);
signal muxS_out:std_logic;
signal CAR_out:std_logic_vector(7 downto 0);			--output of CAR, input of control memmory
signal zero:std_logic:='0';
signal one:std_logic:='1';
signal opcodeBits:std_logic_vector(6 downto 0);			--output of IR 7 msb's
signal DR,SA,SB:std_logic_vector(2 downto 0);			--outputs of IR
signal MW,MM,RW,MD,MB,TB,TA,TD,PL,PI,IL,MC:std_logic;
signal FS_out:std_logic_vector(4 downto 0);
signal MS_out:std_logic_vector(2 downto 0);
signal NA:std_logic_vector(7 downto 0);
signal dataOut:std_logic_vector(15 downto 0);
signal notZflag,notCflag:std_logic;
signal CAR_out1:std_logic_vector(7 downto 0);
signal PI_v:std_logic;
--signal controlWord_in:std_logic_vector(21 downto 0);
begin



controlMem:control_memory
port map(MW,MM,RW,MD,FS_out,MB,TB,TA,TD,PL,PI,IL,MC,MS_out,NA,CAR_out1);
PI_OUT<=PI;
PI_v<=PI;
wholeControl<=NA & MS_out & MC & IL & PI &PL & TD & TA & TB & MB & FS_out &MD & RW & MM & MW;
OUTPUT_CONTROL<=TD&TA&TB&MB&FS_out&MD&RW&MM&MW;



programCounter:pc
port map(extend_out,PL,PI,CLK,pc_val,reset);

ProgCount<=pc_val;


memoryModule:memory
port map(muxM_out,dataOut,MW,mem_out,CLK);
MEMORY_OUT<=mem_out;
extendFiller:sign_extend
port map(extend_in,extend_out);


IL_out<=IL;
instruction_Reg:IR
port map(IL,mem_out,opcodeBits,DR,SA,SB,CLK);
A<=SA;
B<=SB;
D<=DR;
IR_out(7)<='0';
IR_out(6 downto 0)<=opcodeBits;
IR_Reg_out<=DR & SA & SB;
--controlWord for datapath
controlWord_in(21)<=TD;
controlWord_in(20 downto 18)<=DR;
controlWord_in(17)<=TA;
controlWord_in(16 downto 14)<=SA;
controlWord_in(13)<=TB;
controlWord_in(12 downto 10)<=SB;
controlWord_in(9)<=MB;
controlWord_in(8 downto 4)<=FS_out;
controlWord_in(3)<=MD;
controlWord_in(2)<=RW;
controlWord_in(1)<=MM;
controlWord_in(0)<=MW;
MD_OUT<=MD;
controlWordOut<=controlWord_in;

function_out(4 downto 0)<=FS_out;


zeroFiller:zero_fill
port map(SB,SB_out);
zero_fill_out<=SB_out;
B_INPUT<=SB_out;


--mem_out is the input to mux D from memory module
dataPath_processor:datapath
port map(controlWord_in,zero_fill_out,mem_out,CLK,pc_val,addressOut, reg0_d,reg1_d,reg2_d,reg3_d,reg4_d,reg5_d,reg6_d,reg7_d,reg8_d,
Nflag,Zflag,Vflag,Cflag,muxM_out,unitFunct,data_A_in);

reg0_p<=reg0_d;
reg1_p<=reg1_d;
reg2_p<=reg2_d;
reg3_p<=reg3_d;
reg4_p<=reg4_d;
reg5_p<=reg5_d;
reg6_p<=reg6_d;
reg7_p<=reg7_d;
reg8_p<=reg8_d;


muxC:mux_C
port map(MC,NA,IR_out,muxC_out);

Control_Adr_Reg:CAR
port map(muxC_out,muxS_out,CAR_out,CLK,reset);
CAR_out1<=CAR_out;
C_adr<=car_out;

muxS:mux_S
port map(notZflag,notCflag,Nflag,Zflag,Vflag,Cflag,one,zero,MS_out,muxS_out);

end Behavioral;
