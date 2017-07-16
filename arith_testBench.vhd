--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:43:39 03/08/2016
-- Design Name:   
-- Module Name:   C:/Users/ammar_000/Desktop/Functional Unit/arith_testBench.vhd
-- Project Name:  FunctionalUnit
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: arithmeticUnit
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
 
ENTITY arith_testBench IS
END arith_testBench;
 
ARCHITECTURE behavior OF arith_testBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT arithmeticUnit
    PORT(
         Ain : IN  std_logic_vector(15 downto 0);
         Bin : IN  std_logic_vector(15 downto 0);
         s0 : IN  std_logic;
         s1 : IN  std_logic;
         cin : IN  std_logic;
         nf : OUT  std_logic;
         zf : OUT  std_logic;
         ovf : OUT  std_logic;
         cout : OUT  std_logic;
         G : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Ain : std_logic_vector(15 downto 0) := (others => '0');
   signal Bin : std_logic_vector(15 downto 0) := (others => '0');
   signal s0 : std_logic := '0';
   signal s1 : std_logic := '0';
   signal cin : std_logic := '0';

 	--Outputs
   signal nf : std_logic;
   signal zf : std_logic;
   signal ovf : std_logic;
   signal cout : std_logic;
   signal G : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: arithmeticUnit PORT MAP (
          Ain => Ain,
          Bin => Bin,
          s0 => s0,
          s1 => s1,
          cin => cin,
          nf => nf,
          zf => zf,
          ovf => ovf,
          cout => cout,
          G => G
        );

   
 

   -- Stimulus process
   stim_proc: process
   begin		
   	
------	Test ADDITION	------
	Ain<="1100000000000011";
	Bin<="0100000000000011";
	cin<='0';
	s0<='1';
	s1<='0';
	
			
	wait for 150 ns;
	Ain<="0000000000000011";
	Bin<="0100000000000011";
	cin<='0';
	s0<='1';
	s1<='0';
	
	wait for 150 ns;
	Ain<="0111111111111111";
	Bin<="1111111111111111";
	cin<='0';
	s0<='1';
	s1<='0';
	
	
	wait for 150 ns;
	Ain<="0011010100000000";
	Bin<="0101101100000000";
	cin<='0';
	s0<='1';
	s1<='0';	
		
		
	wait for 150 ns;
	Ain<="0000000000000000";
	Bin<="0000000000000000";
	cin<='0';
	s0<='1';
	s1<='0';	
			
	-------	test SUBTRACTION	------------
	wait for 100 ns;
	Ain<="1111111111111101";
	Bin<="1111111111000001";
	cin<='1';
	s0<='0';
	s1<='1';	
	
	wait for 100 ns;
	Ain<="0000000000000000";
	Bin<="0000000000000000";
	cin<='1';
	s0<='0';
	s1<='1';

      wait;
   end process;

END;
