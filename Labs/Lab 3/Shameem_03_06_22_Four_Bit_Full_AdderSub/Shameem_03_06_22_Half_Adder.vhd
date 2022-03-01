library ieee;
use ieee.std_logic_1164.all;

entity Shameem_03_06_22_Half_Adder is
	port (X, Y: in STD_lOGIC;
	      Sum, Carry: out STD_lOGIC);
end Shameem_03_06_22_Half_Adder;

architecture arch of Shameem_03_06_22_Half_Adder is
begin
	P1: process (X, Y)
		begin
			Sum <= X XOR Y;
		end process;

		P2: process (X, Y) 
		begin
			Carry <= X AND Y;
		end process;
end arch;