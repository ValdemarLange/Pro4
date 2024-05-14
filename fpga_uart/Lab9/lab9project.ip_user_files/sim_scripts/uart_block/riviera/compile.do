transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xil_defaultlib

vmap xil_defaultlib riviera/xil_defaultlib

vcom -work xil_defaultlib -93  -incr \
"../../../bd/uart_block/ip/uart_block_rx_mod_0_0/sim/uart_block_rx_mod_0_0.vhd" \
"../../../bd/uart_block/ip/uart_block_clk_divider_emad_0_0/sim/uart_block_clk_divider_emad_0_0.vhd" \
"../../../bd/uart_block/ip/uart_block_d_latch_0_0/sim/uart_block_d_latch_0_0.vhd" \
"../../../bd/uart_block/sim/uart_block.vhd" \


