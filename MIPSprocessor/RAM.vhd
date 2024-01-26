library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; -- Use only this library for 'unsigned'
entity RAM is
    port (
        I_RAM_EN: in std_logic;
        I_RAM_RE: in std_logic;
        I_RAM_WE: in std_logic;
        I_RAM_DATA: in std_logic_Vector(31 downto 0);
        I_RAM_ADDR: in std_logic_Vector(31 downto 0);
        O_RAM_DATA: out std_logic_Vector(31 downto 0));
end RAM;

architecture RAM_arch of RAM is
    type ram_type is array (0 to 127) of STD_LOGIC_VECTOR (7 downto 0);
    signal ram : ram_type := (others => (others => '0'));
begin
    process(I_RAM_EN)
        variable index : integer;
    begin
        if I_RAM_EN = '1' then
            index := to_integer(unsigned(I_RAM_ADDR(31 downto 0)));
            if I_RAM_RE = '1' then
                O_RAM_DATA <= ram(index+3) & ram(index+2) & ram(index+1) & ram(index);
            elsif I_RAM_WE = '1' then
                ram(index) <= I_RAM_DATA(7 downto 0);
                ram(index+1) <= I_RAM_DATA(15 downto 8);
                ram(index+2) <= I_RAM_DATA(23 downto 16);
                ram(index+3) <= I_RAM_DATA(31 downto 24);
            end if;
        end if;
    end process;
end RAM_arch;