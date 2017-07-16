----------------------------------------------------------------------------------
--Control Address Register
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

--use ieee.numeric_std.all;
entity CAR is

port(
mux_c_out:in std_logic_vector(7 downto 0);
mux_s_out:in std_logic;
car_out:out std_logic_vector(7 downto 0);
CLK:in std_logic;
reset:in std_logic
);
end CAR;

architecture Behavioral of CAR is


begin 
process(reset,mux_c_out,mux_s_out)

variable CAR_current:std_logic_vector(7 downto 0);
variable tempCurrCar:integer;
variable tempIncCar:std_logic_vector(7 downto 0);

begin

if(reset='1') then 
CAR_current:=x"00";
car_out<=CAR_current after 10 ns;

elsif(mux_s_out ='1') then 
CAR_current:=mux_c_out;
car_out<=CAR_current after 10 ns;

elsif(mux_s_out='0') then 
tempCurrCar:=conv_integer(CAR_current);
tempCurrCar:=tempCurrCar + conv_integer(1);
tempIncCAR:=conv_std_logic_vector(tempCurrCAR,8);
CAR_current:=tempIncCAR;
car_out<=CAR_current after 10 ns;

end if;

end process;



end Behavioral;



--signal temp,temp2:std_logic_vector(7 downto 0):="00000000";
--signal res:std_logic_vector(7 downto 0);
--begin
--
--
--sync_stuff: process(CLK)
--begin
--
--if rising_edge(CLK)then
--
--temp<=mux_c_out;
--
----load CAR
--if(mux_s_out='1') then 
--car_out<=temp;
--
----increment CAR
--elsif(mux_s_out='0') then
--car_out<= std_logic_vector( unsigned(temp) + 1);
--
--end if;
--
--
--
--end if;
--end process;

