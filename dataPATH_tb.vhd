--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:03:53 04/03/2016
-- Design Name:   
-- Module Name:   C:/Users/ammar_000/Desktop/CU/Functional Unit (14)/Functional Unit/dataPath_tb.vhd
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
 
ENTITY dataPath_tb IS
END dataPath_tb;
 
ARCHITECTURE behavior OF dataPath_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT datapath
    PORT(
         controlWord : IN  std_logic_vector(21 downto 0);
         constant_in : IN  std_logic_vector(15 downto 0);
         data_in : IN  std_logic_vector(15 downto 0);
         Clk : IN  std_logic;
         pc_out : IN  std_logic_vector(15 downto 0);
         dataOut : OUT  std_logic_vector(15 downto 0);
         reg0 : OUT  std_logic_vector(15 downto 0);
         reg1 : OUT  std_logic_vector(15 downto 0);
         reg2 : OUT  std_logic_vector(15 downto 0);
         reg3 : OUT  std_logic_vector(15 downto 0);
         reg4 : OUT  std_logic_vector(15 downto 0);
         reg5 : OUT  std_logic_vector(15 downto 0);
         reg6 : OUT  std_logic_vector(15 downto 0);
         reg7 : OUT  std_logic_vector(15 downto 0);
         reg8 : OUT  std_logic_vector(15 downto 0);
         nf : OUT  std_logic;
         zf : OUT  std_logic;
         ovf : OUT  std_logic;
         cout : OUT  std_logic;
         mux_out : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal controlWord : std_logic_vector(21 downto 0) := (others => '0');
   signal constant_in : std_logic_vector(15 downto 0) := (others => '0');
   signal data_in : std_logic_vector(15 downto 0) := (others => '0');
   signal Clk : std_logic := '0';
   signal pc_out : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal dataOut : std_logic_vector(15 downto 0);
   signal reg0 : std_logic_vector(15 downto 0);
   signal reg1 : std_logic_vector(15 downto 0);
   signal reg2 : std_logic_vector(15 downto 0);
   signal reg3 : std_logic_vector(15 downto 0);
   signal reg4 : std_logic_vector(15 downto 0);
   signal reg5 : std_logic_vector(15 downto 0);
   signal reg6 : std_logic_vector(15 downto 0);
   signal reg7 : std_logic_vector(15 downto 0);
   signal reg8 : std_logic_vector(15 downto 0);
   signal nf : std_logic;
   signal zf : std_logic;
   signal ovf : std_logic;
   signal cout : std_logic;
   signal mux_out : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: datapath PORT MAP (
          controlWord => controlWord,
          constant_in => constant_in,
          data_in => data_in,
          Clk => Clk,
          pc_out => pc_out,
          dataOut => dataOut,
          reg0 => reg0,
          reg1 => reg1,
          reg2 => reg2,
          reg3 => reg3,
          reg4 => reg4,
          reg5 => reg5,
          reg6 => reg6,
          reg7 => reg7,
          reg8 => reg8,
          nf => nf,
          zf => zf,
          ovf => ovf,
          cout => cout,
          mux_out => mux_out
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
     
	  
	  
	  controlWord<="0000100000001100000100";
	contant_in<=x"ffff";
	data_in<=x"1111";
      wait;
   end process;

END;
