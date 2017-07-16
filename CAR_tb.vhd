--------------------------------------------------------------------------------
--CAR test bench
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY CAR_tb IS
END CAR_tb;
 
ARCHITECTURE behavior OF CAR_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CAR
    PORT(
         mux_c_out : IN  std_logic_vector(7 downto 0);
         mux_s_out : IN  std_logic;
         car_out : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal mux_c_out : std_logic_vector(7 downto 0) := (others => '0');
   signal mux_s_out : std_logic := '0';

 	--Outputs
   signal car_out : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CAR PORT MAP (
          mux_c_out => mux_c_out,
          mux_s_out => mux_s_out,
          car_out => car_out
        );



   -- Stimulus process
   stim_proc: process
   begin		
    
   

      wait;
   end process;

END;
