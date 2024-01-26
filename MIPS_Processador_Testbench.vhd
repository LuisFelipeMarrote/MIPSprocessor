LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY MIPS_Processador_Testbench IS
END MIPS_Processador_Testbench;

ARCHITECTURE behavior OF MIPS_Processador_Testbench IS
    -- Componentes do Testbench
    COMPONENT MIPS_Processador
        PORT(
            clk : IN STD_LOGIC;
            I_EN : IN STD_LOGIC
        );
    END COMPONENT;

    -- Sinais de clock e controle
    SIGNAL clk : STD_LOGIC := '0';
    SIGNAL I_EN : STD_LOGIC := '1';

BEGIN
    -- Instanciação do MIPS_Processador
    uut: MIPS_Processador PORT MAP(
        clk => clk,
        I_EN => I_EN
    );

    -- Processo de clock para simulação
    CLK_PROCESS: PROCESS
    BEGIN
        WHILE TRUE LOOP
            clk <= '0';
            WAIT FOR 5 ns;
            clk <= '1';
            WAIT FOR 5 ns;
        END LOOP;
    END PROCESS CLK_PROCESS;


END behavior;