library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity memory_instruc is
    port (
        I_ROM_EN    : in  std_logic;
        I_ROM_ADDR  : in  std_logic_vector(31 downto 0);
        O_ROM_DATA  : out std_logic_vector(31 downto 0));
end entity memory_instruc;

architecture Behavioral of memory_instruc is
   
    type rom_type is array (0 to 51) of std_logic_vector(7 downto 0);
    
    signal rom : rom_type := (
        x"01", x"00", x"4a", x"21", 
        x"08", x"00", x"8c", x"21", 
        x"00", x"00", x"69", x"ad", 
        x"04", x"00", x"6b", x"21",
        x"00", x"00", x"6a", x"ad", 
        x"04", x"00", x"6b", x"21",
        x"20", x"70", x"2a", x"01",
        x"20", x"48", x"c0", x"01",
        x"20", x"50", x"ca", x"01",
        x"01", x"00", x"ad", x"21",
        x"01", x"00", x"ac", x"11", 
        x"02", x"00", x"00", x"08",  
        x"00", x"00", x"00", x"00"
    );
	 
begin
    process(I_ROM_EN)
        variable index : integer;
    begin
        if I_ROM_EN = '1' then
            index := to_integer(unsigned(I_ROM_ADDR));
            O_ROM_DATA <= rom(index+3) & rom(index+2) & rom(index+1) & rom(index);
        end if;
    end process;
end Behavioral;

