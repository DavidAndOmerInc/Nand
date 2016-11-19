// Sort in descending order array that start at address that in R14, and his length is in R15.

@tmp
M=0
@R14
D = M
@cur
M = D
@toCompare
M = 0
@R15
D = M
@endArray
M = D
@cur
D = M
@endArray
M = M + D

//@R15
//D = M
//@END
//D;JEQ // Jump if the array is empty.
//@R1
//D = D - 1
//D;JEQ // Jump if the array contain only 1 value.

(OUTSIDE_LOOP)
	@cur
	D = M
	@toCompare
	M = D + 1
	@endArray
	D = D - M // D now equal to the last place of the array minus the current place.
	@END
	D;JEQ // Jump if arrive to last place of the array.
	(INSIDE_LOOP)
		@toCompare
		D = M
		@endArray
		D = M - D // D now equal to the last place of the array minus the current index of the array to compare.
		@TO_OUTSIDE_LOOP
		D;JEQ // Jump if arrive to last place of the array.
		@toCompare
		A = M // go to the place of the to compare.
		D = M
		@cur
		A = M
		D = D - M
		@CONTINEU_INSIDE_LOOP
		D;JLE // Jump if the current value bigger than the toCompare value.
		// Do the swap.
		@cur
		A = M
		D = M
		@tmp
		M = D
		@toCompare
		A = M
		D = M
		@cur
		A = M
		M = D // the cur get the value of toCompare.
		@tmp
		D = M
		@toCompare
		A = M
		M = D
		(CONTINEU_INSIDE_LOOP)
		@toCompare
		M = M + 1
		@INSIDE_LOOP
		0;JMP
	(TO_OUTSIDE_LOOP)
	@cur
	M = M + 1
	@OUTSIDE_LOOP
	0;JMP

(END) // The end of the program.
