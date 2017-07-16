--------------------------------------------------------------------------------
--shift unit test bench
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY shiftUnit_tb IS
END shiftUnit_tb;
 
ARCHITECTURE behavior OF shiftUnit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT shifterUnit
    PORT(
         B : IN  std_logic_vector(15 downto 0);
         Hselect : IN  std_logic_vector(1 downto 0);
         H : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal B : std_logic_vector(15 downto 0) := (others => '0');
   signal Hselect : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal H : std_logic_vector(15 downto 0);
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: shifterUnit PORT MAP (
          B => B,
          Hselect => Hselect,
          H => H
        );


   -- Stimulus process
   stim_proc: process
   begin		
    
		B<="1111111111111111";			--TRANSFER
		Hselect<="00";

		wait for 100 ns;
		B<="1111111111111111";			--SHIFT RIGHT
		Hselect<="01";
		
		 wait for 100 ns;					--SHIFT LEFT
		B<="1111111111111110";
		Hselect<="10";
		
		
		wait;
   end process;

END;
