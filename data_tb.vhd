--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:09:03 03/04/2016
-- Design Name:   
-- Module Name:   C:/Users/ammar_000/Desktop/Functional Unit/data_tb.vhd
-- Project Name:  FunctionalUnit
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: datapath
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY data_tb IS
END data_tb;
 
ARCHITECTURE behavior OF data_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT datapath
    PORT(
        controlWord : IN  std_logic_vector(16 downto 0);
         constant_in : IN  std_logic_vector(15 downto 0);
         data_in : IN  std_logic_vector(15 downto 0);
         Clk : IN  std_logic;
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
   constant Clk_period : time := 40 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: datapath PORT MAP (
          controlWord => controlWord,
          constant_in => constant_in,
          data_in => data_in,
          Clk => Clk,
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
	
	-----------------------transferring own data into specified registers--------------------------------------
	 
	--transfer data into register 0
			
		controlWord <="00000000000000011";
      --  data_in <="0111111111111111";
		  data_in <="0000000000000011";
	 wait for 40 ns; 
	 --transfer data into register 1
			controlWord <="00100000000000011";
         data_in <="0000000000000101";
	wait for 40 ns;	
	--	transfer data into register 2
			controlWord <="01000000100000011";
         data_in <="1111111111111111";
	wait for 40 ns;		
	--	transfer data into register 3
			controlWord <="01100000100000011";
         data_in <="0000000000000111";			
	wait for 40 ns;
	--	transfer data into register 4
			controlWord <="10000000100000011";
         data_in <="0000000000000011";
	wait for 40 ns;		
		--	transfer data into register 5
			controlWord <="10100000100000011";
         data_in <=X"5a02";		
	wait for 40 ns;
	--	transfer data into register 6
			controlWord <="11000000100000011";
         data_in <="0000000000000000";
	wait for 40 ns;
	--	transfer data into register 7
			controlWord <="11100000100000011";
         data_in <="1111111111111111";			



wait for 10 ns;
---------------------simulate arithmetic operations--------------------------------


		
wait for 40 ns;

--add register 6 with a constant value.
	
			controlWord<="11111011010001001";
			constant_in<="0000000000000000";
		


wait for 40 ns;

--increment data of register 1 and store it in register 7
    	controlWord <="11100100100000101";

--
--
wait for 40 ns;

--increment data of register 2 and store it in register 7
    	controlWord <="11101000100000101";

 wait for 40 ns;	
--add data in register 0 and 1 and store it in register 7
			controlWord <="11100000100001001";
			

wait for 40 ns;

--subtract data reg1 - reg0

	controlWord<="01000100000010101";		




      wait;
   end process;

END;
