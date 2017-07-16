--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY logicUnit_16bits_tb IS
END logicUnit_16bits_tb;
 
ARCHITECTURE behavior OF logicUnit_16bits_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT logicUnit
    PORT(
         Ain : IN  std_logic_vector(15 downto 0);
         Bin : IN  std_logic_vector(15 downto 0);
         s0 : IN  std_logic;
         s1 : IN  std_logic;
         G : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Ain : std_logic_vector(15 downto 0) := (others => '0');
   signal Bin : std_logic_vector(15 downto 0) := (others => '0');
   signal s0 : std_logic := '0';
   signal s1 : std_logic := '0';

 	--Outputs
   signal G : std_logic_vector(15 downto 0);
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: logicUnit PORT MAP (
          Ain => Ain,
          Bin => Bin,
          s0 => s0,
          s1 => s1,
          G => G
        );



   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
    --  wait for 100 ns;	
	 
	 -- A and B
	 Ain<="0000000000000101";
	 Bin<="0000000000000110";
	  s0<='0';
	  s1<='0';

	wait for 100ns;
	 --A OR B
	 Ain<="1111111111111101";
	 Bin<="0000000000000001";
	 s0<='1';
	 s1<='0';
	 
	 

	wait for 100ns;
	 --A XOR B
	 Ain<="1111111111111101";
	 Bin<="0000000000000001";
	 s0<='0';
	 s1<='1';
	 
	 	 
	 wait for 100ns;
	 --NOT X
	 Ain<="1111111111111000";
	 Bin<="0000000000000001";
	 s0<='1';
	 s1<='1';
	 

      wait;
   end process;

END;
