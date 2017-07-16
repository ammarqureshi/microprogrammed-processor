--------------------------------------------------------------------------------
--zero fill test bench
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY zeroFill_tb IS
END zeroFill_tb;
 
ARCHITECTURE behavior OF zeroFill_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT zero_fill
    PORT(
         SBin : IN  std_logic_vector(2 downto 0);
         SBout : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal SBin : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal SBout : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: zero_fill PORT MAP (
          SBin => SBin,
          SBout => SBout
        );

 
 

   -- Stimulus process
   stim_proc: process
   begin		
     
	  SBin<="101";
	  
	  wait for 400 ns;
	  	  SBin<="111";

	  
      wait;
   end process;

END;
