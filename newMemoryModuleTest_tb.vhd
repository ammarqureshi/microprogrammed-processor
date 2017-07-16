--------------------------------------------------------------------------------
-- 
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY newMemoryModuleTest_tb IS
END newMemoryModuleTest_tb;
 
ARCHITECTURE behavior OF newMemoryModuleTest_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT memory
    PORT(
         address : IN  std_logic_vector(15 downto 0);
         write_data : IN  std_logic_vector(15 downto 0);
         MemWrite : IN  std_logic;
         read_data : OUT  std_logic_vector(15 downto 0);
         CLK : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal address : std_logic_vector(15 downto 0) := (others => '0');
   signal write_data : std_logic_vector(15 downto 0) := (others => '0');
   signal MemWrite : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal read_data : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: memory PORT MAP (
          address => address,
          write_data => write_data,
          MemWrite => MemWrite,
          read_data => read_data,
          CLK => CLK
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
     address<=x"0000";
		MemWrite<='0';
		
		wait for 100 ns;
		address<=x"0000";
		write_data<=x"00ff";
		MemWrite<='1';

      wait;
   end process;

END;
