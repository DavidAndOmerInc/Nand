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

// Put your code here.

	@5 // array length
	D=A;
	@n
	M=D;
	@SCREEN // array start
	D=A;
	@array
	M=D;
	@i
	M=0;
(KEYBIND)
	@KBD
	D=M
	@LOOP
	D;JNE
	@KEYBIND
	0;JMP
	
	
(LOOP)
	//if i == n goto end
	@i
	D=M;
	@n
	D=D-M;
	@KEYBIND
	D;JEQ
	// MAKE YOUR LOOP THINGS HERE!
	@array
	D=M
	@i
	A=D+M
	M=-1;
	
	@i
	M=M+1;
	
	@LOOP
	0;JMP
	
(END)
	@END
	0;JMP
	