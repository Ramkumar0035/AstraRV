#--------------------------------------------------
# AstraRV ModelSim Script
#--------------------------------------------------

vlib work

vlog rtl/core/*.sv

vlog tb/core/*.sv

vsim work.astrarv_single_cycle_cpu_tb

do wave.do

run -all