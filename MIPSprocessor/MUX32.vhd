LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;  
entity MUX32 is
	port (
		O_MUX: out std_logic_Vector(31 downto 0);
		I_MUX_0: in std_logic_Vector(31 downto 0);
		I_MUX_1: in std_logic_Vector(31 downto 0);
		I_MUX_Sel: in std_logic);
end MUX32;

architecture MUX32_arch of MUX32 is
begin
	O_MUX <= I_MUX_0 when I_MUX_Sel = '0' else I_MUX_1;
end MUX32_arch;