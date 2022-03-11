LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity Shameem_03132022_TristateBuffer is
	port (Shameem_03132022_A, Shameem_03132022_Enable: IN STD_LOGIC;
			Shameem_03132022_C: OUT STD_lOGIC);
end Shameem_03132022_TristateBuffer;

architecture arch of Shameem_03132022_TristateBuffer is
begin
	process (Shameem_03132022_A, Shameem_03132022_Enable)
		begin
			if Shameem_03132022_Enable = '1' then
				Shameem_03132022_C <= '0';
			elsif Shameem_03132022_Enable = '0' then
				Shameem_03132022_C <= 'Z';
			end if;
	end process;
end arch;
			
		