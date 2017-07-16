--------------------------------------------------------------------------------
--Datapath testbench
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY newDataPath_tb IS
END newDataPath_tb;
 
ARCHITECTURE behavior OF newDataPath_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
   COMPONENT datapath
PORT(
controlWord : IN  std_logic_vector(16 downto 0);
constant_in : IN  std_logic_vector(15 downto 0);
data_in : IN  std_logic_vector(15 downto 0);
Clk : IN  std_logic;
adrOut : OUT  std_logic_vector(2 downto 0);
dataOut : OUT  std_logic_vector(15 downto 0);
reg0 : OUT  std_logic_vector(15 downto 0);
reg1 : OUT  std_logic_vector(15 downto 0);
reg2 : OUT  std_logic_vector(15 downto 0);
reg3 : OUT  std_logic_vector(15 downto 0);
reg4 : OUT  std_logic_vector(15 downto 0);
reg5 : OUT  std_logic_vector(15 downto 0);
reg6 : OUT  std_logic_vector(15 downto 0);
reg7 : OUT  std_logic_vector(15 downto 0);
nf : OUT  std_logic;
zf : OUT  std_logic;
ovf : OUT  std_logic;
cout : OUT  std_logic
);
END COMPONENT;


--Inputs
signal controlWord : std_logic_vector(16 downto 0) := (others => '0');
signal constant_in : std_logic_vector(15 downto 0) := (others => '0');
signal data_in : std_logic_vector(15 downto 0) := (others => '0');
signal Clk : std_logic := '0';

--Outputs
signal adrOut : std_logic_vector(2 downto 0);
signal dataOut : std_logic_vector(15 downto 0);
signal reg0 : std_logic_vector(15 downto 0);
signal reg1 : std_logic_vector(15 downto 0);
signal reg2 : std_logic_vector(15 downto 0);
signal reg3 : std_logic_vector(15 downto 0);
signal reg4 : std_logic_vector(15 downto 0);
signal reg5 : std_logic_vector(15 downto 0);
signal reg6 : std_logic_vector(15 downto 0);
signal reg7 : std_logic_vector(15 downto 0);
signal nf : std_logic;
signal zf : std_logic;
signal ovf : std_logic;
signal cout : std_logic;

-- Clock period definitions
constant Clk_period : time := 20 ns;




BEGIN

-- Instantiate the Unit Under Test (UUT)
uut: datapath PORT MAP (
controlWord => controlWord,
constant_in => constant_in,
data_in => data_in,
Clk => Clk,
adrOut =>adrOut,
dataOut=>dataOut,
reg0 => reg0,
reg1 => reg1,
reg2 => reg2,
reg3 => reg3,
reg4 => reg4,
reg5 => reg5,
reg6 => reg6,
reg7 => reg7,
nf => nf,
zf => zf,
ovf => ovf,
cout => cout
);

-- Clock process definitions
Clk_process :process
begin
Clk <= '0';
wait for Clk_period/2;
Clk <= '1';
wait for Clk_period/2;
end process;


-- Stimulus process
stim_proc: process
begin


---------transferring own data into specified registers------

--transfer data into register 0

controlWord <="00000000000000011";
  --data_in <="0111111111111111";
data_in <="0000000000000011";
wait for 20 ns;
--transfer data into register 1
controlWord <="00100000000000011";
data_in <="0000000000000101";
--data_in <="0110000000000101";

wait for 20 ns;
--	transfer data into register 2
controlWord <="01000000100000011";
data_in <="1111111111111110";
wait for 20 ns;
--	transfer data into register 3
controlWord <="01100000100000011";
data_in <="0000000000000111";
wait for 20 ns;
--	transfer data into register 4
controlWord <="10000000100000011";
data_in <="0000000000000011";
wait for 20 ns;
--	transfer data into register 5
controlWord <="10100000100000011";
data_in <=X"5a02";
wait for 20 ns;
--	transfer data into register 6
controlWord <="11000000100000011";
data_in <="0000000000000000";
wait for 20 ns;
--	transfer data into register 7
controlWord <="11100000100000011";
data_in <="1111111111111111";



------------------	simulate arithmetic unit operation	------------------------


----- test INCREMENT and ADD A and B -------

wait for 30 ns;
--add register 6 with a constant value.
controlWord<="11111011010001001";
constant_in<="0000000000000000";


wait for 180 ns;
--increment data of register 2 and store it in register 7
controlWord <="11101000100000101";


------	test SUBTRACTION 	----------
wait for 100 ns;
--reg0 = reg7 - reg3
controlWord<="00011101100010101";


------	test second TRANSFER command	----------
wait for 150 ns;
--transfer data in register 0 into register 6
controlWord<="11000000000011101";


------	test ADD WITH C	-------------	
--reg0 + reg1 + 1
wait for 150 ns;
controlWord<="11100000100001101";




---------------------------------------------------------
--simulate shift unit
---------------------------------------------------------


--	test A + complement of B
--test reg0 + complement of reg1
wait for 170 ns;
controlWord<="11100000100010001";


--change from arithmetic by chaning msb of fs, will raise flags in the arithmetic unit as same select line
--test shifting right
wait for 170 ns;
controlWord<="11100001010010001";


--test shifhting left reg5 store in register 7
wait for 180 ns;
controlWord<="11100010101100001";


--shift register 2 to left store in register 3
wait for 170 ns;
controlWord<="11100000001100001";


-----------------------------------------------------------------
--test the logical unit
-----------------------------------------------------------------


wait for 150 ns;
--reg2 = reg0 AND reg1 
controlWord<="01000000100100001";

wait for 150 ns;
--reg6 = reg0 OR reg1
controlWord<="11000000100101001";

wait for 150 ns;
--reg7 = NOT reg0
controlWord<="11100001000111001";


wait;
end process;

END;
 
