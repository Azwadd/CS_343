LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Shameem_Azwad_mux_2_1 IS
	PORT (X, A, B : IN STD_LOGIC;
		   Y: OUT STD_LOGIC);
END Shameem_Azwad_mux_2_1;

ARCHITECTURE LogicFunction OF Shameem_Azwad_mux_2_1 IS
BEGIN
	Y <= ((A AND NOT X) OR (B AND X));
END LogicFunction ;