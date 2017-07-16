----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:39:27 04/01/2016 
-- Design Name: 
-- Module Name:    mux_C - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mux_C is
port(MC:in std_logic;
NA:in std_logic_vector(7 downto 0);
IR_out:in std_logic_vector(7 downto 0);
mux_c_out: out std_logic_vector(7 downto 0)
);


end mux_C;

architecture Behavioral of mux_C is

begin

process(MC,NA)
begin
if(MC='0') then
mux_c_out<= NA after 1 ns;
elsif(MC='1') then
mux_c_out<=IR_out after 1 ns ;
end if;
end process;
end Behavioral;

