#include <stdio.h>
#include <iostream>

using namespace std;

// Insert custom code here
void log() {
	__asm volatile("# LLVM-MCA-BEGIN log":::"memory");
	return;
	__asm volatile("# LLVM-MCA-END":::"memory");
}


int main(int argc, char** argv) {
	log();
}