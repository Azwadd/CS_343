library ieee;
use ieee.std_logic_1164.all;

entity Shameem_03_06_22_Four_Bit_Full_Adder is
	port (A, B : in std_logic_vector(3 downto 0);
	      Cin : in std_logic;
	      Sum : out std_logic_vector(3 downto 0);
	      Cout : out std_logic);
end Shameem_03_06_22_Four_Bit_Full_Adder;


architecture arch of Shameem_03_06_22_Four_Bit_Full_Adder is
component Shameem_03_06_22_Full_Adder
	port (A, B, Cin : in std_logic;
	      Sum, Cout : out std_logic);
end component;
signal signal_Cout : std_logic_vector(3 downto 0);
begin
	U1: Shameem_03_06_22_Full_Adder port map (A(0), B(0), Cin, Sum(0), signal_Cout(0));
	U2: Shameem_03_06_22_Full_Adder port map (A(1), B(1), signal_Cout(0), Sum(1), signal_Cout(1));
	U3: Shameem_03_06_22_Full_Adder port map (A(2), B(2), signal_Cout(1), Sum(2), signal_Cout(2));
	U4: Shameem_03_06_22_Full_Adder port map (A(3), B(3), signal_Cout(2), Sum(3), signal_Cout(3));
	Cout <= signal_Cout(3);
end arch;