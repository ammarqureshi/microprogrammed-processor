--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
--arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY ALU_tb IS
END ALU_tb;
 
ARCHITECTURE behavior OF ALU_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         A : IN  std_logic_vector(15 downto 0);
         B : IN  std_logic_vector(15 downto 0);
         s0 : IN  std_logic;
         s1 : IN  std_logic;
         cin : IN  std_logic;
         s2 : IN  std_logic;
         Gout : OUT  std_logic_vector(15 downto 0);
         cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(15 downto 0) := (others => '0');
   signal B : std_logic_vector(15 downto 0) := (others => '0');
   signal s0 : std_logic := '0';
   signal s1 : std_logic := '0';
   signal cin : std_logic := '0';
   signal s2 : std_logic := '0';

 	--Outputs
   signal Gout : std_logic_vector(15 downto 0);
   signal cout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 --  constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          A => A,
          B => B,
          s0 => s0,
          s1 => s1,
          cin => cin,
          s2 => s2,
          Gout => Gout,
          cout => cout
        );

   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
	
--choosing logic operation --> not A
	A<= "0000000000000011";		--3
	B<= "0000000000000001";		--1
	s2<='1';
	s1<='1';
	s0<='1';
   --cin<='0';  
	
  wait for 100 ns;	
--select arithmetic operation --> decrement A	
	A<= "0000000000000111";		--7
	B<= "0000000000000010";		--2
	s2<='0';
	s1<='1';
	s0<='1';
   cin<='0'; 
	
	wait for 100 ns;	
--select arithmetic operation --> subtract A and B --> A-B	
	A<= "0000000000000111";		--7
	B<= "0000000000000010";		--2
	s2<='0';
	s1<='1';
	s0<='0';
   cin<='1'; 
	
	
	
	
     wait;
   end process;

END;
