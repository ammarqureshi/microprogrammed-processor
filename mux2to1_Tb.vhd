--------------------------------------------------------------------------------
-- mux 2 to 1 (16 bits)
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY mux2to1_Tb IS
END mux2to1_Tb;
 
ARCHITECTURE behavior OF mux2to1_Tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux_16bit
    PORT(
         in0 : IN  std_logic_vector(15 downto 0);
         in1 : IN  std_logic_vector(15 downto 0);
         s : IN  std_logic;
         Z : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal in0 : std_logic_vector(15 downto 0) := (others => '0');
   signal in1 : std_logic_vector(15 downto 0) := (others => '0');
   signal s : std_logic := '0';

 	--Outputs
   signal Z : std_logic_vector(15 downto 0);
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux_16bit PORT MAP (
          in0 => in0,
          in1 => in1,
          s => s,
          Z => Z
        );

   -- Stimulus process
   stim_proc: process
   begin		
      
		in0<=X"1c2d";
		in1<=X"ffff";
		
      wait for 100 ns;	
-----select input 0 ---------------------------
		s<='0';
		
   wait for 100 ns;	
-----select input 1 ---------------------------
		s<='1';
		

   end process;

END;
