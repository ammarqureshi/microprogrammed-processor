--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:21:49 03/01/2016
-- Design Name:   
-- Module Name:   C:/Users/ammar_000/Desktop/Functional Unit/regisFile_tb.vhd
-- Project Name:  FunctionalUnit
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: regFiles
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
 
ENTITY regisFile_tb IS
END regisFile_tb;
 
ARCHITECTURE behavior OF regisFile_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT regFiles
    PORT(
         srcA_s0 : IN  std_logic;
         srcA_s1 : IN  std_logic;
         srcA_s2 : IN  std_logic;
         srcB_s0 : IN  std_logic;
         srcB_s1 : IN  std_logic;
         srcB_s2 : IN  std_logic;
         des_A0 : IN  std_logic;
         des_A1 : IN  std_logic;
         des_A2 : IN  std_logic;
         dataInput : IN  std_logic_vector(15 downto 0);
         RW : IN  std_logic;
         Clk : IN  std_logic;
         A_out : OUT  std_logic_vector(15 downto 0);
         B_out : OUT  std_logic_vector(15 downto 0);
         reg0 : OUT  std_logic_vector(15 downto 0);
         reg1 : OUT  std_logic_vector(15 downto 0);
         reg2 : OUT  std_logic_vector(15 downto 0);
         reg3 : OUT  std_logic_vector(15 downto 0);
         reg4 : OUT  std_logic_vector(15 downto 0);
         reg5 : OUT  std_logic_vector(15 downto 0);
         reg6 : OUT  std_logic_vector(15 downto 0);
         reg7 : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal srcA_s0 : std_logic := '0';
   signal srcA_s1 : std_logic := '0';
   signal srcA_s2 : std_logic := '0';
   signal srcB_s0 : std_logic := '0';
   signal srcB_s1 : std_logic := '0';
   signal srcB_s2 : std_logic := '0';
   signal des_A0 : std_logic := '0';
   signal des_A1 : std_logic := '0';
   signal des_A2 : std_logic := '0';
   signal dataInput : std_logic_vector(15 downto 0) := (others => '0');
   signal RW : std_logic := '0';
   signal Clk : std_logic := '0';

 	--Outputs
   signal A_out : std_logic_vector(15 downto 0);
   signal B_out : std_logic_vector(15 downto 0);
   signal reg0 : std_logic_vector(15 downto 0);
   signal reg1 : std_logic_vector(15 downto 0);
   signal reg2 : std_logic_vector(15 downto 0);
   signal reg3 : std_logic_vector(15 downto 0);
   signal reg4 : std_logic_vector(15 downto 0);
   signal reg5 : std_logic_vector(15 downto 0);
   signal reg6 : std_logic_vector(15 downto 0);
   signal reg7 : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: regFiles PORT MAP (
          srcA_s0 => srcA_s0,
          srcA_s1 => srcA_s1,
          srcA_s2 => srcA_s2,
          srcB_s0 => srcB_s0,
          srcB_s1 => srcB_s1,
          srcB_s2 => srcB_s2,
          des_A0 => des_A0,
          des_A1 => des_A1,
          des_A2 => des_A2,
          dataInput => dataInput,
          RW => RW,
          Clk => Clk,
          A_out => A_out,
          B_out => B_out,
          reg0 => reg0,
          reg1 => reg1,
          reg2 => reg2,
          reg3 => reg3,
          reg4 => reg4,
          reg5 => reg5,
          reg6 => reg6,
          reg7 => reg7
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
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for Clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
