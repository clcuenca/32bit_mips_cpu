onerror {exit -code 1}
vlib work
vlog -work work mips_32.vo
vlog -work work mips_32_verification_waveform.vwf.vt
vsim -novopt -c -t 1ps -L cycloneiv_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.mips_32_vlg_vec_tst -voptargs="+acc"
vcd file -direction mips_32.msim.vcd
vcd add -internal mips_32_vlg_vec_tst/*
vcd add -internal mips_32_vlg_vec_tst/i1/*
run -all
quit -f
