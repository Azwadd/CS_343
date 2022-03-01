library ieee;
use ieee.std_logic_1164.all;

entity Shameem_03_06_22_Four_Bit_Full_AdderSub is
	port (Control : in STD_LOGIC;
	      A, B: in STD_LOGIC_VECTOR(3 downto 0);
	      Sum: out STD_LOGIC_VECTOR(3 downto 0);
	      Carry: out STD_LOGIC);
end Shameem_03_06_22_Four_Bit_Full_AdderSub;


architecture arch of Shameem_03_06_22_Four_Bit_Full_AdderSub is

component Shameem_03_06_22_Full_Adder
	port (A, B, Cin: in STD_LOGIC;
	      Sum, Cout: out STD_LOGIC);
end component;

signal signal_Cout, tmp : STD_LOGIC_VECTOR(3 downto 0);
begin
	tmp(0) <= B(0) xor Control;
	U1 : Shameem_03_06_22_Full_Adder port map (A(0), tmp(0), Control, Sum(0), signal_Cout(0));
	
	tmp(1) <= B(1) xor Control;
	U2 : Shameem_03_06_22_Full_Adder port map (A(1), tmp(1), signal_Cout(0), Sum(1), signal_Cout(1));
		
	tmp(2) <= B(2) xor Control;
	U3 : Shameem_03_06_22_Full_Adder port map (A(2), tmp(2), signal_Cout(1), Sum(2), signal_Cout(2));
		
	tmp(3) <= B(3) xor Control;
	U4 : Shameem_03_06_22_Full_Adder port map (A(3), tmp(3), signal_Cout(2), Sum(3), signal_Cout(3));
	Carry <= signal_Cout(3);
end arch;