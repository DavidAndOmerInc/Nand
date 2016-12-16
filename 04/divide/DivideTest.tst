// File name: projects/04/divide/Divide.tst

load Divide.asm,
output-file DivideTest.out,
compare-to DivideTest.cmp,
output-list RAM[13]%D2.6.2 RAM[14]%D2.6.2 RAM[15]%D2.6.2 ;

set PC 0,
set RAM[13] 3000,   // Set test arguments
set RAM[14] 4,
set RAM[15] 1,
repeat 750 {
  ticktock;
}

output;

set PC 0,
set RAM[13] 16382,   // Set test arguments
set RAM[14] 2,
set RAM[15] 1,
repeat 1100 {
  ticktock;
}

output;

set PC 0,
set RAM[13] 32767,   // Set test arguments
set RAM[14] 3,
set RAM[15] 1,
repeat 1200 {
  ticktock;
}

output;
