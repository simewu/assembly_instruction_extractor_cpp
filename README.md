# C++ Assembly Instruction Extractor and Statistics Tool
Log the distribution of assembly instructions used to execute a given C++ function using GDB.

---
## Usage (dynamic analysis with [GDB](https://sourceware.org/gdb/current/onlinedocs/gdb/Continuing-and-Stepping.html#Continuing-and-Stepping))
- Insert some C++ code into the `log` function of `insert_custom_function_here.cpp`.
- Run `./compile.sh` to compile the source code.
- Run `python3 run_experiment.py` to begin the experiment.
- Run `cd categorization`
- Run `cp ../experiment_output.csv .`
- `python3 postProcess_categorize.py` to post-process the data.

## Output
#### The following columns are logged in categorization/experiment_output_categorized.csv:
- File name
- Total number of instructions
- Number of Data Movement instructions
- Number of Arithmetic and Logic instructions
- Number of Control Flow instructions
- Number of Miscellaneous instructions

#### Additional categorizations include:
- Number of Addition instructions
- Number of Subtraction instructions
- Number of Multiply instructions
- Number of Divide instructions
- Number of Jump instructions
- Number of No Operation (NOP) instructions

#### And finally, the raw data is appended to end last column:
- List of Instructions in JSON format

## Usage (static analysis with [LLVM-MCA](https://llvm.org/docs/CommandGuide/llvm-mca.html))
- Insert some C++ code into the `log` function of `insert_custom_function_here.cpp`.
- Run `./compile_static_analysis.sh` to compile the source code and export the analysis.
- Navigate to `static_analysis/` to find the assembly (.asm) and json outputs.

## TODO
- Add support for Intel Process Tracing (PT) for compatible CPUs
  - to utilize GDB [`record btrace pt`](https://sourceware.org/gdb/onlinedocs/gdb/Process-Record-and-Replay.html)
  - to utilize perf [`perf record -e intel_pt//`](https://man7.org/linux/man-pages/man1/perf-intel-pt.1.html)
