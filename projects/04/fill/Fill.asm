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

// initialize
(INIT)
@8191
D=A
@R0
M=D

// check keyboard
(CHECKKBD)
@KBD
D=M
@FILL
D;JNE
@CLEAN
0;JMP

// fill screen
(FILL)
@R0
D=M
@INIT
D;JLT

@SCREEN
D=A
@R0
D=D+M
A=D
M=-1

@R0
M=M-1
@FILL
0;JMP

// clean screen
(CLEAN)
@R0
D=M
@INIT
D;JLT

@SCREEN
D=A
@R0
D=D+M
A=D
M=0

@R0
M=M-1
@CLEAN
0;JMP