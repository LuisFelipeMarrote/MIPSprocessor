LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
entity Control is
	Port( 
			Jump, Reg_dst, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite : out STD_LOGIC;
			ALUOp : out STD_LOGIC_VECTOR(1 DOWNTO 0);
			Control_En : in STD_LOGIC;
			Instr : in STD_LOGIC_VECTOR(5 DOWNTO 0));
end Control;

architecture Control_arc of Control is
begin 
	process (Control_En) 
	begin 
		if Control_En = '1' then 
			case Instr is
				when "000000" => --Tipo R
					Reg_dst <= '1';
					Branch <= '0';					
					Jump <= '0';
					MemRead <= '0';
					MemtoReg <= '0'; 				
					ALUOp <= "10";
					MemWrite <= '0';
					ALUSrc <= '0';
					RegWrite <= '1';
				when "000010" => --Jump
					Reg_dst <= '0';
					Branch <= '0';					
					Jump <= '1';
					MemRead <= '0';
					MemtoReg <= '0'; 				
					ALUOp <= "00";
					MemWrite <= '0';
					ALUSrc <= '0';
					RegWrite <= '0';
				when "001000" => -- addi ou addiu
					Reg_dst <= '0';
					Branch <= '0';					
					Jump <= '0';
					MemRead <= '0';
					MemtoReg <= '0';				
					ALUOp <= "00";
					MemWrite <= '0';
					ALUSrc <= '1';
					RegWrite <= '1';

				when "000100" => -- beq
					Reg_dst <= '0';
					Branch <= '1';
					MemRead <= '0';
					MemtoReg <= '0';				
					ALUOp <= "01";
					MemWrite <= '0';
					ALUSrc <= '0';
					RegWrite <= '0';	
					Jump <= '0';
				when "101011" => -- sw
					Reg_dst <= '0';
					Branch <= '0';
					MemRead <= '0';
					MemtoReg <= '0';				
					ALUOp <= "00";
					MemWrite <= '1';
					ALUSrc <= '1';
					RegWrite <= '0';
					Jump <= '0';
				when others =>
					Reg_dst <= '1';
					Branch <= '1';
					MemRead <= '1';
					MemtoReg <= '1';				
					ALUOp <= "00";
					MemWrite <= '1';
					ALUSrc <= '1';
					RegWrite <= '1';
					Jump <= '1';
			end case;
		end if;
	end process;
end Control_arc;