#include <stdio.h>
#include <iostream>

using namespace std;

// Insert custom code here
void log() {
}


int main(int argc, char** argv) {
	__asm volatile("# LLVM-MCA-BEGIN log":::"memory");
	log();
	__asm volatile("# LLVM-MCA-END":::"memory");
}