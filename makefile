################################################################################
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
################################################################################
# Flags
PATH:=$PATH
SHELL:=/bin/bash
# Non-working variables :'(
CPU=$(shell lscpu)
OS=$($OSTYPE)
# ifeq ($(origin cpu), undefined)
# cpu = $CPUTYPE
# @echo "$cpu"
# os ?= $($OSTYPE)
# endif

# Make all targets
all: QualityControl Trinity Comparison clean
	@echo "Currently making the $@ recipee."
	@echo "Hello $(USER), if unsure how to run this file try make help for specific options."

# Testing area:
# Currently testing:
#		Variable expansion in makefile to figure out cpu arquitecture and operating system.
PHONY:
	@echo "Currently making the $@ recipee."
	@echo $CPU
	@echo $(value CPU)
	@echo $(OS)
	@echo $(value OS)

# LIST = one two three
# for i in $(LIST); do \
# 	echo $$i; \
# done

# Non-working computer specs recipee
specs: $(CPU) $(OS)
	@echo "Currently making the $@ recipee."
	@echo "You are utilizing a $(CPU) with an $(OS) derivate.\n"
	ifeq ($OS == "linux_gnu")
		@echo "YEY! :P"
	else
		@echo "nope :'("
	endif

# Choose preffered style help vs help2
help:
	@echo "Currently making the $@ recipee."
	@echo "Usage: 'make target' \n"
	@echo "Possible make targets are:"
	@echo "	all"
	@echo " 	Makes all the following targets."
	@echo	"	QualityControl"
	@echo " 	Proper Description"
	@echo "	Trinity"
	@echo " 	Proper Description"
	@echo "	Comparison"
	@echo " 	Proper Description"
	@echo "	clean"
	@echo " 	Proper Description\n"

# Choose preffered style help vs help2
help2:
	@echo "Currently making the $@ recipee."
	@echo "Usage: 'make target' \n"
	@echo "Possible make targets are:"
	@echo "	all QualityControl Trinity Comparison clean\n"
	@echo "\nFor more help with a specific target try help_target"

# Specific help for QualityControl recipee
help_QualityControl:
	@echo "Currently making the $@ recipee."
	@echo "To perform Quality Control by normalizing and trimming the rna seq file data."
	@echo "\nThe required inputs are: \n"

QualityControl:
	@echo "Currently making the $@ recipee."
# 	Trimmomatic
# 	Normalize
# 	the other script

# 	script to calculate # of lines and decide how many CPU is needed
# 	run it
# LIST = $(shell lscpu)
# for i in $(LIST);
#		do echo "\t $$i \n";
# done
Trinity:
	@echo "Currently making the $@ recipee."
	@echo $(shell lscpu)

Comparison:
	@echo "Currently making the $@ recipee."
	@echo "Looking for fata files:"
	@find -O3 . -name "*.fasta"
	@find -O3 . -name "*.fa"
	@find -O3 . -name "*.seq"

clean:
	@echo "Currently making the $@ recipee."
	@echo "Cleaning Options"
