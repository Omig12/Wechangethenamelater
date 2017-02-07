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
#




import argparse
from Bio import SeqIO

parser = argparse.ArgumentParser(description = "reads two .fasta files")
parser.add_argument("--fasta_1", help = ".fasta file 1", required = True)
# parser.add_argument("--fasta_2", help = ".fasta file 2", required = True)

args = parser.parse_args()

fasta_1 = args.fasta_1
# fasta_2 = args.fasta_2

def get_contig_dict(fasta_file):
        contig_dict = {}
        i = 0
        with open(fasta_file, 'rU') as handle:
                for record in SeqIO.parse(handle, 'fasta'):
                    k = len(record.seq)
                    contig_dict[record.id] = k
                    i += k
        return contig_dict , i


dict_a , i = get_contig_dict(fasta_1)
f=open("out.txt","w+")
f.write(str(i)+"\n")
