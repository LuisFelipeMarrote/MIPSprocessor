LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
entity Jump_Address is
	Port( 
			Instruc : in STD_LOGIC_VECTOR(25 DOWNTO 0);
			PC : in STD_LOGIC_VECTOR(31 DOWNTO 0);
			Jump_Address: out STD_LOGIC_VECTOR(31 DOWNTO 0));
end Jump_Address;

architecture Jump_Address_arc of Jump_Address is
signal Instruc_Shl : STD_LOGIC_VECTOR(27 DOWNTO 0);
begin 
	Instruc_Shl <= Instruc(25 DOWNTO 0) & "00";
	Jump_Address <= PC(31 downto 28) & Instruc_Shl(27 downto 0);
end Jump_Address_arc;