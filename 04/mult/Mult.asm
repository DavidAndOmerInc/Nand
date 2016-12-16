// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// pre loop
@R0
D = A
@i
M = D
@R2
M = D

@sign
M = 0

@R1
D = M
@LOOP
D;JGE
	@R1
	D = M
	M = -D
	@sign
	M = -1
	@LOOP
	0;JMP

(LOOP)
	@R1
	D = M
	@i
	D = D - M
	@SIGN_CHECK
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
	
	
(SIGN_CHECK)
	@sign
	D = M
	@END
	D;JEQ
	@R2
	M = -M

(END)