library IEEE;
use IEEE.std_logic_1164.all;

entity Shameem_04_10_22_RD is
    generic (Shameem_04_10_22_N: integer := 32); 
    port (
          Shameem_04_10_22_clk, Shameem_04_10_22_wren, Shameem_04_10_22_rden, Shameem_04_10_22_chen: in STD_LOGIC;
          Shameem_04_10_22_content: in STD_LOGIC_VECTOR(Shameem_04_10_22_N-1 downto 0);
          Shameem_04_10_22_result: out STD_LOGIC_VECTOR(Shameem_04_10_22_N-1 downto 0)
			); 
end Shameem_04_10_22_RD;

architecture arch of Shameem_04_10_22_RD is
signal Shameem_04_10_22_memory: STD_LOGIC_VECTOR(Shameem_04_10_22_N-1 downto 0);
begin
  Shameem_04_10_22_P1: process(Shameem_04_10_22_clk, Shameem_04_10_22_wren)
  begin
		if (rising_edge(Shameem_04_10_22_clk) AND Shameem_04_10_22_wren = '1')
			 then Shameem_04_10_22_memory <= Shameem_04_10_22_content;
		end if; 
  end process Shameem_04_10_22_P1;
  Shameem_04_10_22_P2: process(Shameem_04_10_22_rden, Shameem_04_10_22_chen, Shameem_04_10_22_memory)
  begin
		if(Shameem_04_10_22_rden = '1' AND Shameem_04_10_22_chen = '1')
			 then Shameem_04_10_22_result <= Shameem_04_10_22_memory; 
		elsif(Shameem_04_10_22_chen = '0')
			 then Shameem_04_10_22_result <= (others => '0');
		end if;
  end process Shameem_04_10_22_P2;
end arch;