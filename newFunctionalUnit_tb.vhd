--------------------------------------------------------------------------------
--
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY newFunctionalUnit_tb IS
END newFunctionalUnit_tb;
 
ARCHITECTURE behavior OF newFunctionalUnit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT functionalUnit
    PORT(
         A : IN  std_logic_vector(15 downto 0);
         B : IN  std_logic_vector(15 downto 0);
         FSIN : IN  std_logic_vector(4 downto 0);
         Z : OUT  std_logic_vector(15 downto 0);
         nf : OUT  std_logic;
         zf : OUT  std_logic;
         ovf : OUT  std_logic;
         cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(15 downto 0) := (others => '0');
   signal B : std_logic_vector(15 downto 0) := (others => '0');
   signal FSIN : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal Z : std_logic_vector(15 downto 0);
   signal nf : std_logic;
   signal zf : std_logic;
   signal ovf : std_logic;
   signal cout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: functionalUnit PORT MAP (
          A => A,
          B => B,
          FSIN => FSIN,
          Z => Z,
          nf => nf,
          zf => zf,
          ovf => ovf,
          cout => cout
        );

   

   -- Stimulus process
   stim_proc: process
   begin		
     
	  --TEST THE ARITHMETIC UNIT/ ADD A+B
	A<="0000000000000001";
	B<="0000000000000011";
	FSIN<="00010";
	
	wait for 170 ns;
	 --TEST THE ARITHMETIC UNIT/ ADD A+B
	A<="0000000000000000";
	B<="0000000000000000";
	FSIN<="00010";
	
	
	--TEST INCREMENT/ A++
	 wait for 170 ns;	
	A<="1111111111111110";
	B<="0000000000000011";
	FSIN<="00001";
	
	
	--TEST SUBTRACTION/A-B/15-3 = 12= 1100
	wait for 170 ns;	
	A<="0000000000001111";		
	B<="0000000000000011";
	FSIN<="00101";

-----------------------------------------------------------
--next simulation
-----------------------------------------------------------

	--TEST AND/ A AND B

	A<="1000000000001111";		
	B<="1000000010000011";
	FSIN<="01000";
	
	--TEST XOR / A XOR B
	wait for 170 ns;	
	A<="1000000110011111";		
	B<="0000000110000011";
	FSIN<="01100";

	--TEST SHIFT RIGHT
	wait for 170 ns;	
	A<="0000000110011111";		
	B<="1100000000000011";
	FSIN<="10100";
	
	--TEST SHIFT LEFT
	wait for 170 ns;	
	A<="0000000110011111";		
	B<="1000000000000111";
	FSIN<="11000";
	  
	  
      wait;
   end process;

END;
