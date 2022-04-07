library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Shameem_04_10_22_DataMemory is  
    port (
			 signal Shameem_04_10_22_clk, Shameem_04_10_22_MEMREAD, Shameem_04_10_22_MEMWRITE : in STD_LOGIC;
          signal Shameem_04_10_22_MAR, Shameem_04_10_22_WRDATA : in STD_LOGIC_VECTOR(31 downto 0);
          signal Shameem_04_10_22_Shameem_04_10_22_MDR : out STD_LOGIC_VECTOR(31 downto 0)
			);
end entity Shameem_04_10_22_DataMemory;

architecture arch of Shameem_04_10_22_DataMemory is
type Shameem_04_10_22_memory is array(3 downto 0) of STD_LOGIC_VECTOR(7 downto 0);
signal Shameem_04_10_22_data_memory : Shameem_04_10_22_memory;
begin
	Shameem_04_10_22_WriteMemory : process(Shameem_04_10_22_clk, Shameem_04_10_22_MAR, Shameem_04_10_22_MEMWRITE, Shameem_04_10_22_WRDATA)
	begin
		if rising_edge(Shameem_04_10_22_clk) and Shameem_04_10_22_MEMWRITE = '1' then
			case Shameem_04_10_22_MAR(7 downto 0) is
				when X"00" =>
					Shameem_04_10_22_data_memory(0) <= Shameem_04_10_22_WRDATA(31 downto 24);
					Shameem_04_10_22_data_memory(1) <= Shameem_04_10_22_WRDATA(23 downto 16);
					Shameem_04_10_22_data_memory(2) <= Shameem_04_10_22_WRDATA(15 downto 8);
					Shameem_04_10_22_data_memory(3) <= Shameem_04_10_22_WRDATA(7 downto 0);
				when others => null;
			end case;
		end if;
	end process;
	Shameem_04_10_22_ReadMemory : process(Shameem_04_10_22_clk, Shameem_04_10_22_MAR, Shameem_04_10_22_MEMREAD)
	begin
		if Shameem_04_10_22_MEMREAD = '1' then
			case Shameem_04_10_22_MAR(7 downto 0) is
				when X"00" =>
					Shameem_04_10_22_Shameem_04_10_22_MDR <= Shameem_04_10_22_data_memory(0) & Shameem_04_10_22_data_memory(1) & Shameem_04_10_22_data_memory(2) & Shameem_04_10_22_data_memory(3);
				when others => null;
			end case;
		end if;
	end process;
end architecture arch;