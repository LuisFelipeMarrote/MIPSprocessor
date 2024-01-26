LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity MUX5 is
	port (
		O_MUX: out std_logic_Vector(4 downto 0);
		I_MUX_0: in std_logic_Vector(4 downto 0);
		I_MUX_1: in std_logic_Vector(4 downto 0);
		I_MUX_Sel: in std_logic);
end MUX5;

architecture MUX5_arch of MUX5 is
begin
	O_MUX <= I_MUX_0 when I_MUX_Sel = '0' else I_MUX_1;
end MUX5_arch;