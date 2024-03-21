onbreak {quit -f}
onerror {quit -f}

vsim  -lib xil_defaultlib test_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {test.udo}

run 1000ns

quit -force
