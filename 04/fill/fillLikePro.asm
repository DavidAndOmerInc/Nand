@KBD
D=M
@23
D;JNE // if key pressed, go below and fill screen
@6
D;JEQ // else, clear the screen

@i
M=0
@i
D=M
@8192
D=A-D 
@0
D;JEQ
@i
D=M
@SCREEN
A=D+A
M=0 //fill screen
@i 
M=M+1
@8
0;JMP

@i
M=0
@i
D=M
@8192
D=A-D 
@0
D;JEQ
@i
D=M
@SCREEN
A=D+A
M=-1 //fill screen
@i 
M=M+1
@25
0;JMP
