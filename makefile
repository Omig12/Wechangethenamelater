################################################################################
#                                                                              #
# Copyright 2016 Megaprobe-Lab                                                 #
#                                                                              #
# This is software created by the megaprobe lab under the GPL3 license.        #
#                                                                              #
# This program reproduces the pipeline for ______________. To run the program, #
# just move into the   #
# utilize the command: "Python2.7 LGParser.py LastGraph". The LastGraph file utilized    #
# must be located on the same directory as the parser or full path must be specified.    #
#                                                                                        #
##########################################################################################
# Flags
CC = python2
PATH = ~/Downloads/

all:
	@echo "Hello $(USER) try make help for specific options"

help:
	@echo "Possible make targets are:\n"
	echo	'QualityControl'
	@echo ' 	Proper Description'
	@echo 'Trinity'
	@echo ' 	Proper Description'
	@echo 'Comparison'
	@echo ' 	Proper Description'
	@echo 'clean'
	@echo ' 	Proper Description'


QualityControl:
	# Trimmomatic
	# Normalize
	# the other script
Trinity:
	# script to calculate # of lines and decide how many CPU is needed
	# run it
Comparison:
	#

clean:
	@echo "Cleaning Options"
