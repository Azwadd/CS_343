library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Shameem_04_10_22_InstructionRegister is  
    port (
          signal Shameem_04_10_22_clk, memwrite, rdaddress, wraddress: in STD_LOGIC;
			 signal Shameem_04_10_22_Operation: in STD_LOGIC_VECTOR(3 downto 0);
			 signal Shameem_04_10_22_RD, Shameem_04_10_22_RS, Shameem_04_10_22_RT: in STD_LOGIC_VECTOR(31 downto 0);
			 signal Shameem_04_10_22_IMM: in STD_LOGIC_VECTOR(31 downto 0);
			 signal Shameem_04_10_22_INSTRUCTION: out STD_LOGIC_VECTOR(67 downto 0)
         );
end entity Shameem_04_10_22_InstructionRegister;

architecture arch of Shameem_04_10_22_InstructionRegister is
type Shameem_04_10_22_memory is array(47 downto 0) of STD_LOGIC_VECTOR(31 downto 0);
signal Shameem_04_10_22_IR : Shameem_04_10_22_memory;
begin
	Shameem_04_10_22_writeMem : process(Shameem_04_10_22_clk, wraddress, memwrite, Shameem_04_10_22_RS, Shameem_04_10_22_RT, Shameem_04_10_22_RD, Shameem_04_10_22_IMM, Shameem_04_10_22_Operation)
	begin
		if rising_edge(Shameem_04_10_22_clk) and memwrite = '1' then
			case Shameem_04_10_22_Operation is
				when "0000" =>
					Shameem_04_10_22_IR(0)(3 downto 0) <= Shameem_04_10_22_Operation(3 downto 0);
					Shameem_04_10_22_IR(0)(31 downto 4) <= (others => '0');
					Shameem_04_10_22_IR(1) <= Shameem_04_10_22_RS(31 downto 0);
					Shameem_04_10_22_IR(2) <= Shameem_04_10_22_RT(31 downto 0);
				when "0001" =>
					Shameem_04_10_22_IR(3)(3 downto 0) <= Shameem_04_10_22_Operation(3 downto 0);
					Shameem_04_10_22_IR(3)(31 downto 4) <= (others => '0');
					Shameem_04_10_22_IR(4) <= Shameem_04_10_22_RS(31 downto 0);
					Shameem_04_10_22_IR(5) <= Shameem_04_10_22_IMM(31 downto 0);
				when "0010" =>
					Shameem_04_10_22_IR(6)(3 downto 0) <= Shameem_04_10_22_Operation(3 downto 0);
					Shameem_04_10_22_IR(6)(31 downto 4) <= (others => '0');
					Shameem_04_10_22_IR(7) <= Shameem_04_10_22_RS(31 downto 0);
					Shameem_04_10_22_IR(8) <= Shameem_04_10_22_IMM(31 downto 0);
				when "0011" =>
					Shameem_04_10_22_IR(9)(3 downto 0) <= Shameem_04_10_22_Operation(3 downto 0);
					Shameem_04_10_22_IR(9)(31 downto 4) <= (others => '0');
					Shameem_04_10_22_IR(10) <= Shameem_04_10_22_RS(31 downto 0);
					Shameem_04_10_22_IR(11) <= Shameem_04_10_22_RT(31 downto 0);
				when "0100" =>
					Shameem_04_10_22_IR(12)(3 downto 0) <= Shameem_04_10_22_Operation(3 downto 0);
					Shameem_04_10_22_IR(12)(31 downto 4) <= (others => '0');
					Shameem_04_10_22_IR(13) <= Shameem_04_10_22_RS(31 downto 0);
					Shameem_04_10_22_IR(14) <= Shameem_04_10_22_RT(31 downto 0);
				when "0101" =>
					Shameem_04_10_22_IR(15)(3 downto 0) <= Shameem_04_10_22_Operation(3 downto 0);
					Shameem_04_10_22_IR(15)(31 downto 4) <= (others => '0');
					Shameem_04_10_22_IR(16) <= Shameem_04_10_22_RS(31 downto 0);
					Shameem_04_10_22_IR(17) <= Shameem_04_10_22_RT(31 downto 0);
				when "0110" =>
					Shameem_04_10_22_IR(18)(3 downto 0) <= Shameem_04_10_22_Operation(3 downto 0);
					Shameem_04_10_22_IR(18)(31 downto 4) <= (others => '0');
					Shameem_04_10_22_IR(19) <= Shameem_04_10_22_RS(31 downto 0);
					Shameem_04_10_22_IR(20) <= Shameem_04_10_22_RT(31 downto 0);
				when "0111" =>
					Shameem_04_10_22_IR(21)(3 downto 0) <= Shameem_04_10_22_Operation(3 downto 0);
					Shameem_04_10_22_IR(21)(31 downto 4) <= (others => '0');
					Shameem_04_10_22_IR(22) <= Shameem_04_10_22_RS(31 downto 0);
					Shameem_04_10_22_IR(23) <= Shameem_04_10_22_IMM(31 downto 0);
				when "1000" =>
					Shameem_04_10_22_IR(24)(3 downto 0) <= Shameem_04_10_22_Operation(3 downto 0);
					Shameem_04_10_22_IR(24)(31 downto 4) <= (others => '0');
					Shameem_04_10_22_IR(25) <= Shameem_04_10_22_RS(31 downto 0);
					Shameem_04_10_22_IR(26) <= Shameem_04_10_22_RT(31 downto 0);
				when "1001" =>
					Shameem_04_10_22_IR(27)(3 downto 0) <= Shameem_04_10_22_Operation(3 downto 0);
					Shameem_04_10_22_IR(27)(31 downto 4) <= (others => '0');
					Shameem_04_10_22_IR(28) <= Shameem_04_10_22_RS(31 downto 0);
					Shameem_04_10_22_IR(29) <= Shameem_04_10_22_RT(31 downto 0);
				when "1010" =>
					Shameem_04_10_22_IR(30)(3 downto 0) <= Shameem_04_10_22_Operation(3 downto 0);
					Shameem_04_10_22_IR(30)(31 downto 4) <= (others => '0');
					Shameem_04_10_22_IR(31) <= Shameem_04_10_22_RS(31 downto 0);
					Shameem_04_10_22_IR(32) <= Shameem_04_10_22_IMM(31 downto 0);
				when "1011" =>
					Shameem_04_10_22_IR(33)(3 downto 0) <= Shameem_04_10_22_Operation(3 downto 0);
					Shameem_04_10_22_IR(33)(31 downto 4) <= (others => '0');
					Shameem_04_10_22_IR(34) <= Shameem_04_10_22_RS(31 downto 0);
					Shameem_04_10_22_IR(35) <= Shameem_04_10_22_IMM(31 downto 0);
				when "1100" =>
					Shameem_04_10_22_IR(36)(3 downto 0) <= Shameem_04_10_22_Operation(3 downto 0);
					Shameem_04_10_22_IR(36)(31 downto 4) <= (others => '0');
					Shameem_04_10_22_IR(37) <= Shameem_04_10_22_RS(31 downto 0);
					Shameem_04_10_22_IR(38) <= Shameem_04_10_22_IMM(31 downto 0);
				when "1101" =>
					Shameem_04_10_22_IR(39)(3 downto 0) <= Shameem_04_10_22_Operation(3 downto 0);
					Shameem_04_10_22_IR(39)(31 downto 4) <= (others => '0');
					Shameem_04_10_22_IR(40) <= Shameem_04_10_22_RS(31 downto 0);
					Shameem_04_10_22_IR(41) <= Shameem_04_10_22_IMM(31 downto 0);
				when "1110" =>
					Shameem_04_10_22_IR(42)(3 downto 0) <= Shameem_04_10_22_Operation(3 downto 0);
					Shameem_04_10_22_IR(42)(31 downto 4) <= (others => '0');
					Shameem_04_10_22_IR(43) <= Shameem_04_10_22_RS(31 downto 0);
					Shameem_04_10_22_IR(44) <= Shameem_04_10_22_IMM(31 downto 0);
				when "1111" =>
					Shameem_04_10_22_IR(45)(3 downto 0) <= Shameem_04_10_22_Operation(3 downto 0);
					Shameem_04_10_22_IR(45)(31 downto 4) <= (others => '0');
					Shameem_04_10_22_IR(46) <= Shameem_04_10_22_RS(31 downto 0);
					Shameem_04_10_22_IR(47) <= Shameem_04_10_22_IMM(31 downto 0);
				when others => null;
			end case;
		end if;
	end process;
	Shameem_04_10_22_readMem : process(Shameem_04_10_22_clk, Shameem_04_10_22_Operation)
	begin
		case Shameem_04_10_22_Operation is
			when "0000" =>
				Shameem_04_10_22_INSTRUCTION(67 downto 64) 	<= Shameem_04_10_22_IR(0)(3 downto 0);
				Shameem_04_10_22_INSTRUCTION(63 downto 32) 	<= Shameem_04_10_22_IR(1);
				Shameem_04_10_22_INSTRUCTION(31 downto 0) 	<= Shameem_04_10_22_IR(2); 
			when "0001" =>
				Shameem_04_10_22_INSTRUCTION(67 downto 64) 	<= Shameem_04_10_22_IR(3)(3 downto 0);
				Shameem_04_10_22_INSTRUCTION(63 downto 32) 	<= Shameem_04_10_22_IR(4);
				Shameem_04_10_22_INSTRUCTION(31 downto 0) 	<= Shameem_04_10_22_IR(5);
			when "0010" =>
				Shameem_04_10_22_INSTRUCTION(67 downto 64) 	<= Shameem_04_10_22_IR(6)(3 downto 0);
				Shameem_04_10_22_INSTRUCTION(63 downto 32) 	<= Shameem_04_10_22_IR(7);
				Shameem_04_10_22_INSTRUCTION(31 downto 0) 	<= Shameem_04_10_22_IR(8);
			when "0011" =>
				Shameem_04_10_22_INSTRUCTION(67 downto 64) 	<= Shameem_04_10_22_IR(9)(3 downto 0);
				Shameem_04_10_22_INSTRUCTION(63 downto 32) 	<= Shameem_04_10_22_IR(10);
				Shameem_04_10_22_INSTRUCTION(31 downto 0) 	<= Shameem_04_10_22_IR(11);
			when "0100" =>
				Shameem_04_10_22_INSTRUCTION(67 downto 64) 	<= Shameem_04_10_22_IR(12)(3 downto 0);
				Shameem_04_10_22_INSTRUCTION(63 downto 32) 	<= Shameem_04_10_22_IR(13);
				Shameem_04_10_22_INSTRUCTION(31 downto 0) 	<= Shameem_04_10_22_IR(14);
			when "0101" =>
				Shameem_04_10_22_INSTRUCTION(67 downto 64) 	<= Shameem_04_10_22_IR(15)(3 downto 0);
				Shameem_04_10_22_INSTRUCTION(63 downto 32) 	<= Shameem_04_10_22_IR(16);
				Shameem_04_10_22_INSTRUCTION(31 downto 0) 	<= Shameem_04_10_22_IR(17);
			when "0110" =>
				Shameem_04_10_22_INSTRUCTION(67 downto 64) 	<= Shameem_04_10_22_IR(18)(3 downto 0);
				Shameem_04_10_22_INSTRUCTION(63 downto 32) 	<= Shameem_04_10_22_IR(19);
				Shameem_04_10_22_INSTRUCTION(31 downto 0) 	<= Shameem_04_10_22_IR(20);
			when "0111" =>
				Shameem_04_10_22_INSTRUCTION(67 downto 64) 	<= Shameem_04_10_22_IR(21)(3 downto 0);
				Shameem_04_10_22_INSTRUCTION(63 downto 32) 	<= Shameem_04_10_22_IR(22);
				Shameem_04_10_22_INSTRUCTION(31 downto 0) 	<= Shameem_04_10_22_IR(23);
			when "1000" =>
				Shameem_04_10_22_INSTRUCTION(67 downto 64) 	<= Shameem_04_10_22_IR(24)(3 downto 0);
				Shameem_04_10_22_INSTRUCTION(63 downto 32) 	<= Shameem_04_10_22_IR(25);
				Shameem_04_10_22_INSTRUCTION(31 downto 0) 	<= Shameem_04_10_22_IR(26);
			when "1001" =>
				Shameem_04_10_22_INSTRUCTION(67 downto 64) 	<= Shameem_04_10_22_IR(27)(3 downto 0);
				Shameem_04_10_22_INSTRUCTION(63 downto 32) 	<= Shameem_04_10_22_IR(28);
				Shameem_04_10_22_INSTRUCTION(31 downto 0) 	<= Shameem_04_10_22_IR(29);
			when "1010" =>
				Shameem_04_10_22_INSTRUCTION(67 downto 64) 	<= Shameem_04_10_22_IR(30)(3 downto 0);
				Shameem_04_10_22_INSTRUCTION(63 downto 32) 	<= Shameem_04_10_22_IR(31);
				Shameem_04_10_22_INSTRUCTION(31 downto 0) 	<= Shameem_04_10_22_IR(32);
			when "1011" =>
				Shameem_04_10_22_INSTRUCTION(67 downto 64) 	<= Shameem_04_10_22_IR(33)(3 downto 0);
				Shameem_04_10_22_INSTRUCTION(63 downto 32) 	<= Shameem_04_10_22_IR(34);
				Shameem_04_10_22_INSTRUCTION(31 downto 0) 	<= Shameem_04_10_22_IR(35);
			when "1100" =>
				Shameem_04_10_22_INSTRUCTION(67 downto 64) 	<= Shameem_04_10_22_IR(36)(3 downto 0);
				Shameem_04_10_22_INSTRUCTION(63 downto 32) 	<= Shameem_04_10_22_IR(37);
				Shameem_04_10_22_INSTRUCTION(31 downto 0) 	<= Shameem_04_10_22_IR(38);
			when "1101" =>
				Shameem_04_10_22_INSTRUCTION(67 downto 64) 	<= Shameem_04_10_22_IR(39)(3 downto 0);
				Shameem_04_10_22_INSTRUCTION(63 downto 32) 	<= Shameem_04_10_22_IR(40);
				Shameem_04_10_22_INSTRUCTION(31 downto 0) 	<= Shameem_04_10_22_IR(41);
			when "1110" =>
				Shameem_04_10_22_INSTRUCTION(67 downto 64) 	<= Shameem_04_10_22_IR(42)(3 downto 0);
				Shameem_04_10_22_INSTRUCTION(63 downto 32) 	<= Shameem_04_10_22_IR(43);
				Shameem_04_10_22_INSTRUCTION(31 downto 0) 	<= Shameem_04_10_22_IR(44);
			when "1111" =>
			when others => null;
		end case;
	end process;
end architecture arch;