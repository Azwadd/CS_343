library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Shameem_04_10_22_IMM16 is
    generic (Shameem_04_10_22_N: integer := 16);
    port (
			 Shameem_04_10_22_clock, Shameem_04_10_22_write, Shameem_04_10_22_read, Shameem_04_10_22_enable: in STD_LOGIC;
          Shameem_04_10_22_input: in STD_LOGIC_vector(Shameem_04_10_22_N-1 downto 0); 
          Shameem_04_10_22_out: out STD_LOGIC_vector(Shameem_04_10_22_N-1 downto 0)
			); 
end Shameem_04_10_22_IMM16;

architecture arch of Shameem_04_10_22_IMM16 is
signal Shameem_04_10_22_memory: STD_LOGIC_vector(Shameem_04_10_22_N-1 downto 0);
begin
	Shameem_04_10_22_P1: process(Shameem_04_10_22_clock, Shameem_04_10_22_write)
	begin
		if(rising_edge(Shameem_04_10_22_clock) AND Shameem_04_10_22_write = '1')
			then Shameem_04_10_22_memory <= Shameem_04_10_22_input; 
		end if;
	end process Shameem_04_10_22_P1;
	Shameem_04_10_22_P2: process(Shameem_04_10_22_read, Shameem_04_10_22_enable, Shameem_04_10_22_memory)
	begin
		if(Shameem_04_10_22_read = '1' AND Shameem_04_10_22_enable = '1')
			then Shameem_04_10_22_out <= Shameem_04_10_22_memory; 
		elsif(Shameem_04_10_22_enable = '0')
			then Shameem_04_10_22_out <= (others => '0');
		end if;
	end process Shameem_04_10_22_P2;
end arch;