#include <iostream>
#include <stdio.h>

using namespace std;

// Insert custom code here
void log() {
	int a, b, c;
	for(int i = 0; i < 100; i++) {
		a = i % 2;
		b = i * 3;
		c = i / 4;
	}
	return;
}

int main(int argc, char** argv) {
	__asm volatile("# LLVM-MCA-BEGIN log":::"memory");
	log();
	__asm volatile("# LLVM-MCA-END":::"memory");
}