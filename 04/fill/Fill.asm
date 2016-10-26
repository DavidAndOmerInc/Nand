// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.


// Init last stroke variable
@R0
D = A
@LAST_STROKE
M = D

// Infinite strokes check
(INFINITE_LOOP)
	// checking if the last keyboard stroke is changed
	@KBD 
	D = M
	@LAST_STROKE
	D = M - D // if nothing changed D = 0
	@CHANGE_P
	D;JNE // if last stroke was changed go to (CHANGE_P)
		@INFINITE_LOOP
		0;JMP
	(CHANGE_P)
		// Saving last keyboard stroke
		@KBD 
		D = M
		@LAST_STROKE
		M = D
		
		@P_TO_BLACK // Check which color we need (0 to white, -1 to black)
		D;JNE // if Stroke is not empty stroke - go to P_TO_BLACK 
			@p
			M = 0
			@PRINT
			0;JMP
		(P_TO_BLACK)
			@p
			M = -1
			@PRINT
			0;JMP
<<<<<<< HEAD
=======
			
>>>>>>> refs/remotes/origin/master
(PRINT)
	@8192
	D = A
	@SCREEN
	D = D + M
	//@24576
	//D = A
	@length
	M = D
	@SCREEN
	D = A
	@addr
	M = D
	(LOOP)
		@p
		D = M
		@addr
		A = M
		M = D

		@addr
		M = M +1
		D = M

		@length
		D = M - D
		@INFINITE_LOOP
		D;JEQ
		@LOOP
		0;JMP