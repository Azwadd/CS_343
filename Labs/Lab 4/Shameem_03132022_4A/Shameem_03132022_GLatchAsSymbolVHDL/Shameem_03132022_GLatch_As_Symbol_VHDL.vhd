-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"
-- CREATED		"Wed Mar 09 15:22:47 2022"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 
LIBRARY WORK;

ENTITY Shameem_03132022_GLatch_As_Symbol_VHDL is
	PORT (Shameem_03132022_PRN :  IN  STD_LOGIC;
	      Shameem_03132022_D :  IN  STD_LOGIC;
	      Shameem_03132022_E :  IN  STD_LOGIC;
	      Shameem_03132022_CLRN :  IN  STD_LOGIC;
	      Shameem_03132022_Q :  OUT  STD_LOGIC);
END Shameem_03132022_GLatch_As_Symbol_VHDL;

ARCHITECTURE bdf_type OF Shameem_03132022_GLatch_As_Symbol_VHDL IS 
BEGIN 
	PROCESS(Shameem_03132022_CLRN,Shameem_03132022_PRN,Shameem_03132022_E,Shameem_03132022_D)
	BEGIN
		IF (Shameem_03132022_CLRN = '0') THEN
			Shameem_03132022_Q <= '0';
		ELSIF (Shameem_03132022_PRN = '0') THEN
			Shameem_03132022_Q <= '1';
		ELSIF (Shameem_03132022_E = '1') THEN
			Shameem_03132022_Q <= Shameem_03132022_D;
		END IF;
	END PROCESS;
END bdf_type;