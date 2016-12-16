// File name: projects/04/divide/Divide.tst

load Divide.asm,
output-file Divide.out,
compare-to Divide.cmp,
output-list RAM[13]%D2.6.2 RAM[14]%D2.6.2 RAM[15]%D2.6.2 ;

set RAM[13] 10,   // Set test arguments
set RAM[14] 5,
set RAM[15] 8,
repeat 500 {
  ticktock;
}
output;

set PC 0,
set RAM[13] 15,   // Set test arguments
set RAM[14] 5,
set RAM[15] 7,
repeat 500 {
  ticktock;
}
output;

set PC 0,
set RAM[13] 3,   // Set test arguments
set RAM[14] 1,
set RAM[15] 9,
repeat 500 {
  ticktock;
}

output;

set PC 0,
set RAM[13] 100,   // Set test arguments
set RAM[14] 10,
set RAM[15] 6,
repeat 500 {
  ticktock;
}
output;

set PC 0,
set RAM[13] 5,   // Set test arguments
set RAM[14] 2,
set RAM[15] 1,
repeat 700 {
  ticktock;
}

output;

set PC 0,
set RAM[13] 3000,   // Set test arguments
set RAM[14] 4,
set RAM[15] 1,
repeat 1000 {
  ticktock;
}

output;
