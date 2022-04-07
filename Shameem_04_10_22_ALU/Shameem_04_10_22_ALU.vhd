library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_signed.all;
use IEEE.numeric_std.all;

entity Shameem_04_10_22_ALU is
	generic(N: integer := 32);
	port (
		   Shameem_04_10_22_clk: in std_logic;
		   Shameem_04_10_22_RSinput, Shameem_04_10_22_RTinput, Shameem_04_10_22_MDRinput: in std_logic_vector (N-1 downto 0); 		
			Shameem_04_10_22_imm: in std_logic_vector (15 downto 0); 		
			Shameem_04_10_22_operation: in std_logic_vector(3 downto 0); 	
			Shameem_04_10_22_RDinput: out std_logic_vector (N-1 downto 0); 
			Shameem_04_10_22_RDoutput: out std_logic_vector (N-1 downto 0); 
			Shameem_04_10_22_O, Shameem_04_10_22_N, Shameem_04_10_22_Z: out std_logic := '0'
		  );
end Shameem_04_10_22_ALU;

architecture arch of Shameem_04_10_22_ALU is
	signal Shameem_04_10_22_cout, Shameem_04_10_22_tmp1, Shameem_04_10_22_tmp2, Shameem_04_10_22_tmp3, Shameem_04_10_22_tmp4, Shameem_04_10_22_tmp5, 
		Shameem_04_10_22_tmp6, Shameem_04_10_22_tmp7, Shameem_04_10_22_tmp8, Shameem_04_10_22_tmp9, z_tmp3, Shameem_04_10_22_tmp10, 
		Shameem_04_10_22_tmp11, Shameem_04_10_22_tmp12, Shameem_04_10_22_tmp13, Shameem_04_10_22_tmp14, Shameem_04_10_22_tmp15, Shameem_04_10_22_tmp16,
		Shameem_04_10_22_tmp17, Shameem_04_10_22_tmp18, Shameem_04_10_22_tmp19, Shameem_04_10_22_tmp20, 
		Shameem_04_10_22_MARwren, Shameem_04_10_22_MDRwren: std_logic := '0';
	signal Shameem_04_10_22_tmp21, Shameem_04_10_22_tmp22, Shameem_04_10_22_tmp23, Shameem_04_10_22_tmp24, Shameem_04_10_22_tmp25, 
		Shameem_04_10_22_tmp26, Shameem_04_10_22_tmp27: std_logic_vector (N-1 downto 0);
	signal Shameem_04_10_22_RSout, Shameem_04_10_22_RTout, Shameem_04_10_22_RToutput, Shameem_04_10_22_RDin, Shameem_04_10_22_EXTout, 
		Shameem_04_10_22_MARoutput, Shameem_04_10_22_MDRoutput: std_logic_vector (N-1 downto 0);
	signal imm_o: std_logic_vector (15 downto 0);
	
	component Shameem_04_10_22_RS is
		 generic (Shameem_04_10_22_N: integer := 32);
		 port (
				 Shameem_04_10_22_clk, Shameem_04_10_22_wren, Shameem_04_10_22_rden, Shameem_04_10_22_chen: in STD_LOGIC;
				 Shameem_04_10_22_content: in STD_LOGIC_VECTOR(Shameem_04_10_22_N-1 downto 0); 
				 Shameem_04_10_22_result: out STD_LOGIC_VECTOR(Shameem_04_10_22_N-1 downto 0)
			  );
	end component;
	
	component Shameem_04_10_22_RT is
		 generic (Shameem_04_10_22_N: integer := 32);
		 port (
				 Shameem_04_10_22_clk, Shameem_04_10_22_wren, Shameem_04_10_22_rden, Shameem_04_10_22_chen: in STD_LOGIC;
				 Shameem_04_10_22_content: in STD_LOGIC_VECTOR(Shameem_04_10_22_N-1 downto 0); 
				 Shameem_04_10_22_result: out STD_LOGIC_VECTOR(Shameem_04_10_22_N-1 downto 0)
				); 
	end component;	
	
	component Shameem_04_10_22_RD is
		 generic (Shameem_04_10_22_N: integer := 32); 
		 port (
				 Shameem_04_10_22_clk, Shameem_04_10_22_wren, Shameem_04_10_22_rden, Shameem_04_10_22_chen: in STD_LOGIC;
				 Shameem_04_10_22_content: in STD_LOGIC_VECTOR(Shameem_04_10_22_N-1 downto 0);
				 Shameem_04_10_22_result: out STD_LOGIC_VECTOR(Shameem_04_10_22_N-1 downto 0)
				); 
	end component;
	
	component Shameem_04_10_22_NBitAddSubFlags is
		 generic (Shameem_04_10_22_X: natural := 16);
		 port (
				 Shameem_04_10_22_a, Shameem_04_10_22_b: in STD_LOGIC_VECTOR(Shameem_04_10_22_X-1 downto 0);
				 Shameem_04_10_22_result: out STD_LOGIC_VECTOR(Shameem_04_10_22_X-1 downto 0);
				 Shameem_04_10_22_operation: in STD_LOGIC;
				 Shameem_04_10_22_o, Shameem_04_10_22_n, Shameem_04_10_22_z: out STD_LOGIC
				);
	end component;

	component Shameem_04_10_22_BitwiseOperations is
		 generic(Shameem_04_10_22_N: integer := 32);
		 port (
				 Shameem_04_10_22_input1, Shameem_04_10_22_input2, Shameem_04_10_22_ext: in STD_LOGIC_VECTOR(Shameem_04_10_22_N-1 downto 0);
				 Shameem_04_10_22_imm: in STD_LOGIC_VECTOR(15 downto 0);
				 Shameem_04_10_22_operation: in STD_LOGIC_VECTOR(3 downto 0); 
				 Shameem_04_10_22_output: out STD_LOGIC_VECTOR(Shameem_04_10_22_N-1 downto 0));
	end component;
	
	component Shameem_04_10_22_IMM16 is
		 generic (Shameem_04_10_22_N: integer := 16);
		 port (
				 Shameem_04_10_22_clock, Shameem_04_10_22_write, Shameem_04_10_22_read, Shameem_04_10_22_enable: in STD_LOGIC;
				 Shameem_04_10_22_input: in STD_LOGIC_vector(Shameem_04_10_22_N-1 downto 0); 
				 Shameem_04_10_22_out: out STD_LOGIC_vector(Shameem_04_10_22_N-1 downto 0)
				); 
	end component;
	
	component Shameem_04_10_22_SignExtender is
		 port (
				 Shameem_04_10_22_input: in STD_LOGIC_VECTOR(15 downto 0); 
				 Shameem_04_10_22_output: out STD_LOGIC_VECTOR(31 downto 0)
				);
	end component;	
	
	component Shameem_04_10_22_MAR is
		 generic (Shameem_04_10_22_N: integer := 32);
		 port (
				 Shameem_04_10_22_clk, Shameem_04_10_22_wren, Shameem_04_10_22_rden, Shameem_04_10_22_chen: in STD_LOGIC;
				 Shameem_04_10_22_content: in STD_LOGIC_VECTOR(Shameem_04_10_22_N-1 downto 0);
				 Shameem_04_10_22_ext: in STD_LOGIC_VECTOR(Shameem_04_10_22_N-1 downto 0);
				 Shameem_04_10_22_result: out STD_LOGIC_VECTOR(Shameem_04_10_22_N-1 downto 0));
	end component;
	
	component Shameem_04_10_22_MDR is
		 generic (Shameem_04_10_22_N: integer := 32); 
		 port (
				 Shameem_04_10_22_clk, Shameem_04_10_22_wren, Shameem_04_10_22_rden, Shameem_04_10_22_chen: in STD_LOGIC;
				 Shameem_04_10_22_content: in STD_LOGIC_VECTOR(Shameem_04_10_22_N-1 downto 0);
				 Shameem_04_10_22_ext: in STD_LOGIC_VECTOR(Shameem_04_10_22_N-1 downto 0);
				 Shameem_04_10_22_result: out STD_LOGIC_VECTOR(Shameem_04_10_22_N-1 downto 0));
	end component;
	
begin
	RD: Shameem_04_10_22_RD generic map (32) port map (Shameem_04_10_22_clk, '1', '1', '1', Shameem_04_10_22_RDin, Shameem_04_10_22_RDinput);
	RS: Shameem_04_10_22_RS generic map (32) port map (Shameem_04_10_22_clk, '1', '1', '1', Shameem_04_10_22_RSinput, Shameem_04_10_22_RSout);		
	IMM: Shameem_04_10_22_IMM16 generic map (16) port map (Shameem_04_10_22_clk, '1', '1', '1', Shameem_04_10_22_imm, imm_o);
	Extension: Shameem_04_10_22_SignExtender port map (Shameem_04_10_22_imm, Shameem_04_10_22_EXTout);
	BitOperation: Shameem_04_10_22_BitwiseOperations generic map (32) port map (Shameem_04_10_22_RSout, Shameem_04_10_22_RTout, Shameem_04_10_22_EXTout, imm_o, Shameem_04_10_22_operation, Shameem_04_10_22_tmp27);
	add: Shameem_04_10_22_NBitAddSubFlags generic map (32) port map (Shameem_04_10_22_RSout, Shameem_04_10_22_RTout, 	Shameem_04_10_22_tmp21, '0', 	Shameem_04_10_22_tmp3, Shameem_04_10_22_tmp1, Shameem_04_10_22_tmp2);
	addi: Shameem_04_10_22_NBitAddSubFlags generic map (32) port map (Shameem_04_10_22_RSout, Shameem_04_10_22_EXTout, Shameem_04_10_22_tmp22, '0', 	Shameem_04_10_22_tmp6, Shameem_04_10_22_tmp4, Shameem_04_10_22_tmp5);
	addiu: Shameem_04_10_22_NBitAddSubFlags generic map (32) port map (Shameem_04_10_22_RSout, Shameem_04_10_22_EXTout, Shameem_04_10_22_tmp23, '0', 	Shameem_04_10_22_tmp9, Shameem_04_10_22_tmp7, Shameem_04_10_22_tmp8);
	addu: Shameem_04_10_22_NBitAddSubFlags generic map (32) port map (Shameem_04_10_22_RSout, Shameem_04_10_22_RTout, 	Shameem_04_10_22_tmp24, '0', 	Shameem_04_10_22_tmp11, z_tmp3, Shameem_04_10_22_tmp10);
	sub: Shameem_04_10_22_NBitAddSubFlags generic map (32) port map (Shameem_04_10_22_RSout, Shameem_04_10_22_RTout, 	Shameem_04_10_22_tmp25, '1', 	Shameem_04_10_22_tmp14, Shameem_04_10_22_tmp12, Shameem_04_10_22_tmp13);
	subu: Shameem_04_10_22_NBitAddSubFlags generic map (32) port map (Shameem_04_10_22_RSout, Shameem_04_10_22_RTout, 	Shameem_04_10_22_tmp26, '1',  	Shameem_04_10_22_tmp17, Shameem_04_10_22_tmp15, Shameem_04_10_22_tmp16);
	MAR: Shameem_04_10_22_MAR generic map (32) port map (Shameem_04_10_22_clk, '1', '1', '1', Shameem_04_10_22_RSout, Shameem_04_10_22_EXTout, Shameem_04_10_22_MARoutput);
	MDR: Shameem_04_10_22_MDR generic map (32) port map (Shameem_04_10_22_clk, '1', '1', '1', Shameem_04_10_22_MDRinput, Shameem_04_10_22_MDRoutput);
	RT: Shameem_04_10_22_RT generic map (32) port map (Shameem_04_10_22_clk, '1', '1', '1', Shameem_04_10_22_RTinput, Shameem_04_10_22_RTout);

	Shameem_04_10_22_P1: process(Shameem_04_10_22_tmp21, Shameem_04_10_22_tmp22, Shameem_04_10_22_tmp23, Shameem_04_10_22_tmp24, Shameem_04_10_22_tmp25, Shameem_04_10_22_tmp26, Shameem_04_10_22_tmp27)
	begin
		case Shameem_04_10_22_operation is
			when "0000"=> 
				Shameem_04_10_22_RDoutput <= Shameem_04_10_22_tmp21; 
				Shameem_04_10_22_O <= Shameem_04_10_22_tmp3; 
				Shameem_04_10_22_N <= Shameem_04_10_22_tmp2; 
				Shameem_04_10_22_Z <= Shameem_04_10_22_tmp1;
			when "0001"=> 
				Shameem_04_10_22_RToutput <= Shameem_04_10_22_tmp22;
				Shameem_04_10_22_O <= Shameem_04_10_22_tmp6; 
				Shameem_04_10_22_N <= Shameem_04_10_22_tmp5; 
				Shameem_04_10_22_Z <= Shameem_04_10_22_tmp4;
			when "0010"=> 
				Shameem_04_10_22_RToutput <= Shameem_04_10_22_tmp23; 
				Shameem_04_10_22_O <= '0'; 
				Shameem_04_10_22_N <= Shameem_04_10_22_tmp8; 
				Shameem_04_10_22_Z <= Shameem_04_10_22_tmp7;
			when "0011"=> 
				Shameem_04_10_22_RDoutput <= Shameem_04_10_22_tmp24; 
				Shameem_04_10_22_O <= '0'; 
				Shameem_04_10_22_N <= Shameem_04_10_22_tmp10; 
				Shameem_04_10_22_Z <= z_tmp3;
			when "0100"=> 
				Shameem_04_10_22_RDoutput <= Shameem_04_10_22_tmp25; 
				Shameem_04_10_22_O <= Shameem_04_10_22_tmp14; 
				Shameem_04_10_22_N <= Shameem_04_10_22_tmp13; 
				Shameem_04_10_22_Z <= Shameem_04_10_22_tmp12;
			when "0101"=> 
				Shameem_04_10_22_RDoutput <= Shameem_04_10_22_tmp26; 
				Shameem_04_10_22_O <= '0'; 
				Shameem_04_10_22_N <= Shameem_04_10_22_tmp16; 
				Shameem_04_10_22_Z <= Shameem_04_10_22_tmp15;
			when "0110" | "1000" | "1001"| "1011" | "1100" | "1101" => 
				Shameem_04_10_22_RDoutput <= Shameem_04_10_22_tmp27; 
				Shameem_04_10_22_O <= Shameem_04_10_22_tmp20; 
				Shameem_04_10_22_N <= Shameem_04_10_22_tmp19; 
				Shameem_04_10_22_Z <= Shameem_04_10_22_tmp18;
			when "0111" | "1010" => 
				Shameem_04_10_22_RToutput <= Shameem_04_10_22_tmp27; 
				Shameem_04_10_22_O <= Shameem_04_10_22_tmp20; 
				Shameem_04_10_22_N <= Shameem_04_10_22_tmp19; 
				Shameem_04_10_22_Z <= Shameem_04_10_22_tmp18;
			when "1110" => 
				Shameem_04_10_22_RToutput <= Shameem_04_10_22_MARoutput; 
			when "1111" => 
				Shameem_04_10_22_RToutput <= Shameem_04_10_22_MDRoutput;
			when others => 
				Shameem_04_10_22_RDoutput <= x"00000000";
		end case;
	end process;
end arch;