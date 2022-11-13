# C++ Assembly Instruction Extractor and Statistics Tool
Log the distribution of assembly instructions used to execute a given C++ function using GDB.

---
## Usage
- Insert some C++ code into the `log` function of `insert_custom_function_here.cpp`.
- Run `./compile.sh` to compile the source code.
- Run `python3 run_experiment.py` to begin the experiment.
- Run `cd categorization`
- Run `cp ../experiment_output.csv .`
- `python3 postProcess_categorize.py` to post-process the data.

## Output
The following columns are logged in categorization/experiment_output_categorized.csv:
- File name
- Total number of instructions
- Number of Data Movement instructions
- Number of Arithmetic and Logic instructions
- Number of Control Flow instructions
- Number of Miscellaneous instructions
- Number of Addition instructions
- Number of Subtraction instructions
- Number of Multiply instructions
- Number of Divide instructions
- Number of Jump instructions
- Number of No Operation (NOP) instructions
- List of Instructions in JSON format
