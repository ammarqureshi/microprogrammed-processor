--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY logic_tb IS
END logic_tb;
 
ARCHITECTURE behavior OF logic_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT logic_unit_1bit
    PORT(
         s0 : IN  std_logic;
         s1 : IN  std_logic;
         x : IN  std_logic;
         y : IN  std_logic;
         g : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal s0 : std_logic := '0';
   signal s1 : std_logic := '0';
   signal x : std_logic := '0';
   signal y : std_logic := '0';

 	--Outputs
   signal g : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  -- constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: logic_unit_1bit PORT MAP (
          s0 => s0,
          s1 => s1,
          x => x,
          y => y,
          g => g
        );

  
 

   -- Stimulus process
   stim_proc: process
   begin		
----not x     
--	  x<='0';
--	  y<='1';
--	  s0<='1';
--	  s1<='1';
--	  
----A or b	  
--	  wait for 100ns;
--	   x<='0';
--	  y<='1';
--	  s0<='1';
--	  s1<='0';
--	  
----X xor Y	  
--	  wait for 100ns;
--	  x<='1';
--	  y<='1';
--	  
--	  s0<='0';
--	  s1<='1';
--	  
----not X	  
--	  wait for 100ns;
--	  
--	  
--	  x<='0';
--	  y<='1';
--	  
--	  s0<='1';
--	  s1<='1';
	  
	 --X xor Y	  
	 -- wait for 100ns;
	 
	 --AND
	  s0<='0';
	  s1<='0'; 

	  x<='1';
	  y<='0';
	  
	  
	  wait for 100ns;
	 --testing or 
	  s0<='1';
	  s1<='0'; 

	  x<='1';
	  y<='1';
	  
	  
	  
	  wait for 100ns;
	 --testing or 
	  s0<='1';
	  s1<='0'; 

	  x<='1';
	  y<='0';
	  
	  
	  wait for 100ns;
	 --testing xor 
	  s0<='0';
	  s1<='1'; 

	  x<='1';
	  y<='1';
	  
	  

--	x<='1';
--	y<='0';
--	
--	s0<='1';
--   s1<='0';
	
	  
	   
      wait;
   end process;

END;
