library ieee;
use ieee.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity Shameem_04_10_22_3PortRAM is 
    port (
			 signal Shameem_04_10_22_REGWR, Shameem_04_10_22_CLK: in STD_LOGIC;
			 signal Shameem_04_10_22_Operation: in STD_LOGIC_VECTOR(3 downto 0);
			 signal Shameem_04_10_22_RD, Shameem_04_10_22_RS, Shameem_04_10_22_RT: in STD_LOGIC_VECTOR(31 downto 0);
			 signal Shameem_04_10_22_RDATA1, Shameem_04_10_22_RDATA2: out STD_LOGIC_VECTOR(31 downto 0)
         );
end entity Shameem_04_10_22_3PortRAM;

architecture arch of Shameem_04_10_22_3PortRAM is
type Shameem_04_10_22_registerFile is array(31 downto 0) of STD_LOGIC_VECTOR(31 downto 0);
signal Shameem_04_10_22_R : Shameem_04_10_22_registerFile; 
 begin
	Shameem_04_10_22_writeReg : process(Shameem_04_10_22_CLK, Shameem_04_10_22_Operation, Shameem_04_10_22_REGWR)
	begin
		if rising_edge(Shameem_04_10_22_CLK) and Shameem_04_10_22_REGWR = '1' then
			case Shameem_04_10_22_Operation is
				when "0000" =>
					Shameem_04_10_22_R(0) <= Shameem_04_10_22_RS;
					Shameem_04_10_22_R(1) <= Shameem_04_10_22_RT;
				when "0001" =>
					 Shameem_04_10_22_R(2) <= Shameem_04_10_22_RS;
					 Shameem_04_10_22_R(3) <= Shameem_04_10_22_RT;
				when "0010" =>
					 Shameem_04_10_22_R(4) <= Shameem_04_10_22_RS;
					 Shameem_04_10_22_R(5) <= Shameem_04_10_22_RT;
				when "0011" =>
					 Shameem_04_10_22_R(6) <= Shameem_04_10_22_RS;
					 Shameem_04_10_22_R(7) <= Shameem_04_10_22_RT;
				when "0100" =>
					 Shameem_04_10_22_R(8) <= Shameem_04_10_22_RS;
					 Shameem_04_10_22_R(9) <= Shameem_04_10_22_RT;
				when "0101" =>
					 Shameem_04_10_22_R(10) <= Shameem_04_10_22_RS;
					 Shameem_04_10_22_R(11) <= Shameem_04_10_22_RT;
				when "0110" =>
					 Shameem_04_10_22_R(12) <= Shameem_04_10_22_RS;
					 Shameem_04_10_22_R(13) <= Shameem_04_10_22_RT;
				when "0111" =>
					 Shameem_04_10_22_R(14) <= Shameem_04_10_22_RS;
					 Shameem_04_10_22_R(15) <= Shameem_04_10_22_RT;
				when "1000" =>
					 Shameem_04_10_22_R(16) <= Shameem_04_10_22_RS;
					 Shameem_04_10_22_R(17) <= Shameem_04_10_22_RT;
				when "1001" =>
					 Shameem_04_10_22_R(18) <= Shameem_04_10_22_RS;
					 Shameem_04_10_22_R(19) <= Shameem_04_10_22_RT;
				when "1010" =>
					 Shameem_04_10_22_R(20) <= Shameem_04_10_22_RS;
					 Shameem_04_10_22_R(21) <= Shameem_04_10_22_RT;
				when "1011" =>
					 Shameem_04_10_22_R(22) <= Shameem_04_10_22_RS;
					 Shameem_04_10_22_R(23) <= Shameem_04_10_22_RT;
				when "1100" =>
					 Shameem_04_10_22_R(24) <= Shameem_04_10_22_RS;
					 Shameem_04_10_22_R(25) <= Shameem_04_10_22_RT;
				when "1101" =>
					 Shameem_04_10_22_R(26) <= Shameem_04_10_22_RS;
					 Shameem_04_10_22_R(27) <= Shameem_04_10_22_RT;
				when "1110" =>
					 Shameem_04_10_22_R(28) <= Shameem_04_10_22_RS;
					 Shameem_04_10_22_R(29) <= Shameem_04_10_22_RT;
				when "1111" =>
					 Shameem_04_10_22_R(30) <= Shameem_04_10_22_RS;
					 Shameem_04_10_22_R(31) <= Shameem_04_10_22_RT;
				when others => null;
			end case;
		end if;
	end process;
   Shameem_04_10_22_ReadReg1 : process(Shameem_04_10_22_CLK, Shameem_04_10_22_Operation)
	begin
		case Shameem_04_10_22_Operation is
			when "0000" =>
				Shameem_04_10_22_RDATA1 <= Shameem_04_10_22_R(0);
			when "0001" =>
				Shameem_04_10_22_RDATA1 <= Shameem_04_10_22_R(2);
			when "0010" =>
				Shameem_04_10_22_RDATA1 <= Shameem_04_10_22_R(4);
			when "0011" =>
				Shameem_04_10_22_RDATA1 <= Shameem_04_10_22_R(6);
			when "0100" =>
				Shameem_04_10_22_RDATA1 <= Shameem_04_10_22_R(8);
			when "0101" =>
				Shameem_04_10_22_RDATA1 <= Shameem_04_10_22_R(10);
			when "0110" =>
				Shameem_04_10_22_RDATA1 <= Shameem_04_10_22_R(12);
			when "0111" =>
				Shameem_04_10_22_RDATA1 <= Shameem_04_10_22_R(14);
			when "1000" =>
				Shameem_04_10_22_RDATA1 <= Shameem_04_10_22_R(16);
			when "1001" =>
				Shameem_04_10_22_RDATA1 <= Shameem_04_10_22_R(18);
			when "1010" =>
				Shameem_04_10_22_RDATA1 <= Shameem_04_10_22_R(20);
			when "1011" =>
				Shameem_04_10_22_RDATA1 <= Shameem_04_10_22_R(22);
			when "1100" =>
				Shameem_04_10_22_RDATA1 <= Shameem_04_10_22_R(24);
			when "1101" =>
				Shameem_04_10_22_RDATA1 <= Shameem_04_10_22_R(26);
			when "1110" =>
				Shameem_04_10_22_RDATA1 <= Shameem_04_10_22_R(28);
			when "1111" =>
				Shameem_04_10_22_RDATA1 <= Shameem_04_10_22_R(30);
			when others => null;
		end case;
	end process;
	Shameem_04_10_22_ReadReg2 : process(Shameem_04_10_22_CLK, Shameem_04_10_22_Operation)
	begin
		case Shameem_04_10_22_Operation is
			when "0000" =>
				Shameem_04_10_22_RDATA2 <= Shameem_04_10_22_R(1);
			when "0001" =>
				Shameem_04_10_22_RDATA2 <= Shameem_04_10_22_R(3);
			when "0010" =>
				Shameem_04_10_22_RDATA2 <= Shameem_04_10_22_R(5);
			when "0011" =>
				Shameem_04_10_22_RDATA2 <= Shameem_04_10_22_R(7);
			when "0100" =>
				Shameem_04_10_22_RDATA2 <= Shameem_04_10_22_R(9);
			when "0101" =>
				Shameem_04_10_22_RDATA2 <= Shameem_04_10_22_R(11);
			when "0110" =>
				Shameem_04_10_22_RDATA2 <= Shameem_04_10_22_R(13);
			when "0111" =>
				Shameem_04_10_22_RDATA2 <= Shameem_04_10_22_R(15);
			when "1000" =>
				Shameem_04_10_22_RDATA2 <= Shameem_04_10_22_R(17);
			when "1001" =>
				Shameem_04_10_22_RDATA2 <= Shameem_04_10_22_R(19);
			when "1010" =>
				Shameem_04_10_22_RDATA2 <= Shameem_04_10_22_R(21);
			when "1011" =>
				Shameem_04_10_22_RDATA2 <= Shameem_04_10_22_R(23);
			when "1100" =>
				Shameem_04_10_22_RDATA2 <= Shameem_04_10_22_R(25);
			when "1101" =>
				Shameem_04_10_22_RDATA2 <= Shameem_04_10_22_R(27);
			when "1110" =>
				Shameem_04_10_22_RDATA2 <= Shameem_04_10_22_R(29);
			when "1111" =>
				Shameem_04_10_22_RDATA2 <= Shameem_04_10_22_R(31);
			when others => null;
		end case;
	end process;
end architecture ARCH;