#!/usr/bin/python3
import os
import sys
import time

print(sys.argv)
inputFile = ''
if len(sys.argv) > 1:
	inputFile = sys.argv[1]
else:
	inputFile = 'insert_custom_function_here.cpp'
print('File to analyze:', inputFile)

def terminal(cmd):
	os.system(cmd)

file = open('experiment_output.csv', 'w')
header = 'Application,'
header += 'Line Start,'
header += 'Line End,'
header += 'Address Start,'
header += 'Address End,'
header += 'Opcode Histogram,'
file.write(header + '\n')
file.close()

numSamples = 10

print('Running baseline measurement...')
cmd = 'gdb -nx'
#cmd += ' -batch'
cmd += ' -batch-silent'
cmd += ' -ex "py fileName=\'gdb_baseline.cpp\'"'
cmd += ' -ex "set breakpoint pending on"'
cmd += ' -ex "source python_gdb_trace.py"'
cmd += ' -ex "break log"'
cmd += ' -ex "run"'
cmd += ' -ex "break-return"'
cmd += ' -ex "run"' # Resets pc, since we called "up" in break-return
cmd += ' -ex "trace-asm"'
cmd += ' --args gdb_baseline.o'
time_start = time.time()
terminal(cmd)
time_end = time.time()
print(f'    Success! That took {time_end - time_start} seconds.')

for i in range(numSamples):
	binaryFile = inputFile[:-4] + '.o'
	print(f'Analyzing {binaryFile} (sample={i + 1})...')
	
	cmd = 'gdb -nx'
	# cmd += ' -batch'		# Printing enabled
	cmd += ' -batch-silent'	# Printing disabled
	cmd += f' -ex "py fileName=\'{inputFile}\'"'
	cmd += ' -ex "set breakpoint pending on"'
	cmd += ' -ex "source python_gdb_trace.py"'
	cmd += ' -ex "break log"'
	cmd += ' -ex "run"'
	cmd += ' -ex "break-return"'
	cmd += ' -ex "run"' # Resets pc, since we called "up" in break-return
	cmd += ' -ex "trace-asm"'
	cmd += f' --args {binaryFile}' # Add any other arguments here

	time_start = time.time()
	terminal(cmd)
	time_end = time.time()
	print(f'    Success! That took {time_end - time_start} seconds.')

print('Saved to experiment_output.csv')