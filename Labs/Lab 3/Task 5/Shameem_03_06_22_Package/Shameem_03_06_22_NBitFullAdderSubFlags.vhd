library ieee;
use ieee.std_logic_1164.all;

entity Shameem_03_06_22_NBitFullAdderSubFlags is
	generic (N: integer := 4);
	port (Shameem_03_06_22_Operation: in STD_lOGIC;
	      Shameem_03_06_22_A, Shameem_03_06_22_B: in STD_lOGIC_VECTOR(N-1 downto 0);
	      Shameem_03_06_22_Sum: out STD_lOGIC_VECTOR(N-1 downto 0);
	      Shameem_03_06_22_Carry, Shameem_03_06_22_Overflow, Shameem_03_06_22_Zero, Shameem_03_06_22_Negative: out STD_lOGIC);
end Shameem_03_06_22_NBitFullAdderSubFlags;

architecture Behavioural of Shameem_03_06_22_NBitFullAdderSubFlags is
signal Shameem_03_06_22_Result, Shameem_03_06_22_Result_Zero: STD_lOGIC_VECTOR(N-1 downto 0);
signal Shameem_03_06_22_Cout, Shameem_03_06_22_int1, Shameem_03_06_22_int2, Shameem_03_06_22_int3: STD_lOGIC_VECTOR(N downto 0);
begin	
	process(Shameem_03_06_22_Operation, Shameem_03_06_22_A, Shameem_03_06_22_B, Shameem_03_06_22_Result, Shameem_03_06_22_Cout, Shameem_03_06_22_int1, Shameem_03_06_22_int2, Shameem_03_06_22_int3, Shameem_03_06_22_Result_Zero)
	begin
		Shameem_03_06_22_Cout(0) <= Shameem_03_06_22_Operation;
		for i in 0 to N-1 loop
			Shameem_03_06_22_int1(i) <= Shameem_03_06_22_B(i) XOR Shameem_03_06_22_Operation;
			Shameem_03_06_22_int2(i) <= Shameem_03_06_22_int1(i) XOR Shameem_03_06_22_A(i);
			Shameem_03_06_22_Result(i) <= Shameem_03_06_22_int2(i) XOR Shameem_03_06_22_Cout(i);
			Shameem_03_06_22_int3(i) <= Shameem_03_06_22_Cout(i) AND Shameem_03_06_22_int2(i);
			Shameem_03_06_22_Cout(i + 1) <= (Shameem_03_06_22_A(i) AND Shameem_03_06_22_int1(i)) OR Shameem_03_06_22_int3(i);
		end loop;

		-- Result output after Addition/Subtraction
		Shameem_03_06_22_Sum <= Shameem_03_06_22_Result;

		-- Carry output 
		Shameem_03_06_22_Carry <= Shameem_03_06_22_Cout(N);

		-- Negative flag if right most bit is '1' which means its negative
		Shameem_03_06_22_Negative <= Shameem_03_06_22_Result(N-1);
 		-- Overflow flag if conditions are satisfied
		if (Shameem_03_06_22_Operation = '0') then -- Checking for overflow during addition
			if (Shameem_03_06_22_A(N-1) = '0') AND (Shameem_03_06_22_B(N-1) = '0') then
				-- if positive + postive = negative ==> overflow
				if Shameem_03_06_22_Result(N-1) = '1' then
					Shameem_03_06_22_Overflow <= '1';
				elsif Shameem_03_06_22_Result(N-1) = '0' then
					Shameem_03_06_22_Overflow <= '0';
				end if;
			elsif (Shameem_03_06_22_A(N-1) = '1') AND (Shameem_03_06_22_B(N-1) = '1') then
				-- if negative + negative = positive ==> overflow
				if Shameem_03_06_22_Result(N-1) = '0' then
					Shameem_03_06_22_Overflow <= '1';
				elsif Shameem_03_06_22_Result(N-1) = '1' then
					Shameem_03_06_22_Overflow <= '0';
				end if;
			else 
				Shameem_03_06_22_Overflow <= '0';
			end if;
		elsif (Shameem_03_06_22_Operation = '1') then -- Checking for overflow during subtraction
			if (Shameem_03_06_22_A(N-1) = '0') AND (Shameem_03_06_22_B(N-1) = '1') then
				-- if positive - negative = negative ==> overflow
				if Shameem_03_06_22_Result(N-1) = '1' then
					Shameem_03_06_22_Overflow <= '1';
				elsif Shameem_03_06_22_Result(N-1) = '0' then
					Shameem_03_06_22_Overflow <= '0';
				end if;
			elsif (Shameem_03_06_22_A(N-1) = '1') AND (Shameem_03_06_22_B(N-1) = '0') then
				-- if negative - positive = positive ==> overflow
				if Shameem_03_06_22_Result(N-1) = '0' then
					Shameem_03_06_22_Overflow <= '1';
				elsif Shameem_03_06_22_Result(N-1) = '1' then
					Shameem_03_06_22_Overflow <= '0';
				end if;
			else
				Shameem_03_06_22_Overflow <= '0';
			end if;
		end if;
		-- Zero flag
		for i in 0 to N-1 loop
			Shameem_03_06_22_Result_Zero(i) <= '0';
		end loop;
		if Shameem_03_06_22_Result = Shameem_03_06_22_Result_Zero then
			Shameem_03_06_22_Zero <= '1';
		else
			Shameem_03_06_22_Zero <= '0';
		end if;
	end process;	
end Behavioural;