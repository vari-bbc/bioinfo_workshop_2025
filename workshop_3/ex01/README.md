# Exercise 1

- Load snakemake module using `module load bbc2/snakemake/snakemake-9.13.2`. 
- Run `snakemake -np` to do a dryrun.
- Do an actual run using the command, `snakemake --cores 2`.
- Try to make the workflow count an additional word of your choice.
- Uncomment the commented line in `rule all`. What shows up now when you run `snakemake -np`?
- Run `snakemake -np`.
- Try to rewrite the code, entering all the words to be counted into a list and saved as a Python variable. Update the input directive in `rule all` and `rule sum_letter_counts` to use the Python list instead of hardcoding the words.
