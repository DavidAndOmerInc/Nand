// sort array that start at address that in R14, and his length is in R15.

@tmp
M=0
@R14
D = M
@cur
M = D
@toCompare
M = 0
@endArray
M = D
@cur
D = M
@endArray
M = M + D


(OUTSIDE_LOOP)
	@cur
	D = M
	@toCompare
	M = D + 1
	@endArray
	D = D - M
	//@R15
	//D = D - M
	@INFINITE_LOOP
	D;JEQ
	(INSIDE_LOOP)
		@toCompare
		D = M
		@endArray
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
		0;JMP
		(TO_OUT_LOOP)
			@cur
			M = M + 1
			@OUTSIDE_LOOP
			0;JMP


(INFINITE_LOOP)
	@INFINITE_LOOP
	0;JMP
