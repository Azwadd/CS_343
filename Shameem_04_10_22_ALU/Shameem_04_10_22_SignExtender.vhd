library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

entity Shameem_04_10_22_SignExtender is
    port (
			 Shameem_04_10_22_input: in std_logic_vector(15 downto 0); 
          Shameem_04_10_22_output: out std_logic_vector(31 downto 0)
			);
end Shameem_04_10_22_SignExtender;

architecture arch of Shameem_04_10_22_SignExtender is
signal Shameem_04_10_22_extended: std_logic_vector(31 downto 0);
begin
	Shameem_04_10_22_output <= std_logic_vector(resize(signed(Shameem_04_10_22_input), Shameem_04_10_22_extended'length));    
end arch;