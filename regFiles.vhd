----------------------------------------------------------------------------------
--- register file
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity regFiles is

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
end regFiles;



architecture Behavioral of regFiles is


COMPONENT register4
PORT(
D : IN std_logic_vector(15 downto 0);
load : IN std_logic;
Clk : IN std_logic;
Q : OUT std_logic_vector(15 downto 0)
);

END COMPONENT;

--3 to 8 decoder.
COMPONENT three_to_eight_decoder
PORT(
a0 : IN std_logic;
a1 : IN std_logic;
a2 : IN std_logic;
a3:  IN std_logic;

q0 : OUT std_logic;
q1 : OUT std_logic;
q2 : OUT std_logic;
q3 : OUT std_logic;
q4 : OUT std_logic;
q5 : OUT std_logic;
q6 : OUT std_logic;
q7 : OUT std_logic;
q8 : OUT std_logic
);
END COMPONENT;




--8 to 1 line multiplexer
COMPONENT mux8
PORT(
in0 : IN std_logic_vector(15 downto 0);
in1 : IN std_logic_vector(15 downto 0);
in2 : IN std_logic_vector(15 downto 0);
in3 : IN std_logic_vector(15 downto 0);
in4 : IN std_logic_vector(15 downto 0);
in5 : IN std_logic_vector(15 downto 0);
in6 : IN std_logic_vector(15 downto 0);
in7 : IN std_logic_vector(15 downto 0);
in8 : IN std_logic_vector(15 downto 0);
s0 : IN std_logic;
s1 : IN std_logic; 
s2 : IN std_logic; 
s3 : IN std_logic;
Z : OUT std_logic_vector(15 downto 0)
);
END COMPONENT;



--signals



signal load_reg0, load_reg1, load_reg2, load_reg3 ,load_reg4 
,load_reg5 , load_reg6 , load_reg7, load_reg8  : std_logic;



signal loadF_reg0, loadF_reg1, loadF_reg2, loadF_reg3 ,loadF_reg4 
,loadF_reg5 , loadF_reg6 , loadF_reg7, loadF_reg8 : std_logic;

signal reg0_q, reg1_q, reg2_q, reg3_q, reg4_q, reg5_q,
reg6_q, reg7_q,reg8_q,
data_src_mux_out, src_reg : std_logic_vector(15 downto 0);


begin


--port maps for registers 0 to 7


-- register 0
reg00: register4 PORT MAP(
D => dataInput,
load => loadF_reg0,
Clk => Clk,
Q => reg0_q
);
-- register 1
reg01: register4 PORT MAP(
D => dataInput,
load => loadF_reg1,
Clk => Clk,
Q => reg1_q
);

-- register 2
reg02: register4 PORT MAP(
D => dataInput,
load => loadF_reg2,
Clk => Clk,
Q => reg2_q
);

-- register 3
reg03: register4 PORT MAP(
D => dataInput,
load => loadF_reg3,
Clk => Clk,
Q => reg3_q
);

-- register 4
reg04: register4 PORT MAP(
D => dataInput,
load => loadF_reg4,
Clk => Clk,
Q => reg4_q
);

-- register 5
reg05: register4 PORT MAP(
D => dataInput,
load => loadF_reg5,
Clk => Clk,
Q => reg5_q
);

-- register 6
reg06: register4 PORT MAP(
D => dataInput,
load => loadF_reg6,
Clk => Clk,
Q => reg6_q
);

-- register 7
reg07: register4 PORT MAP(
D => dataInput,
load => loadF_reg7,
Clk => Clk,
Q => reg7_q
);

-- register 7
reg08: register4 PORT MAP(
D => dataInput,
load => loadF_reg8,
Clk => Clk,
Q => reg8_q
);



--destination register decoder


des_decoder_4to9: three_to_eight_decoder PORT MAP(

a3 => des_A0,
a2 => des_A1,
a1 => des_A2,
a0	=> des_A3,

q0 => load_reg0,
q1 => load_reg1,
q2 => load_reg2,
q3 => load_reg3,
q4 => load_reg4,
q5 => load_reg5,
q6 => load_reg6,
q7 => load_reg7,
q8	=> load_reg8
);


-- 8 to 1 source register multiplexer for A
muxA: mux8 PORT MAP(
in0 => reg0_q,
in1 => reg1_q,
in2 => reg2_q,
in3 => reg3_q,
in4 => reg4_q,
in5 => reg5_q,
in6 => reg6_q,
in7 => reg7_q,
in8 => reg8_q,

s0 => srcA_s0,
s1 => srcA_s1,
s2 => srcA_s2,
s3 => srcA_s3,
Z => A_out
);


-- 8 to 1 source register multiplexer for B
muxB: mux8 PORT MAP(
in0 => reg0_q,
in1 => reg1_q,
in2 => reg2_q,
in3 => reg3_q,
in4 => reg4_q,
in5 => reg5_q,
in6 => reg6_q,
in7 => reg7_q,
in8 => reg8_q,

s0 => srcB_s0,
s1 => srcB_s1,
s2 => srcB_s2,
s3	=> srcB_s3,
Z => B_out
);



loadF_reg0 <= load_reg0 and RW;
loadF_reg1 <= load_reg1 and RW;
loadF_reg2 <= load_reg2 and RW;
loadF_reg3 <= load_reg3 and RW;
loadF_reg4 <= load_reg4 and RW;
loadF_reg5 <= load_reg5 and RW;
loadF_reg6 <= load_reg6 and RW;
loadF_reg7 <= load_reg7 and RW;
loadF_reg8 <= load_reg8 and RW;


reg0 <= reg0_q;
reg1 <= reg1_q;
reg2 <= reg2_q;
reg3 <= reg3_q;
reg4 <= reg4_q;
reg5 <= reg5_q;
reg6 <= reg6_q;
reg7 <= reg7_q;
reg8 <= reg8_q;

end Behavioral;

