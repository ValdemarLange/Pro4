onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc"  -L xil_defaultlib -L xlconstant_v1_1_8 -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.test xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {test.udo}

run 1000ns

quit -force
