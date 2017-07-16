--------------------------------------------------------------------------------
-- 
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY arithmetic_unit_tb IS
END arithmetic_unit_tb;
 
ARCHITECTURE behavior OF arithmetic_unit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT arithmeticUnit
    PORT(
         Ain : IN  std_logic_vector(15 downto 0);
         Bin : IN  std_logic_vector(15 downto 0);
         s0 : IN  std_logic;
         s1 : IN  std_logic;
         cin : IN  std_logic;
         nf : OUT  std_logic;
         zf : OUT  std_logic;
         ovf : OUT  std_logic;
         cout : OUT  std_logic;
         G : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

    --Inputs
   signal Ain : std_logic_vector(15 downto 0) := (others => '0');
   signal Bin : std_logic_vector(15 downto 0) := (others => '0');
   signal s0 : std_logic := '0';
   signal s1 : std_logic := '0';
   signal cin : std_logic := '0';

 	--Outputs
   signal nf : std_logic;
   signal zf : std_logic;
   signal ovf : std_logic;
   signal cout : std_logic;
   signal G : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: arithmeticUnit PORT MAP (
          Ain => Ain,
          Bin => Bin,
          s0 => s0,
          s1 => s1,
          cin => cin,
          nf => nf,
          zf => zf,
          ovf => ovf,
          cout => cout,
          G => G
        );
   

   -- Stimulus process
   stim_proc: process
   begin		


--transfer A
	Ain<="0000000000000000";
	Bin<="0000000000000001";
	cin<='0';
	s0<='0';
	s1<='0';
	
	
      wait for 100 ns;	
--increment by 1
	Ain<="0000000000000001";
	Bin<="0000000000000000";
	cin<='1';
	s0<='0';
	s1<='0';
	
--A+B	
		wait for 100ns;
	Ain<="0000000000000001";
	Bin<="0000000000000011";
	cin<='0';
	s0<='1';
	s1<='0';
	
	
--A+B+1	
	wait for 100ns;
	Ain<="0000000000000001";
	Bin<="0000000000000011";
	cin<='1';
	s0<='1';
	s1<='0';
	

--decrement by 1
		wait for 100ns;
	Ain<="0000000000000011";
	Bin<="0000000000000001";
	cin<='0';
	s0<='1';
	s1<='1';
--A-B
	wait for 100ns;
	Ain<="0000000000000111";
	Bin<="0000000000000001";
	cin<='1';
	s0<='0';
	s1<='1';
--A + COMPLEMENT OF B
	
	wait for 100ns;
	cin<='0';
	Ain<="0000000000000000";
	Bin<="0000000000000001";
	s0<='0';
	s1<='1';

	


      

      wait;
   end process;

END;
