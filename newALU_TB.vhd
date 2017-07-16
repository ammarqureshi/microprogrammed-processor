--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:22:06 03/08/2016
-- Design Name:   
-- Module Name:   C:/Users/ammar_000/Desktop/Functional Unit/newALU_TB.vhd
-- Project Name:  FunctionalUnit
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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
 
ENTITY newALU_TB IS
END newALU_TB;
 
ARCHITECTURE behavior OF newALU_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         A : IN  std_logic_vector(15 downto 0);
         B : IN  std_logic_vector(15 downto 0);
         s0 : IN  std_logic;
         s1 : IN  std_logic;
         cin : IN  std_logic;
         s2 : IN  std_logic;
         nf : OUT  std_logic;
         zf : OUT  std_logic;
         ovf : OUT  std_logic;
         cout : OUT  std_logic;
         Gout : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(15 downto 0) := (others => '0');
   signal B : std_logic_vector(15 downto 0) := (others => '0');
   signal s0 : std_logic := '0';
   signal s1 : std_logic := '0';
   signal cin : std_logic := '0';
   signal s2 : std_logic := '0';

 	--Outputs
   signal nf : std_logic;
   signal zf : std_logic;
   signal ovf : std_logic;
   signal cout : std_logic;
   signal Gout : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          A => A,
          B => B,
          s0 => s0,
          s1 => s1,
          cin => cin,
          s2 => s2,
          nf => nf,
          zf => zf,
          ovf => ovf,
          cout => cout,
          Gout => Gout
        );

  

   -- Stimulus process
   stim_proc: process
   begin		
--     --choosing logic operation --> not A
--	A<= "0000000000000011";		--3
--	B<= "0000000000000001";		--1
--	s2<='1';
--	s1<='1';
--	s0<='1';
--   --cin<='0';  
	
  wait for 100 ns;	
--select arithmetic operation --> decrement A	
	A<= "0000000000000111";		--7
	B<= "0000000000000010";		--2
	s2<='0';
	s1<='1';
	s0<='1';
   cin<='0'; 
	
--	wait for 100 ns;	
----select arithmetic operation --> subtract A and B --> A-B	
--	A<= "0000000000000111";		--7
--	B<= "0000000000000010";		--2
--	s2<='0';
--	s1<='1';
--	s0<='0';
--   cin<='1'; 
--     

      -- insert stimulus here 

      wait;
   end process;

END;
