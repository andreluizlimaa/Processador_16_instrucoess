onerror {quit -f}
vlib work
vlog -work work Processor_16_Inst.vo
vlog -work work Processor_16_Inst.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Reg_File_vlg_vec_tst
vcd file -direction Processor_16_Inst.msim.vcd
vcd add -internal Reg_File_vlg_vec_tst/*
vcd add -internal Reg_File_vlg_vec_tst/i1/*
add wave /*
run -all
