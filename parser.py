# ###############################################################################
#                                                                              #
# Copyright 2017 Megaprobe-Lab                                                 #
#                                                                              #
# This is software created by the megaprobe lab under the GPL3 license.        #
#                                                                              #
# This program reproduces the pipeline for de novo rna sequencing research. To #
# run the program, just move into the folder that contains the makefile and    #
# make sure the sources folder contains the source files for the compilation   #
# of Trinity, khmer, Trimmomatic and ________.                                 #
#                                                                              #
# Then utilize the command: "make" to run the desired operation.               #
# ###############################################################################
#
# aim for ~1G RAM per ~1M ~76 base




import argparse
from Bio import SeqIO

parser = argparse.ArgumentParser(description = "reads two .fasta files")
parser.add_argument("--file", help = ".fasta or fastq file 1", required = True)
# parser.add_argument("--fasta_2", help = ".fasta file 2", required = True)

args = parser.parse_args()

filename = args.file
# fasta_2 = args.fasta_2

def decide_ext(filename):
    if filename.endswith('.fasta'):
        contig_dict, i = get_contig_dict(filename)
    elif filename.endswith('.fastq'):
        contig_dict, i = get_contig_dict2(filename)
    return contig_dict,i


def get_contig_dict(fasta_file):
        contig_dict = {}
        i = 0
        with open(fasta_file, 'rU') as handle:
                for record in SeqIO.parse(handle, 'fasta'):
                    k = len(record.seq)
                    contig_dict[record.id] = k
                    i += k
        return contig_dict , i
def get_contig_dict2(fastq_file):
    contig_dict = {}
    i = 0
    with open(fastq_file,'rU') as handle:
        for record in SeqIO.parse(handle,'fastq'):
            k = len(record.seq)
            contig_dict[record.id] = k
            i +=k
        return contig_dict, i


contig_dict, i = decide_ext(filename)
# dict_a , i = get_contig_dict(fasta_1)
f=open("out.txt","w+")
f.write(str(i)+"\n")
x= open("dic.txt", "w+")
x.write(str(contig_dict)+"\n")

GB = open("GBneeded.txt", "w+")
# gb = i / (1000000 * 25) for when 25 bases kmers
gb = i /(1000000 * 76)
gb = round(gb,0)
GB.write(str(gb)+"\n")
