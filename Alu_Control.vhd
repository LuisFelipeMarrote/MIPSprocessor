LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
entity Alu_Control is
	Port( 
			ALUOp : in STD_LOGIC_VECTOR(1 DOWNTO 0);
			Funct : in STD_LOGIC_VECTOR(5 DOWNTO 0);
			ALU_Cntrl: out STD_LOGIC_VECTOR(3 DOWNTO 0));
end Alu_Control;

architecture Alu_Control_arc of Alu_Control is
begin 
	process(ALUOp, Funct)
	begin
		if ALUOp = "00" then
			ALU_Cntrl <= "0010";
		elsif ALUOp = "01" then
			ALU_Cntrl <= "0110";
		elsif ALUOp = "10" then
			if Funct = "100000" then --addu
				ALU_Cntrl <= "0010";		
			else 
				ALU_Cntrl <= "0000";				
			end if;
		else
			ALU_Cntrl <= "0000";
		end if;
	end process;
end Alu_Control_arc;