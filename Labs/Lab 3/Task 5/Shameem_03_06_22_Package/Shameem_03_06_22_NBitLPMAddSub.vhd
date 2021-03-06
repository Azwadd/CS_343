LIBRARY ieee;
USE ieee.std_logic_1164.all;
LIBRARY lpm;
USE lpm.lpm_components.all;

ENTITY Shameem_03_06_22_NBitLPMAddSub IS
	generic (N: integer := 16);
	PORT (Shameem_03_06_22_Operation: IN STD_LOGIC;
	      Shameem_03_06_22_A, Shameem_03_06_22_B: IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
	      Shameem_03_06_22_Result: OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);
	      Shameem_03_06_22_Overflow: OUT STD_LOGIC);
END Shameem_03_06_22_NBitLPMAddSub;

ARCHITECTURE arch OF Shameem_03_06_22_NBitLPMAddSub IS
SIGNAL Shameem_03_06_22_sub_wire0: STD_LOGIC;
SIGNAL Shameem_03_06_22_sub_wire1: STD_LOGIC_VECTOR (N-1 DOWNTO 0);
COMPONENT lpm_add_sub
	GENERIC (lpm_width: NATURAL;
		lpm_direction: STRING;
		lpm_type: STRING;
		lpm_hint: STRING);
	PORT (dataa: IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		   add_sub: IN STD_LOGIC;
		   datab: IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		   overflow: OUT STD_LOGIC;
		   result: OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0) );
END COMPONENT;
BEGIN
	Shameem_03_06_22_Overflow <= Shameem_03_06_22_sub_wire0;
	Shameem_03_06_22_Result <= Shameem_03_06_22_sub_wire1(N-1 DOWNTO 0);
	lpm_add_sub_component: lpm_add_sub
	GENERIC MAP (lpm_width => N,
					 lpm_direction => "UNUSED",
					 lpm_type => "LPM_ADD_SUB",
	             lpm_hint => "ONE_INPUT_IS_CONSTANT=NO,CIN_USED=NO")
	PORT MAP (dataa => Shameem_03_06_22_A,
	          add_sub => Shameem_03_06_22_Operation,
	          datab => Shameem_03_06_22_B,
	          overflow => Shameem_03_06_22_sub_wire0,
	          result => Shameem_03_06_22_sub_wire1);
END arch;