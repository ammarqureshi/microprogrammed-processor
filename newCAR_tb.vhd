--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:58:53 04/03/2016
-- Design Name:   
-- Module Name:   C:/Users/ammar_000/Desktop/CU/Functional Unit (14)/Functional Unit/newCAR_tb.vhd
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
 
ENTITY newCAR_tb IS
END newCAR_tb;
 
ARCHITECTURE behavior OF newCAR_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CAR
    PORT(
         mux_c_out : IN  std_logic_vector(7 downto 0);
         mux_s_out : IN  std_logic;
         car_out : OUT  std_logic_vector(7 downto 0);
         CLK : IN  std_logic;
         reset : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal mux_c_out : std_logic_vector(7 downto 0) := (others => '0');
   signal mux_s_out : std_logic := '0';
   signal CLK : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal car_out : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 30 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CAR PORT MAP (
          mux_c_out => mux_c_out,
          mux_s_out => mux_s_out,
          car_out => car_out,
          CLK => CLK,
          reset => reset
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
      

--wait for 5ns;
reset<='1';

wait for 30 ns;
reset<='0';

--wait for 30 ns;
mux_c_out<=x"01";


wait for 30 ns;
mux_c_out<=x"A1";
mux_s_out<='1';


      wait;
   end process;

END;
