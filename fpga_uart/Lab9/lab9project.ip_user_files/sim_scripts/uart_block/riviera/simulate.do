transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+uart_block  -L xil_defaultlib -L secureip -O5 xil_defaultlib.uart_block

do {uart_block.udo}

run 1000ns

endsim

quit -force
