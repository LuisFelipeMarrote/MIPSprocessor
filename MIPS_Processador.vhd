LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity MIPS_Processador is
	port (
		clk : in std_logic;
		I_EN : in std_logic
	);
end MIPS_Processador;

architecture MIPS_Processador_arch of MIPS_Processador is
---------Control----------------------
signal Jump, Reg_dst, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite : STD_LOGIC;
signal ALUOp : STD_LOGIC_VECTOR(1 DOWNTO 0);        
---------Reg-------------------------- 
signal Data_1, Data_2 : STD_LOGIC_VECTOR(31 DOWNTO 0);
---------Ext--------------------------
signal Ext_32: STD_LOGIC_VECTOR(31 DOWNTO 0);
---------Alu_Control------------------
signal Funct : STD_LOGIC_VECTOR(5 DOWNTO 0);
signal ALU_Cntrl: STD_LOGIC_VECTOR(3 DOWNTO 0);
---------ADD1-------------------------
signal O_ADD1_Out: std_logic_Vector(31 downto 0);
---------ADD2-------------------------
signal O_ADD2_Out: std_logic_Vector(31 downto 0);
---------ALU--------------------------      
signal O_ALU_Zero: std_logic;           
signal O_ALU_Out: std_logic_Vector(31 downto 0);
---------MUX32------------------------
signal O_MUX_1: std_logic_Vector(31 downto 0);
signal O_MUX_2: std_logic_Vector(31 downto 0);
signal O_MUX_3: std_logic_Vector(31 downto 0);
signal O_MUX_4: std_logic_Vector(31 downto 0);                       
---------MUX5-------------------------
signal O_MUX_5: std_logic_Vector(4 downto 0);           
---------RAM--------------------------                           
signal O_RAM_DATA: std_logic_Vector(31 downto 0);
---------memory_instruc---------------
signal O_ROM_DATA : std_logic_vector(31 downto 0);
---------pc--------------------------- 
signal adr_new : Std_logic_vector(31 downto 0);
signal adr_cury: std_logic_vector(31 downto 0):=x"00000000"; 
---------Maq_state--------------------
signal I_FSM_INST : std_logic_vector(31 downto 0):=x"00000001";  
signal O_FSM_IF : std_logic;
signal O_FSM_ID : std_logic;
signal O_FSM_EX : std_logic;
signal O_FSM_ME : std_logic;
signal O_FSM_WB : std_logic;
signal entrada : std_logic;
---------Jump_Address-----------------
signal Jump_Address : std_logic_vector(31 downto 0);
--------------------------------------
begin

	Maq_state_instance : entity work.Maq_state
		port map(
			I_FSM_CLK => clk,
			I_FSM_EN  => I_EN,
			I_FSM_INST => O_ROM_DATA,
			O_FSM_IF  => O_FSM_IF,
			O_FSM_ID => O_FSM_ID,
			O_FSM_EX => O_FSM_EX,
			O_FSM_ME  => O_FSM_ME,
			O_FSM_WB => O_FSM_WB
		);	

	pc_instance : entity work.pc
		port map(
			I_PC_UPDATE  => O_FSM_WB,
			adr_new => O_MUX_4,
			adr_cury => adr_cury
		);	
		
	memory_instruc_instance : entity work.memory_instruc
		port map(
			I_ROM_EN  => O_FSM_IF,
			I_ROM_ADDR => adr_cury,
			O_ROM_DATA => O_ROM_DATA
		);	
		
	Control_instance : entity work.Control
		port map(
			Reg_dst => Reg_dst,
			Branch => Branch,
			MemRead => MemRead,
			MemtoReg => MemtoReg,
			MemWrite => MemWrite,
			ALUSrc => ALUSrc,
			RegWrite => RegWrite,
			ALUOp => ALUOp,
			Jump => Jump,
			Control_En => O_FSM_ID,
			Instr => O_ROM_DATA(31 downto 26)
		);
		
	MUX5_instance : entity work.MUX5
		port map(
			O_MUX  => O_MUX_5,
			I_MUX_0 => O_ROM_DATA(20 downto 16),
			I_MUX_1 => O_ROM_DATA(15 downto 11),
			I_MUX_Sel => Reg_dst
		);	
		
	Reg_instance : entity work.Reg
		port map(
			Reg_En  => O_FSM_WB,
			Reg_Write => RegWrite,
			Data_1 => Data_1,
			Data_2 => Data_2,
			Write_Data => O_MUX_3,
			Read_Reg_1 => O_ROM_DATA(25 downto 21),
			Read_Reg_2 => O_ROM_DATA(20 downto 16),
			Write_Reg_Dst => O_MUX_5
		);
		
	Ext_instance : entity work.Ext
		port map(
			Ext_16  => O_ROM_DATA(15 downto 0),
			Ext_32 => Ext_32
		);
		

		
	Alu_Control_instance : entity work.Alu_Control
		port map(
			ALUOp  => ALUOp,
			Funct => O_ROM_DATA(5 downto 0),
			ALU_Cntrl => ALU_Cntrl
		);

	ADD1_instance : entity work.ADD1
		port map(
			O_ADD1_Out  => O_ADD1_Out,
			I_ADD1_A => adr_cury
		);
				
	Jump_Address_instance : entity work.Jump_Address
		port map(
			Instruc => O_ROM_DATA(25 DOWNTO 0),
			PC => O_ADD1_Out(31 DOWNTO 0),
			Jump_Address => Jump_Address
		);
		
	MUX32_instance_1 : entity work.MUX32
		port map(
			O_MUX => O_MUX_1,
			I_MUX_0 => Data_2,
			I_MUX_1 => Ext_32,
			I_MUX_Sel => ALUSrc
 		);

	ADD2_instance : entity work.ADD2
		port map(
			O_ADD2_Out => O_ADD2_Out,
			I_ADD2_A => O_ADD1_Out,
			I_ADD2_B => Ext_32
		);	
	
	ALU_instance : entity work.ALU
		port map(
			I_ALU_EN => O_FSM_EX,
			I_ALU_CTL => ALU_Cntrl,
			O_ALU_Zero => O_ALU_Zero,
			O_ALU_Out => O_ALU_Out,
			I_ALU_A => Data_1,
			I_ALU_B => O_MUX_1
		);
		
	entrada <= Branch and O_ALU_Zero;
		
	MUX32_instance_2 : entity work.MUX32
		port map(
			O_MUX => O_MUX_2,
			I_MUX_0 => O_ADD1_Out,
			I_MUX_1 => O_ADD2_Out,
			I_MUX_Sel => entrada
 		);

	MUX32_instance_4 : entity work.MUX32
		port map(
			O_MUX => O_MUX_4,
			I_MUX_0 => O_MUX_2,
			I_MUX_1 => Jump_Address,
			I_MUX_Sel => Jump
 		);
	
	RAM_instance : entity work.RAM
		port map(
			I_RAM_EN => O_FSM_ME,         
			I_RAM_RE => MemRead,       
			I_RAM_WE => MemWrite,            
			I_RAM_DATA => Data_2,
			I_RAM_ADDR => O_ALU_Out,
			O_RAM_DATA => O_RAM_DATA
		);	
		
	MUX32_instance_3 : entity work.MUX32
		port map(
			O_MUX => O_MUX_3,
			I_MUX_0 => O_ALU_Out,
			I_MUX_1 => O_RAM_DATA,
			I_MUX_Sel => MemtoReg
 		);
		
	
end MIPS_Processador_arch;