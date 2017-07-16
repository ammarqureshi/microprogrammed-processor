----------------------------------------------------------------------------------
-- sign extend 6 bits from IR-->SE DRS_B
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;
entity sign_extend is

port(AD:in std_logic_vector(5 downto 0);
se_bits:out std_logic_vector(15 downto 0)
);


end sign_extend;

architecture Behavioral of sign_extend is
signal msb:std_logic;
begin
msb<=AD(5);
se_bits(2 downto 0)<=AD(2 downto 0);
se_bits(5 downto 3)<=AD(5 downto 3);

se_bits(15)<=msb;
se_bits(14)<=msb;
se_bits(13)<=msb;
se_bits(12)<=msb;
se_bits(11)<=msb;
se_bits(10)<=msb;
se_bits(9)<=msb;
se_bits(8)<=msb;
se_bits(7)<=msb;
se_bits(6)<=msb;



end Behavioral;

