vlib work
vlog *.sv  +cover -covercells
vsim -voptargs=+acc work.testbench_top -cover
add wave *

coverage save FFT.ucdb -onexit
run -all

#quit -sim
vcover report FFT.ucdb -details -annotate -all -output report.txt