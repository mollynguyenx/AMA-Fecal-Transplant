# AMA-Fecal-Transplant

## UNH GEN 711 Group Project on Fecal Microbiota Transplant
## Authors: 
Molly Nguyen, Ava Rose, Alex Trott

## Background:
We were interested in the study conducted by Kang et al. in 2017 on fecal microbiota transplants and their use to treat the behavioral and gastrointestinal symptoms of children with Autism Spectrum Disorder (ASD). In this study, the researchers aimed to treat some of the GI and behavioral issues seen in children with autism that had previously been linked to abnormalities in the gut microbiome. We compared the gut microbiome compositions between the treatment (recieved an FMT) and control (did not recieve an FMT) groups. 

## Methods: 
Metabarcoding sequences were downloaded from Kang et al. 2017 study of Microbiota Transplant Therapy.
We used VScode loaded with the conda environment on the RON computing cluster connected to github
The files were in fastq, and new directories were made to hold the project files.

**FASTQ Sample**
- fastp was run to trim poly-g tails
- The poly-Gtrimmed FASTQ files were imported into a qiime file. This command was run twice for the demux 1 and demux 2 directory
- cutadapt was used to remove primers and adapters.
- demux was run to make a file to view
  - The primer sequence is TACGTATGGTGCA
  -
**Denoising**
- conda qiime environment was activated
- run to remoce low quality reads and bases


**Taxonomy**
- rep-seqs and tables are merged
- taxonomy is then assigned and classified

## Findings: 

<img width="1428" alt="Screenshot 2023-05-12 at 13 32 21" src="https://github.com/atrott811/AMA-Fecal-Transplant/assets/130576641/ac0044d1-3abd-4367-aac6-4457ba3bc8a3">
Figure 1: Gut microbiome composition in subjects who did not recieve an FMT (control group). Graph was made with Qiime2View from the dataset downloaded from the Qiime FMT tutorial (Kang et al. study). 


<img width="1435" alt="Screenshot 2023-05-12 at 13 32 46" src="https://github.com/atrott811/AMA-Fecal-Transplant/assets/130576641/1108be53-2955-4b7f-89c6-ec9c8835e4f0">
Figure 2: Gut microbiome composition in subjects who recieved an FMT (treatment group. Graph was made with Qiime2View from the dataset downloaded from the Qiime FMT tutorial (Kang et al. study). 
