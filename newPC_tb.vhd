--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:41:05 04/03/2016
-- Design Name:   
-- Module Name:   C:/Users/ammar_000/Desktop/CU/Functional Unit (14)/Functional Unit/newPC_tb.vhd
-- Project Name:  FunctionalUnit
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: pc
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
 
ENTITY newPC_tb IS
END newPC_tb;
 
ARCHITECTURE behavior OF newPC_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT pc
    PORT(
         extend : IN  std_logic_vector(15 downto 0);
         PL : IN  std_logic;
         PI : IN  std_logic;
         Clk : IN  std_logic;
         pc_out : OUT  std_logic_vector(15 downto 0);
         reset : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal extend : std_logic_vector(15 downto 0) := (others => '0');
   signal PL : std_logic := '0';
   signal PI : std_logic := '0';
   signal Clk : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal pc_out : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: pc PORT MAP (
          extend => extend,
          PL => PL,
          PI => PI,
          Clk => Clk,
          pc_out => pc_out,
          reset => reset
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
     reset<='1';
	  
	  
	  wait for 50 ns;
	  reset<='0';
	  PI<='1';
	  
	  wait for 50 ns;
	  PI<='0';
	  PL<='1';
	  extend<=x"0001";
	  

      wait;
   end process;

END;
