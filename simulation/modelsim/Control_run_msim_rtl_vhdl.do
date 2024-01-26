transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {E:/DEMONIO_CAPETA/daibo/Control.vhd}
vcom -93 -work work {E:/DEMONIO_CAPETA/daibo/Reg.vhd}
vcom -93 -work work {E:/DEMONIO_CAPETA/daibo/Ext.vhd}
vcom -93 -work work {E:/DEMONIO_CAPETA/daibo/Alu_Control.vhd}
vcom -93 -work work {E:/DEMONIO_CAPETA/daibo/ADD1.vhd}
vcom -93 -work work {E:/DEMONIO_CAPETA/daibo/ADD2.vhd}
vcom -93 -work work {E:/DEMONIO_CAPETA/daibo/ALU.vhd}
vcom -93 -work work {E:/DEMONIO_CAPETA/daibo/MUX32.vhd}
vcom -93 -work work {E:/DEMONIO_CAPETA/daibo/RAM.vhd}
vcom -93 -work work {E:/DEMONIO_CAPETA/daibo/MUX5.vhd}
vcom -93 -work work {E:/DEMONIO_CAPETA/daibo/memory_instruc.vhd}
vcom -93 -work work {E:/DEMONIO_CAPETA/daibo/pc.vhd}
vcom -93 -work work {E:/DEMONIO_CAPETA/daibo/Maq_state.vhd}
vcom -93 -work work {E:/DEMONIO_CAPETA/daibo/Jump_Address.vhd}
vcom -93 -work work {E:/DEMONIO_CAPETA/daibo/MIPS_Processador.vhd}

vcom -93 -work work {E:/DEMONIO_CAPETA/daibo/MIPS_Processador_Testbench.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneive -L rtl_work -L work -voptargs="+acc"  MIPS_Processador_Testbench

add wave *
view structure
view signals
run -all
