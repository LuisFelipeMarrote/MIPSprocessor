LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity ADD1 is
	port (
		O_ADD1_Out: out std_logic_Vector(31 downto 0);
		I_ADD1_A: in std_logic_Vector(31 downto 0));
end ADD1;

architecture ADD1_arch of ADD1 is
begin
	O_ADD1_Out <= STD_LOGIC_VECTOR(unsigned(I_ADD1_A) + 4);
end ADD1_arch;
