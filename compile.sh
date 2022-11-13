rm -rf gdb_baseline.o
rm -rf insert_custom_function_here.o

# -g for debugging
g++ -g -o gdb_baseline.o gdb_baseline.cpp
g++ -g -o insert_custom_function_here.o insert_custom_function_here.cpp


./gdb_baseline.o
./insert_custom_function_here.o
