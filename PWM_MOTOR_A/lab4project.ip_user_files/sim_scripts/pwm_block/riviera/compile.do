transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xil_defaultlib
vlib riviera/xlconstant_v1_1_8

vmap xil_defaultlib riviera/xil_defaultlib
vmap xlconstant_v1_1_8 riviera/xlconstant_v1_1_8

vcom -work xil_defaultlib -93  -incr \
"../../../bd/pwm_block/ip/pwm_block_counter_0_0/sim/pwm_block_counter_0_0.vhd" \
"../../../bd/pwm_block/ip/pwm_block_comparator_0_0/sim/pwm_block_comparator_0_0.vhd" \

vlog -work xlconstant_v1_1_8  -incr -v2k5 -l xil_defaultlib -l xlconstant_v1_1_8 \
"../../../../lab4project.gen/sources_1/bd/pwm_block/ipshared/d390/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -v2k5 -l xil_defaultlib -l xlconstant_v1_1_8 \
"../../../bd/pwm_block/ip/pwm_block_xlconstant_0_0/sim/pwm_block_xlconstant_0_0.v" \
"../../../bd/pwm_block/ip/pwm_block_xlconstant_1_0/sim/pwm_block_xlconstant_1_0.v" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/pwm_block/ip/pwm_block_clk_divider_0_0/sim/pwm_block_clk_divider_0_0.vhd" \
"../../../bd/pwm_block/ip/pwm_block_demultiplexer_1x2_0_2/sim/pwm_block_demultiplexer_1x2_0_2.vhd" \

vlog -work xil_defaultlib  -incr -v2k5 -l xil_defaultlib -l xlconstant_v1_1_8 \
"../../../bd/pwm_block/ip/pwm_block_xlconstant_2_0/sim/pwm_block_xlconstant_2_0.v" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/pwm_block/ip/pwm_block_d_latch_0_0/sim/pwm_block_d_latch_0_0.vhd" \
"../../../bd/pwm_block/sim/pwm_block.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

