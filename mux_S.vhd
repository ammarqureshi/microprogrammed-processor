----------------------------------------------------------------------------------
--mux s
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mux_S is
port(
notZ:in std_logic;
notC:in std_logic;
N:in std_logic;
Z:in std_logic;
V:in std_logic;
C:in std_logic;
one:in std_logic;
zero:in std_logic;
MS_sel:in std_logic_vector(2 downto 0);
mux_s_out: out std_logic
);


end mux_S;

architecture Behavioral of mux_S is

begin

mux_s_out<=zero after 1 ns when MS_sel="000" else
one after 1 ns when MS_sel="001" else
C after 1 ns when MS_sel="010" else
V after 1 ns when MS_sel="011" else
Z after 1 ns when MS_sel="100" else
N after 1 ns when MS_sel="101" else
notC after 1 ns when MS_sel="110" else
notZ after 1 ns when MS_sel="111";



end Behavioral;

