// Dividing 2 number using logarithmic algorithm
// https://www.youtube.com/watch?time_continue=389&v=S5tD47NZx7w on 06:30
// using Divident and Divisor.


// update some vars (after and before.)
@R13
D = M
@divident
M = D
@R14
D = M
@divisor
M = D

// starting the algo.
// init algo vars
@0
D = A
@quotient
M = D
@divisor
D = M
@current_divisor
M = D
@1
D = A
@current_quotient_base
M = D
@DIVIDE
0;JMP
(DIVIDE)
	@divident
	D = M
	@divisor
	D = D - M
	@SUCCESS
	D;JLT // if divident < divisor -> stop the loop!
	@current_divisor
	D = M
	@divident
	D = D - M
	@DIVIDE_ELSE // if divident < current_divisor go to else
	D;JGT
		(DIVIDE_IF)
		@current_divisor
		D = M
		@divident
		M = M - D
		@current_quotient_base
		D = M
		@quotient
		M = M + D
		@current_divisor
		M<<;
		@current_quotient_base
		M<<;
		@DIVIDE
		0;JMP
	(DIVIDE_ELSE)
		@current_divisor
		M>>
		@current_quotient_base
		M>>
		@DIVIDE
		0;JMP
(SUCCESS)
	@quotient
	D = M
	@score
	M = D
	@END
	0;JMP
(END)
	@score
	D = M
	@R15
	M = D
	@END
	0;JMP


