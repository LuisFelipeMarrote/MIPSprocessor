LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity ADD2 is
	port (
		O_ADD2_Out: out std_logic_Vector(31 downto 0);
		I_ADD2_A: in std_logic_Vector(31 downto 0);
		I_ADD2_B: in std_logic_Vector(31 downto 0));
end ADD2;

architecture ADD2_arch of ADD2 is
	signal I_ADD2_B_buffer : STD_LOGIC_VECTOR (31 downto 0);
begin
	I_ADD2_B_buffer <= STD_LOGIC_VECTOR(shift_left(unsigned(I_ADD2_B), 2));
	O_ADD2_Out <= STD_LOGIC_VECTOR(unsigned(I_ADD2_A) + unsigned(I_ADD2_B_buffer));
end ADD2_arch;
