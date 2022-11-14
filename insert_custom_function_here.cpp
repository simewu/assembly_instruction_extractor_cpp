#include <iostream>
#include <stdio.h>

using namespace std;

// Insert custom code here
void log() {
	__asm volatile("# LLVM-MCA-BEGIN log":::"memory");
	int a, b, c;
	for(int i = 0; i < 100; i++) {
		a = i % 2;
		b = i * 3;
		c = i / 4;
	}
	return;
	__asm volatile("# LLVM-MCA-END":::"memory");
}

int main(int argc, char** argv) {
	log();
}