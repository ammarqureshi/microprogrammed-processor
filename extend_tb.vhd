--------------------------------------------------------------------------------
--sign extend test bench
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY extend_tb IS
END extend_tb;
 
ARCHITECTURE behavior OF extend_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sign_extend
    PORT(
         AD : IN  std_logic_vector(5 downto 0);
         se_bits : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal AD : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal se_bits : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sign_extend PORT MAP (
          AD => AD,
          se_bits => se_bits
        );

   
 

   -- Stimulus process
   stim_proc: process
   begin		
  

      	AD<="101001";
			
			    
      wait for 100 ns;	
		AD<="011111";

      wait;
   end process;

END;
