--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:41:46 02/25/2016
-- Design Name:   
-- Module Name:   U:/Assignment 2 Computer Architecture/ALU.1/temp/muxB_tb.vhd
-- Project Name:  FunctionalUnit
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mux_B
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
 
ENTITY muxB_tb IS
END muxB_tb;
 
ARCHITECTURE behavior OF muxB_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux_B
    PORT(
         B : IN  std_logic;
         s0 : IN  std_logic;
         s1 : IN  std_logic;
         Y : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal B : std_logic := '0';
   signal s0 : std_logic := '0';
   signal s1 : std_logic := '0';

 	--Outputs
   signal Y : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  -- constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux_B PORT MAP (
          B => B,
          s0 => s0,
          s1 => s1,
          Y => Y
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      
		
	
		
		--wait for 100ns;
		B<='1';
		s0<='0';
		s1<='1';
		
		
		
		wait for 100ns;
		B<='0';
		s0<='0';
		s1<='1';
		
		
		
		
		
     -- wait;
		
   end process;

END;
