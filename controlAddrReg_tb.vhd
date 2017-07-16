--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:03:34 04/01/2016
-- Design Name:   
-- Module Name:   C:/Users/ammar_000/Desktop/CU/Functional Unit (14)/Functional Unit/controlAddrReg_tb.vhd
-- Project Name:  FunctionalUnit
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CAR
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
 
ENTITY controlAddrReg_tb IS
END controlAddrReg_tb;
 
ARCHITECTURE behavior OF controlAddrReg_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CAR
    PORT(
         mux_c_out : IN  std_logic_vector(7 downto 0);
         mux_s_out : IN  std_logic;
         car_out : OUT  std_logic_vector(7 downto 0);
         CLK : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal mux_c_out : std_logic_vector(7 downto 0) := (others => '0');
   signal mux_s_out : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal car_out : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 50 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CAR PORT MAP (
          mux_c_out => mux_c_out,
          mux_s_out => mux_s_out,
          car_out => car_out,
          CLK => CLK
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
	
	--load
     mux_c_out<="00000001";
	 mux_s_out<='1';
	 
	 
	 --lod
	 wait for 100 ns;
	mux_c_out<="11000001";
		mux_s_out<='1';
	 
	 
	 --increment
	 wait for 100 ns;
	 mux_s_out<='0';




     wait;
   end process;

END;
