----------------------------------------------------------------------------------
--shifter unit implementation
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shifterUnit is

port( B: in std_logic_vector(15 downto 0);
Hselect: in  std_logic_vector(1 downto 0);
H:out std_logic_vector(15 downto 0)

);



end shifterUnit;


architecture Behavioral of shifterUnit is

signal IR,IL :std_logic;

component mux4to1

port(B,in1,in2: in std_logic;
s:in std_logic_vector(1 downto 0);		
Z:out std_logic
);
end component;


begin
IR<= '0';
IL<='0';

Bit0 : mux4to1
port map(B(0),IR,B(1),Hselect,H(0));

Bit1 : mux4to1
port map(B(1),B(0),B(2),Hselect,H(1));

Bit2 : mux4to1
port map(B(2),B(1),B(3),Hselect,H(2));

Bit3 : mux4to1
port map(B(3),B(2),B(4),Hselect,H(3));

Bit4 : mux4to1
port map(B(4),B(3),B(5),Hselect,H(4));

Bit5 : mux4to1
port map(B(5),B(4),B(6),Hselect,H(5));

Bit6 : mux4to1
port map(B(6),B(5),B(7),Hselect,H(6));

Bit7 : mux4to1
port map(B(7),B(6),B(8),Hselect,H(7));

Bit8 : mux4to1
port map(B(8),B(7),B(9),Hselect,H(8));

Bit9 : mux4to1
port map(B(9),B(8),B(10),Hselect,H(9));

Bit10 : mux4to1
port map(B(10),B(9),B(11),Hselect,H(10));

Bit11 : mux4to1
port map(B(11),B(10),B(12),Hselect,H(11));

Bit12 : mux4to1
port map(B(12),B(11),B(13),Hselect,H(12));

Bit13 : mux4to1
port map(B(13),B(12),B(14),Hselect,H(13));

Bit14 : mux4to1
port map(B(14),B(13),B(15),Hselect,H(14));

Bit15 : mux4to1
port map(B(15),B(14),IL,Hselect,H(15));






end Behavioral;

