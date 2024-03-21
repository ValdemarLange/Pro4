transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+test  -L xil_defaultlib -L xlconstant_v1_1_8 -L unisims_ver -L unimacro_ver -L secureip -O2 xil_defaultlib.test xil_defaultlib.glbl

do {test.udo}

run

endsim

quit -force
