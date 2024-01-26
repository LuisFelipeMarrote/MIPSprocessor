onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mips_processador_testbench/clk
add wave -noupdate /mips_processador_testbench/I_EN
add wave -noupdate /mips_processador_testbench/uut/RAM_instance/I_RAM_RE
add wave -noupdate /mips_processador_testbench/uut/RAM_instance/I_RAM_RE
add wave -noupdate /mips_processador_testbench/uut/RAM_instance/I_RAM_WE
add wave -noupdate /mips_processador_testbench/uut/RAM_instance/I_RAM_DATA
add wave -noupdate /mips_processador_testbench/uut/RAM_instance/I_RAM_ADDR
add wave -noupdate /mips_processador_testbench/uut/RAM_instance/O_RAM_DATA
add wave -noupdate -color {Medium Spring Green} /mips_processador_testbench/uut/RAM_instance/ram
add wave -noupdate /mips_processador_testbench/uut/Control_instance/Reg_dst
add wave -noupdate /mips_processador_testbench/uut/Control_instance/Branch
add wave -noupdate /mips_processador_testbench/uut/Control_instance/Jump
add wave -noupdate /mips_processador_testbench/uut/Control_instance/MemRead
add wave -noupdate /mips_processador_testbench/uut/Control_instance/MemtoReg
add wave -noupdate /mips_processador_testbench/uut/Control_instance/MemWrite
add wave -noupdate /mips_processador_testbench/uut/Control_instance/ALUSrc
add wave -noupdate /mips_processador_testbench/uut/Control_instance/RegWrite
add wave -noupdate /mips_processador_testbench/uut/Control_instance/ALUOp
add wave -noupdate -color Magenta /mips_processador_testbench/uut/Control_instance/Instr
add wave -noupdate /mips_processador_testbench/uut/Maq_state_instance/O_FSM_IF
add wave -noupdate /mips_processador_testbench/uut/Maq_state_instance/O_FSM_ID
add wave -noupdate /mips_processador_testbench/uut/Maq_state_instance/O_FSM_EX
add wave -noupdate /mips_processador_testbench/uut/Maq_state_instance/O_FSM_ME
add wave -noupdate /mips_processador_testbench/uut/Maq_state_instance/O_FSM_WB
add wave -noupdate /mips_processador_testbench/uut/Reg_instance/Reg_Write
add wave -noupdate /mips_processador_testbench/uut/Reg_instance/Data_1
add wave -noupdate /mips_processador_testbench/uut/Reg_instance/Data_2
add wave -noupdate /mips_processador_testbench/uut/Reg_instance/Write_Data
add wave -noupdate /mips_processador_testbench/uut/Reg_instance/Read_Reg_1
add wave -noupdate /mips_processador_testbench/uut/Reg_instance/Read_Reg_2
add wave -noupdate /mips_processador_testbench/uut/Reg_instance/Write_Reg_Dst
add wave -noupdate -color Gold /mips_processador_testbench/uut/Reg_instance/reg
add wave -noupdate /mips_processador_testbench/uut/MUX32_instance_2/O_MUX
add wave -noupdate /mips_processador_testbench/uut/MUX32_instance_2/I_MUX_0
add wave -noupdate /mips_processador_testbench/uut/MUX32_instance_2/I_MUX_1
add wave -noupdate /mips_processador_testbench/uut/MUX32_instance_2/I_MUX_Sel
add wave -noupdate /mips_processador_testbench/uut/ALU_instance/I_ALU_CTL
add wave -noupdate /mips_processador_testbench/uut/ALU_instance/O_ALU_Zero
add wave -noupdate /mips_processador_testbench/uut/ALU_instance/O_ALU_Out
add wave -noupdate /mips_processador_testbench/uut/ALU_instance/I_ALU_A
add wave -noupdate /mips_processador_testbench/uut/ALU_instance/I_ALU_B
add wave -noupdate /mips_processador_testbench/uut/Ext_instance/Ext_32
add wave -noupdate /mips_processador_testbench/uut/Ext_instance/Ext_16
add wave -noupdate /mips_processador_testbench/uut/Alu_Control_instance/ALU_Cntrl
add wave -noupdate /mips_processador_testbench/uut/Alu_Control_instance/Funct
add wave -noupdate /mips_processador_testbench/uut/Alu_Control_instance/ALU_Cntrl
add wave -noupdate /mips_processador_testbench/uut/Alu_Control_instance/ALUOp
add wave -noupdate /mips_processador_testbench/uut/MUX32_instance_4/O_MUX
add wave -noupdate /mips_processador_testbench/uut/MUX32_instance_4/I_MUX_0
add wave -noupdate /mips_processador_testbench/uut/MUX32_instance_4/I_MUX_1
add wave -noupdate /mips_processador_testbench/uut/MUX32_instance_4/I_MUX_Sel
add wave -noupdate /mips_processador_testbench/uut/ADD2_instance/O_ADD2_Out
add wave -noupdate /mips_processador_testbench/uut/ADD2_instance/I_ADD2_A
add wave -noupdate /mips_processador_testbench/uut/ADD2_instance/I_ADD2_B
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {615393 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 377
configure wave -valuecolwidth 212
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {273430 ps} {675083 ps}
