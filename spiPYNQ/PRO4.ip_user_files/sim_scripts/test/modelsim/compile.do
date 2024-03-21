vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/xlconstant_v1_1_8

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap xlconstant_v1_1_8 modelsim_lib/msim/xlconstant_v1_1_8

vlog -work xil_defaultlib -64 -incr -mfcu  \
"../../../bd/test/ip/test_comparator_0_0/sim/test_comparator_0_0.v" \
"../../../bd/test/ip/test_spi_slave_0_0/sim/test_spi_slave_0_0.v" \

vlog -work xlconstant_v1_1_8 -64 -incr -mfcu  \
"../../../../PRO4.gen/sources_1/bd/test/ipshared/d390/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr -mfcu  \
"../../../bd/test/ip/test_xlconstant_0_0/sim/test_xlconstant_0_0.v" \
"../../../bd/test/sim/test.v" \

vlog -work xil_defaultlib \
"glbl.v"

