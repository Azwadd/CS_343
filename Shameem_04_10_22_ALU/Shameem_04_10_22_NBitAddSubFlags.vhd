library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.std_logic_unsigned.all;

entity Shameem_04_10_22_NBitAddSubFlags is
    generic (Shameem_04_10_22_X: natural := 16);
    port (
			 Shameem_04_10_22_a, Shameem_04_10_22_b: in STD_LOGIC_VECTOR(Shameem_04_10_22_X-1 downto 0);
          Shameem_04_10_22_result: out STD_LOGIC_VECTOR(Shameem_04_10_22_X-1 downto 0);
          Shameem_04_10_22_operation: in STD_LOGIC;
          Shameem_04_10_22_o, Shameem_04_10_22_n, Shameem_04_10_22_z: out STD_LOGIC
			);
end Shameem_04_10_22_NBitAddSubFlags;

architecture arch of Shameem_04_10_22_NBitAddSubFlags is
signal Shameem_04_10_22_cin: STD_LOGIC_VECTOR(Shameem_04_10_22_X downto 0);
signal Shameem_04_10_22_tmp, Shameem_04_10_22_answer: STD_LOGIC_VECTOR(Shameem_04_10_22_X-1 downto 0); 
begin
	Shameem_04_10_22_P: process(Shameem_04_10_22_b, Shameem_04_10_22_operation)
	begin
		for i in 0 to Shameem_04_10_22_X-1 loop
			Shameem_04_10_22_tmp(i) <= Shameem_04_10_22_b(i) xor Shameem_04_10_22_operation;
			end loop;
	end process;
	Shameem_04_10_22_cin(0) <= Shameem_04_10_22_operation;
	Shameem_04_10_22_result <= Shameem_04_10_22_answer;
	Shameem_04_10_22_answer <= Shameem_04_10_22_a XOR Shameem_04_10_22_tmp XOR Shameem_04_10_22_cin(Shameem_04_10_22_X-1 downto 0);
	Shameem_04_10_22_cin(Shameem_04_10_22_X downto 1) <= (Shameem_04_10_22_a AND Shameem_04_10_22_tmp) 
		OR (Shameem_04_10_22_cin(Shameem_04_10_22_X-1 downto 0) AND (Shameem_04_10_22_a XOR Shameem_04_10_22_tmp));
	Shameem_04_10_22_o <= Shameem_04_10_22_cin(Shameem_04_10_22_X-1) XOR Shameem_04_10_22_cin(Shameem_04_10_22_X); 
	Shameem_04_10_22_n <= Shameem_04_10_22_answer(Shameem_04_10_22_X-1); 
	Shameem_04_10_22_z <= NOT(or_reduce(Shameem_04_10_22_answer)); 
end arch;