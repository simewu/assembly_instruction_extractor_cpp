sudo apt install -y llvm clang

rm -rf gdb_baseline.asm
rm -rf insert_custom_function_here.asm

rm -rf static_analysis
mkdir static_analysis
cd static_analysis

clang++ -Wall -std=c++11 -S -mllvm --x86-asm-syntax=intel ../gdb_baseline.cpp -o gdb_baseline.asm
clang++ -Wall -std=c++11 -S -mllvm --x86-asm-syntax=intel ../insert_custom_function_here.cpp -o insert_custom_function_here.asm
#clang++ -Wall -std=c++11 -S -mllvm --x86-asm-syntax=intel -Wl,loqs -Wa,"SPHINCS+ SHA256-128s-robust" ../gdb_keygen.cpp -o gdb_keygen.asm

# Or all in one command
#clang++ -Wall -std=c++11 -S -mllvm --x86-asm-syntax=intel FILE_NAME.cpp -o - | llvm-mca -json -o output.json

llvm-mca -json -o gdb_baseline.json gdb_baseline.asm
llvm-mca -json -o insert_custom_function_here.json insert_custom_function_here.asm
#llvm-mca -json -o gdb_keygen.json gdb_keygen.asm

echo ""
echo "Done! Wrote the JSON files to \"static_analysis\""