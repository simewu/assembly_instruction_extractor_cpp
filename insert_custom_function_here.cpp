#include <ctime>
#include <fstream>
#include <iostream>
#include <cstring>
#include <string>
#include <stdio.h>
#include <oqs/oqs.h>
#include <unistd.h>
#include <chrono>

using namespace std;

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
	log();
}