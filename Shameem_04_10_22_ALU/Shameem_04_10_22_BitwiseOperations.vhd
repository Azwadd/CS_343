library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

entity Shameem_04_10_22_BitwiseOperations is
    generic(Shameem_04_10_22_N: integer := 32);
    port (
          Shameem_04_10_22_input1, Shameem_04_10_22_input2, Shameem_04_10_22_ext: in STD_LOGIC_VECTOR(Shameem_04_10_22_N-1 downto 0);
          Shameem_04_10_22_imm: in STD_LOGIC_VECTOR(15 downto 0);
          Shameem_04_10_22_operation: in STD_LOGIC_VECTOR(3 downto 0); 
          Shameem_04_10_22_output: out STD_LOGIC_VECTOR(Shameem_04_10_22_N-1 downto 0));
end Shameem_04_10_22_BitwiseOperations;

architecture arch of Shameem_04_10_22_BitwiseOperations is
signal Shameem_04_10_22_answer: STD_LOGIC_VECTOR(Shameem_04_10_22_N-1 downto 0);
begin
	Shameem_04_10_22_P: 
	process(Shameem_04_10_22_input1, Shameem_04_10_22_input2, Shameem_04_10_22_ext, Shameem_04_10_22_operation, Shameem_04_10_22_answer)
		begin
			case Shameem_04_10_22_operation is
				when "0110" => Shameem_04_10_22_answer <= Shameem_04_10_22_input1 AND Shameem_04_10_22_input2;
				when "0111" => Shameem_04_10_22_answer <= Shameem_04_10_22_input1 AND Shameem_04_10_22_ext;
				when "1000" => Shameem_04_10_22_answer <= Shameem_04_10_22_input1 NOR Shameem_04_10_22_input2;
				when "1001" => Shameem_04_10_22_answer <= Shameem_04_10_22_input1 OR Shameem_04_10_22_input2;                    
				when "1010" => Shameem_04_10_22_answer <= Shameem_04_10_22_input1 OR Shameem_04_10_22_ext;
				when "1011" => Shameem_04_10_22_answer <= STD_LOGIC_VECTOR(shift_left(unsigned(Shameem_04_10_22_input2), 
					to_integer(unsigned(Shameem_04_10_22_imm))));
				when "1100" => Shameem_04_10_22_answer <= STD_LOGIC_VECTOR(shift_right(unsigned(Shameem_04_10_22_input2), 
					to_integer(unsigned(Shameem_04_10_22_imm))));
				when "1101" => Shameem_04_10_22_answer <= STD_LOGIC_VECTOR(shift_right(unsigned(Shameem_04_10_22_input2), 
				to_integer(unsigned(Shameem_04_10_22_imm)))); 
				when others => Shameem_04_10_22_answer <= x"00000000";
		end case;
		Shameem_04_10_22_output <= Shameem_04_10_22_answer;
	end process;
end arch;