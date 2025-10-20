# Exercise 1

- Load snakemake module using `module load bbc2/snakemake/snakemake-9.13.2`. 
- Run `snakemake -np` to do a dryrun.
- Run `snakemake --dag | dot -Tsvg > dag.svg` to view the workflow as a DAG.
- Do an actual run using the command, `snakemake --cores 2`.
- Try to make the workflow count an additional word of your choice.
- Uncomment the commented line in `rule all`. What shows up now when you run `snakemake -np`?
- Run `snakemake -np`.
- Try to rewrite the code, entering all the words to be counted into a list and saved as a Python variable. Update the input directive in `rule all` and `rule sum_letter_counts` to use the Python list instead of hardcoding the words.
- Why do we have the double braces in `rule sum_letter_counts`?
- Can you make the workflow read in the list of words from a file (each word on it's own line) instead of hardcoding it into `Snakefile`? Use the following code to read a file with one column named 'word'.

```
import pandas as pd

words = pd.read_csv(config["words.csv"], dtype={"word": str})

```
