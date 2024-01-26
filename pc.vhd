LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
entity pc is 
	port (  
		I_PC_UPDATE : in std_logic; 
		adr_new : in Std_logic_vector(31 downto 0);
		adr_cury: out std_logic_vector(31 downto 0):=x"00000000"); 
end pc;
 
architecture pc_arch of pc is 
begin 
	process (I_PC_UPDATE)
	begin
		if I_PC_UPDATE = '1' then
			adr_cury <= adr_new;
		end if;
	end process;
end pc_arch;
			