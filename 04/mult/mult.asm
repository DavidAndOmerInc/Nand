// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
@0
D = A
@i
M = D
@R2
M = D

(LOOP)
	@R1
	D = M
	@i
	D = D - M
	@INFINITE_LOOP
	D;JLE
	@R0
	D = M
	@R2
	M = M + D
	@1
	D = A
	@i
	M = M + D
	@LOOP
	0;JMP

(INFINITE_LOOP)
	@INFINITE_LOOP
	0;JMP
