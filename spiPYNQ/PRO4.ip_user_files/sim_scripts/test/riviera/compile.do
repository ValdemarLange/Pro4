transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xil_defaultlib
vlib riviera/xlconstant_v1_1_8

vmap xil_defaultlib riviera/xil_defaultlib
vmap xlconstant_v1_1_8 riviera/xlconstant_v1_1_8

vlog -work xil_defaultlib  -incr -v2k5 -l xil_defaultlib -l xlconstant_v1_1_8 \
"../../../bd/test/ip/test_comparator_0_0/sim/test_comparator_0_0.v" \
"../../../bd/test/ip/test_spi_slave_0_0/sim/test_spi_slave_0_0.v" \

vlog -work xlconstant_v1_1_8  -incr -v2k5 -l xil_defaultlib -l xlconstant_v1_1_8 \
"../../../../PRO4.gen/sources_1/bd/test/ipshared/d390/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -v2k5 -l xil_defaultlib -l xlconstant_v1_1_8 \
"../../../bd/test/ip/test_xlconstant_0_0/sim/test_xlconstant_0_0.v" \
"../../../bd/test/sim/test.v" \

vlog -work xil_defaultlib \
"glbl.v"

