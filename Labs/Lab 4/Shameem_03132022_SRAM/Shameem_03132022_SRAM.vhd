LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity Shameem_03132022_SRAM is
	port (Shameem_03132022_I, Shameem_03132022_Sel, Shameem_03132022_WR: IN STD_LOGIC;
		   Shameem_03132022_O: OUT STD_LOGIC);
end Shameem_03132022_SRAM;

architecture arch of Shameem_03132022_SRAM is
component Shameem_03132022_TristateBuffer
	port (Shameem_03132022_A, Shameem_03132022_Enable: IN STD_LOGIC;
			Shameem_03132022_C: OUT STD_lOGIC);
end component;
signal Shameem_03132022_D0, Shameem_03132022_A: STD_LOGIC;
begin
	Shameem_03132022_A <= Shameem_03132022_Sel AND Shameem_03132022_WR;
	-- D Flip Flop
	process (Shameem_03132022_A)
	begin
		if rising_edge(Shameem_03132022_A) then 
			Shameem_03132022_d0 <= Shameem_03132022_I;
		end if;
	end process;
	Shameem_03132022_TRI: Shameem_03132022_TristateBuffer port map (Shameem_03132022_D0, Shameem_03132022_Sel, Shameem_03132022_O);
end arch;
			
		