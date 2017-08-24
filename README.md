# Taxoner 1.4

Publication:

   Pongor LS, Vera R, Ligeti B. (2014) <a href="http://www.plosone.org/article/info%3Adoi%2F10.1371%2Fjournal.pone.0103441">Fast and Sensitive Alignment of Microbial Whole Genome Sequencing Reads to Large Sequence Datasets on a Desktop PC: Application to Metagenomic Datasets and Pathogen Identification</a>. *PLoS ONE* 9(7): e103441.

Taxoner, a simple, parallelizable workflow that uses database partitioning in conjunction with <a href="http://bowtie-bio.sourceforge.net/bowtie2/index.shtml">Bowtie2</a> searches, which allows one to align millions of reads against the full <a href="ftp://ftp.ncbi.nih.gov/blast/db/FASTA/nt.gz">nt</a> database of <a href="https://www.ncbi.nlm.nih.gov">NCBI</a>, typically in a few hours on a standard four threaded processor. 

The program can accept reads of all major platforms (Illumina, Ion Torrent, 454, !PacBio) and the output can be either further analyzed with sophisticated tools such as <a href="http://ab.inf.uni-tuebingen.de/software/megan/">MEGAN</a>, or directly evaluated by a built-in taxon assignment procedure that also allows the identification of genes and potential functions. 

The speed and accuracy of the method compares favorably to other programs and it can run on ordinary desktop or laptop computers without significant loss in speed.  

A demo server for testing purposes is available in <a href="http://pongor.itk.ppke.hu/taxoner/">here</a> 

----
This repository is a customized version for use with the PATRIC database of bacterial genomes (www.patricbrc.org).
It also includes the capability to supply extra commands to the bowtie2 program within taxoner (see ./taxoner64v1.4/taxoner64_manual.txt)
