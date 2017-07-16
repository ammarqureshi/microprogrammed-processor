--------------------------------------------------------------------------------
--control memory test bench
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY controlMem_tb IS
END controlMem_tb;
 
ARCHITECTURE behavior OF controlMem_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT control_memory
    PORT(
         MW : OUT  std_logic;
         MM : OUT  std_logic;
         RW : OUT  std_logic;
         MD : OUT  std_logic;
         FS_out : OUT  std_logic_vector(4 downto 0);
         MB : OUT  std_logic;
         TB : OUT  std_logic;
         TA : OUT  std_logic;
         TD : OUT  std_logic;
         PL : OUT  std_logic;
         PI : OUT  std_logic;
         IL : OUT  std_logic;
         MC : OUT  std_logic;
         MS_out : OUT  std_logic_vector(2 downto 0);
         NA : OUT  std_logic_vector(7 downto 0);
         IN_CAR : IN  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal IN_CAR : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal MW : std_logic;
   signal MM : std_logic;
   signal RW : std_logic;
   signal MD : std_logic;
   signal FS_out : std_logic_vector(4 downto 0);
   signal MB : std_logic;
   signal TB : std_logic;
   signal TA : std_logic;
   signal TD : std_logic;
   signal PL : std_logic;
   signal PI : std_logic;
   signal IL : std_logic;
   signal MC : std_logic;
   signal MS_out : std_logic_vector(2 downto 0);
   signal NA : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: control_memory PORT MAP (
          MW => MW,
          MM => MM,
          RW => RW,
          MD => MD,
          FS_out => FS_out,
          MB => MB,
          TB => TB,
          TA => TA,
          TD => TD,
          PL => PL,
          PI => PI,
          IL => IL,
          MC => MC,
          MS_out => MS_out,
          NA => NA,
          IN_CAR => IN_CAR
        );

 
 

   -- Stimulus process
   stim_proc: process
   begin		
   


IN_CAR<=x"00";




      wait;
   end process;

END;
