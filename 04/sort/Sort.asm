// sort array that start at address that in R14, and his length is in R15.

@tmp
M=0
@R14
D = M
@cur
M = D
@toCompare
M = 0


(OUTSIDE_LOOP)
	@cur
	D = M
	@toCompare
	M = D + 1
	@R15
	D = D - M
	@INFINITE_LOOP
	D;JEQ
	(INSIDE_LOOP)
		@toCompare
		D = M
		@R15
		D = D - M
		@TO_OUT_LOOP
		D;JEQ

		@cur
		A = M
		D = M
		@toCompare
		A = M
		D = M - D
		@CONTINEU
		D;JLE

		@cur // do the swap
		A = M
		D = M
		@tmp
		M = D
		@toCompare
		A = M
		D = M
		@cur
		A = M
		M = D
		@tmp
		D = M
		@toCompare
		A = M
		M = D

		(CONTINEU)
		@toCompare
		M = M + 1
		@INSIDE_LOOP
		(TO_OUT_LOOP)
			0;JMP
			@cur
			M = M + 1
			@OUTSIDE_LOOP
			0;JMP


(INFINITE_LOOP)
	@INFINITE_LOOP
	0;JMP
