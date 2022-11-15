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

## Example
- Using [liboqs]() to analyze the Dilithium family of signature algorithms, [the following table is generated](/example/categorization/experiment_output_categorized.csv):

| **Algorithm** | **Experiment** | **Total Instructions** | **Data Movement Instructions** | **Arithmetic and Logic Instructions** | **Control Flow Instructions** | **Miscellaneous Instructions** | **Addition Instructions** | **Subtraction Instructions** | **Multiply Instructions** | **Divide Instructions** | **Jump Instructions** | **No Operation Instructions** | **List of Instructions** |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| **Dilithium 2** | **Key generation** | 1168523 | 836573 | 248361 | 70088 | 13501 | 53330 | 9653 | 8705 | 25 | 2116 | 51556 | {'vmovdqa': 592848, ...} |
| **Dilithium 3** | **Key generation** | 2123647 | 1546149 | 422468 | 132396 | 22634 | 84487 | 14670 | 11719 | 30 | 4457 | 99083 | {'vmovdqa': 1125028,…} |
| **Dilithium 5** | **Key generation** | 3473747 | 2553515 | 667874 | 217931 | 34427 | 125486 | 21708 | 18168 | 37 | 5028 | 165926 | {'vmovdqa': 1906439,…} |
| **Dilithium 2** | **Signing** | 2674978 | 1799796 | 709544 | 137904 | 27734 | 124610 | 52478 | 98021 | 27 | 9427 | 100542 | {'vmovdqa': 1277311,…} |
| **Dilithium 3** | **Signing** | 2715310 | 1889261 | 642247 | 148692 | 35110 | 128148 | 41666 | 71015 | 16 | 9102 | 109103 | {'vmovdqa': 1334412,…} |
| **Dilithium 5** | **Signing** | 6153827 | 4326621 | 1422125 | 344772 | 60309 | 248461 | 89755 | 169009 | 39 | 16706 | 259791 | {'vmovdqa': 3198241,…} |
| **Dilithium 2** | **Verifying** | 972339 | 683378 | 222453 | 58882 | 7626 | 30495 | 8123 | 13184 | 14 | 2301 | 43808 | {'vmovdqa': 518837,…} |
| **Dilithium 3** | **Verifying** | 1810025 | 1305255 | 377052 | 113744 | 13974 | 51053 | 12488 | 19008 | 12 | 3593 | 85996 | {'vmovdqa': 1011224,…} |
| **Dilithium 5** | **Verifying** | 3054261 | 2234737 | 600785 | 195749 | 22990 | 79549 | 18408 | 26368 | 18 | 5259 | 149586 | {'vmovdqa': 1749524,…} |

## TODO
- Add support for Intel Process Tracing (PT) for compatible CPUs
  - to utilize GDB [`record btrace pt`](https://sourceware.org/gdb/onlinedocs/gdb/Process-Record-and-Replay.html)
  - to utilize perf [`perf record -e intel_pt//`](https://man7.org/linux/man-pages/man1/perf-intel-pt.1.html)
