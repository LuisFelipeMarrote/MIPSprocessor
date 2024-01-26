LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
entity EXT is
	Port( 
			Ext_16 : in STD_LOGIC_VECTOR(15 DOWNTO 0);
			Ext_32: out STD_LOGIC_VECTOR(31 DOWNTO 0));
end EXT;

architecture EXT_arc of EXT is
begin 
	Ext_32(31 downto 16) <= (others => Ext_16(15));
	Ext_32(15 downto 0) <= Ext_16(15 downto 0);
end EXT_arc;