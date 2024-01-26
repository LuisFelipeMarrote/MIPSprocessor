LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity ALU is
	port (
		I_ALU_EN: in std_logic;
		I_ALU_CTL: in std_logic_Vector(3 downto 0);
		O_ALU_Zero: out std_logic;
		O_ALU_Out: out std_logic_Vector(31 downto 0);
		I_ALU_A: in std_logic_Vector(31 downto 0);
		I_ALU_B: in std_logic_Vector(31 downto 0));
end ALU;

architecture ALU_arch of ALU is
	signal ALU_OUTPUT : STD_LOGIC_VECTOR (31 downto 0);
begin
	process (I_ALU_EN)
	begin
		if I_ALU_EN = '1' then
			if I_ALU_CTL = "0010" then
				ALU_OUTPUT <= STD_LOGIC_VECTOR(unsigned(I_ALU_A) + unsigned(I_ALU_B));
			elsif I_ALU_CTL = "0110" then
				ALU_OUTPUT <= STD_LOGIC_VECTOR(unsigned(I_ALU_A) - unsigned(I_ALU_B));
			end if;
		end if;
	end process;
	O_ALU_Zero <= '1' when ALU_OUTPUT = (ALU_OUTPUT'range => '0') else '0';
	O_ALU_Out <= ALU_OUTPUT;
end ALU_arch;