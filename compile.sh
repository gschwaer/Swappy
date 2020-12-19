#!/bin/bash
sed -e 's/SWAP/0000/' \
	-e 's/PUSHAB/0011/' \
	-e 's/PUSHA/0001/' \
	-e 's/PUSHB/0010/' \
	-e 's/NOP/0100/' \
	-e 's/POPAB/0111/' \
	-e 's/POPA/0101/' \
	-e 's/POPB/0110/' \
	-e 's/ADDU/1010/' \
	-e 's/SUBU/1011/' \
	-e 's/ADD/1000/' \
	-e 's/SUB/1001/' \
	-e 's/JUMP/1100/' \
	-e 's/JAZ/1101/' \
	-e 's/JEQ/1110/' \
	-e 's/POPC/1111/' "$1"
#	> "$1".out
echo