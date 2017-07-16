--------------------------------------------------------------------------------
--ripple adder test bench
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY ripple_adde_tb IS
END ripple_adde_tb;
 
ARCHITECTURE behavior OF ripple_adde_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ripple_carry_adder_16bits
    PORT(
         B : IN  std_logic_vector(15 downto 0);
         A : IN  std_logic_vector(15 downto 0);
         C0 : IN  std_logic;
         S : OUT  std_logic_vector(15 downto 0);
         C4 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal B : std_logic_vector(15 downto 0) := (others => '0');
   signal A : std_logic_vector(15 downto 0) := (others => '0');
   signal C0 : std_logic := '0';

 	--Outputs
   signal S : std_logic_vector(15 downto 0);
   signal C4 : std_logic;
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ripple_carry_adder_16bits PORT MAP (
          B => B,
          A => A,
          C0 => C0,
          S => S,
          C4 => C4
        );



   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
     -- wait for 100 ns;	

		A<="0000000000000001";
		B<="0000000000000000";
		
		
		wait for 150ns;
		
		A<="1111111111111110";
		B<="1000000000000001";
		
		wait for 150 ns;
		
		A<="1100000000000011";
		B<="1100000000000011";
		
	
		wait for 150 ns;
		
		A<="0000000000000011";
		B<="0000000010000101";
		
		wait for 150 ns;
		
		A<="1000000000000001";
		B<="1000000000000001";
		
		
		
		

      wait;
   end process;

END;
