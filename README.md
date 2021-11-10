# Readying_1000G_phase5_v3

A code to obtain the 1000G reference data that I use for my projects in the CBMR

## Introduction to the data

The data that I am using can only be found in the Porus/Hulk servers and can only be accessed by people in NNF's CBMR. While, the 1000G data is publically available, the data that I am using is part of the Phenomics Platform from our center, hence why I cannot share it. 

Importantly. this data is characterized by: 

1) Having all variants including insertions/delections and MAF <0.01.
2) However it does not contain simpletons. 
3) Contains individuals of all ancestries. 

In this pipeline we will do the following:

a) Index the original vcf files so that we can convert them to plink files.
b) Convert them into plink files removing variants with maf <0.01 and geno < 0.1 (only using individuals of European ancestry).
d) Removing duplicates  

### STEP A. Obtaining the data and indexing it.

First we need to obtain the data by doing a symbolic link in the folder where we are going to save the 1000G data. (CODE in Step_1_linking)
Then, we index it using bcftools -tbi (full code in Step_2_indexing)

### STEP B. Converting into plink 1.9 files excluding European individuals.

To generate the plink files for only Europeans, what we need to do is generating a list of only the 1000G individuals that are European. You can download in the 1000G website the two files that can be found in the DATA folder: igsr_populations.tsv and igsr_samples.tsv. Then, if you run Parsing_1000G_individuals.R in Step3, you will obtain the 503 European individuals that will be used.






