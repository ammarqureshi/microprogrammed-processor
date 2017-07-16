--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   02:09:55 04/06/2016
-- Design Name:   
-- Module Name:   C:/Users/ammar_000/Desktop/CU/Functional Unit (14)/Functional Unit/DATAPATH_PROCESSOR_tb.vhd
-- Project Name:  FunctionalUnit
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: processor
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
 
ENTITY DATAPATH_PROCESSOR_tb IS
END DATAPATH_PROCESSOR_tb;
 
ARCHITECTURE behavior OF DATAPATH_PROCESSOR_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT processor
    PORT(
         CLK : IN  std_logic;
         reset : IN  std_logic;
         MEMORY_OUT : OUT  std_logic_vector(15 downto 0);
         A : OUT  std_logic_vector(2 downto 0);
         B : OUT  std_logic_vector(2 downto 0);
         D : OUT  std_logic_vector(2 downto 0);
         controlWordOut : OUT  std_logic_vector(21 downto 0);
         ProgCount : OUT  std_logic_vector(15 downto 0);
         PI_OUT : OUT  std_logic;
         IR_Reg_out : OUT  std_logic_vector(8 downto 0);
         B_INPUT : OUT  std_logic_vector(15 downto 0);
         C_adr : OUT  std_logic_vector(7 downto 0);
         reg0_p : OUT  std_logic_vector(15 downto 0);
         reg1_p : OUT  std_logic_vector(15 downto 0);
         reg2_p : OUT  std_logic_vector(15 downto 0);
         reg3_p : OUT  std_logic_vector(15 downto 0);
         reg4_p : OUT  std_logic_vector(15 downto 0);
         reg5_p : OUT  std_logic_vector(15 downto 0);
         reg6_p : OUT  std_logic_vector(15 downto 0);
         reg7_p : OUT  std_logic_vector(15 downto 0);
         reg8_p : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal MEMORY_OUT : std_logic_vector(15 downto 0);
   signal A : std_logic_vector(2 downto 0);
   signal B : std_logic_vector(2 downto 0);
   signal D : std_logic_vector(2 downto 0);
   signal controlWordOut : std_logic_vector(21 downto 0);
   signal ProgCount : std_logic_vector(15 downto 0);
   signal PI_OUT : std_logic;
   signal IR_Reg_out : std_logic_vector(8 downto 0);
   signal B_INPUT : std_logic_vector(15 downto 0);
   signal C_adr : std_logic_vector(7 downto 0);
   signal reg0_p : std_logic_vector(15 downto 0);
   signal reg1_p : std_logic_vector(15 downto 0);
   signal reg2_p : std_logic_vector(15 downto 0);
   signal reg3_p : std_logic_vector(15 downto 0);
   signal reg4_p : std_logic_vector(15 downto 0);
   signal reg5_p : std_logic_vector(15 downto 0);
   signal reg6_p : std_logic_vector(15 downto 0);
   signal reg7_p : std_logic_vector(15 downto 0);
   signal reg8_p : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: processor PORT MAP (
          CLK => CLK,
          reset => reset,
          MEMORY_OUT => MEMORY_OUT,
          A => A,
          B => B,
          D => D,
          controlWordOut => controlWordOut,
          ProgCount => ProgCount,
          PI_OUT => PI_OUT,
          IR_Reg_out => IR_Reg_out,
          B_INPUT => B_INPUT,
          C_adr => C_adr,
          reg0_p => reg0_p,
          reg1_p => reg1_p,
          reg2_p => reg2_p,
          reg3_p => reg3_p,
          reg4_p => reg4_p,
          reg5_p => reg5_p,
          reg6_p => reg6_p,
          reg7_p => reg7_p,
          reg8_p => reg8_p
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
