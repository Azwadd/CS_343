library ieee;
use ieee.std_logic_1164.all;

entity Shameem_03_23_22_AddSubScratchCircuit is
	port 
	(
		Shameem_03_23_22_AddressA, Shameem_03_23_22_AddressB: in STD_LOGIC_VECTOR(3 downto 0);
		Shameem_03_23_22_clock, Shameem_03_23_22_Reset, Shameem_03_23_22_Sel, Shameem_03_23_22_AddSub: IN STD_LOGIC;
		Shameem_03_23_22_FinalResult: out STD_LOGIC_VECTOR(31 downto 0);
		Shameem_03_23_22_N, Shameem_03_23_22_Z, Shameem_03_23_22_O: out STD_LOGIC
	);
end Shameem_03_23_22_AddSubScratchCircuit;

architecture arch of Shameem_03_23_22_AddSubScratchCircuit is
signal Shameem_03_23_22_a, Shameem_03_23_22_b, Shameem_03_23_22_answer: STD_LOGIC_VECTOR(31 downto 0);
signal Shameem_03_23_22_wr: STD_LOGIC := '0';
component Shameem_03_23_22_DataMemory IS
	PORT
	(
		Shameem_03_23_22_address		: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		Shameem_03_23_22_clock		: IN STD_LOGIC  := '1';
		Shameem_03_23_22_data		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		Shameem_03_23_22_wren		: IN STD_LOGIC ;
		Shameem_03_23_22_q		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END component;
component Shameem_03_23_22_AddSubScratch IS
	GENERIC (N : INTEGER := 32 );
	PORT 
	(
		Shameem_03_23_22_A, Shameem_03_23_22_B : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0) ;
		Shameem_03_23_22_Clock, Shameem_03_23_22_Reset, Shameem_03_23_22_Sel, Shameem_03_23_22_AddSub: IN STD_LOGIC;
		Shameem_03_23_22_Z : BUFFER STD_LOGIC_VECTOR(N-1 DOWNTO 0) ;
		Shameem_03_23_22_Overflow : OUT STD_LOGIC 
	);
END component;
BEGIN
	Shameem_03_23_22_SRAM_A: Shameem_03_23_22_DataMemory 
		port map (Shameem_03_23_22_AddressA, Shameem_03_23_22_clock, x"00000000", Shameem_03_23_22_wr, Shameem_03_23_22_a);
		
	Shameem_03_23_22_SRAM_B: Shameem_03_23_22_DataMemory 
		port map (Shameem_03_23_22_AddressB, Shameem_03_23_22_clock, x"00000000", Shameem_03_23_22_wr, Shameem_03_23_22_b);

	Shameem_03_23_22_Math: Shameem_03_23_22_AddSubScratch
		port map (Shameem_03_23_22_a, Shameem_03_23_22_b, Shameem_03_23_22_clock, Shameem_03_23_22_Reset, 
			Shameem_03_23_22_Sel, Shameem_03_23_22_AddSub, Shameem_03_23_22_answer, Shameem_03_23_22_O);
			
	Shameem_03_23_22_FinalResult <= Shameem_03_23_22_answer;
	Shameem_03_23_22_N <= Shameem_03_23_22_answer(31);
	Shameem_03_23_22_Z <= '1' when(Shameem_03_23_22_answer=x"00000000") else '0';
END arch;