transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib activehdl/xil_defaultlib
vlib activehdl/xlconstant_v1_1_8

vmap xil_defaultlib activehdl/xil_defaultlib
vmap xlconstant_v1_1_8 activehdl/xlconstant_v1_1_8

vlog -work xil_defaultlib  -v2k5 -l xil_defaultlib -l xlconstant_v1_1_8 \
"../../../bd/test/ip/test_comparator_0_0/sim/test_comparator_0_0.v" \
"../../../bd/test/ip/test_spi_slave_0_0/sim/test_spi_slave_0_0.v" \

vlog -work xlconstant_v1_1_8  -v2k5 -l xil_defaultlib -l xlconstant_v1_1_8 \
"../../../../PRO4.gen/sources_1/bd/test/ipshared/d390/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 -l xil_defaultlib -l xlconstant_v1_1_8 \
"../../../bd/test/ip/test_xlconstant_0_0/sim/test_xlconstant_0_0.v" \
"../../../bd/test/sim/test.v" \

vlog -work xil_defaultlib \
"glbl.v"

