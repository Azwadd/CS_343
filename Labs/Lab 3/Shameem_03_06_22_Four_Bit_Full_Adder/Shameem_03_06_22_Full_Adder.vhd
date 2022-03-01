library ieee;
use ieee.std_logic_1164.all;

entity Shameem_03_06_22_Full_Adder is
	port (X, Y, Cin: in STD_lOGIC;
	      Sum, Cout: out STD_lOGIC);
end Shameem_03_06_22_Full_Adder;

architecture arch of Shameem_03_06_22_Full_Adder is
signal int1, int2, int3: std_logic;
component Shameem_03_06_22_Half_Adder is
	port (X, Y: in STD_lOGIC;
	      Sum, Carry: out STD_lOGIC);
end component;
begin
	U1: Shameem_03_06_22_Half_Adder port map (X, Y, int1, int2);
	U2: Shameem_03_06_22_Half_Adder port map (int1, Cin, Sum, int3);
	Cout <= int2 or int3;	
end arch;
