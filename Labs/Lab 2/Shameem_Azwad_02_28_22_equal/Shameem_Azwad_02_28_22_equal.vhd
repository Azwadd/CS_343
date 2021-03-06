Library ieee;
use ieee.std_logic_1164.all;

entity Shameem_Azwad_02_28_22_equal is
	port ( I0: in std_logic;
	       I1: in std_logic;
               EQ: out std_logic);
end Shameem_Azwad_02_28_22_equal;

architecture arch of Shameem_Azwad_02_28_22_equal is
signal p0: std_logic;
signal p1: std_logic;
begin
	EQ <= p0 or p1;
	p0 <= (not I0) and (not I1);
	p1 <= I0 and I1;
end arch; 
