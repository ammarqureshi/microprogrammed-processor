--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:11:50 02/29/2016
-- Design Name:   
-- Module Name:   C:/Users/ammar_000/Desktop/Functional Unit/shifterUnit_tb.vhd
-- Project Name:  FunctionalUnit
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: shifterUnit
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
 
ENTITY shifterUnit_tb IS
END shifterUnit_tb;
 
ARCHITECTURE behavior OF shifterUnit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT shifterUnit
    PORT(
         B : IN  std_logic_vector(15 downto 0);
         Hselect : IN  std_logic_vector(1 downto 0);
         H : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal B : std_logic_vector(15 downto 0) := (others => '0');
   signal Hselect : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal H : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: shifterUnit PORT MAP (
          B => B,
          Hselect => Hselect,
          H => H
        );

   -- Clock process definitions
   <clock>_process :process
   begin
		<clock> <= '0';
		wait for <clock>_period/2;
		<clock> <= '1';
		wait for <clock>_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
