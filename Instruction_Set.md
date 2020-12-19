Instruction Set:
SWAP    0b0000  0x0  Swap register A and B
PUSHA   0b0001  0x1  Push register A to stack A
PUSHB   0b0010  0x2  Push register B to stack B
PUSHAB  0b0011  0x3  PUSHA + PUSHB
NOP     0b0100  0x4  do nothing
POPA    0b0101  0x5  Pop stack A to register A
POPB    0b0110  0x6  Pop stack B to register B
POPAB   0b0111  0x7  POPA + POPB
ADD     0b1000  0x8  Add signed register A and B and write to A (A = A+B)
SUB     0b1001  0x9  Subtract signed register A and B and write to A (A = A-B)
ADDU    0b1010  0xa  Add unsigned register A and B and write to A (A = A+B)
SUBU    0b1011  0xb  Subtract unsigned register A and B and write to A (A = A-B)
JUMP    0b1100  0xc  Jump to address specified after the JUMP instruction
JAZ     0b1101  0xd  Jump to address specified after the JUMP instruction if register A is zero
JEQ     0b1110  0xe  Jump to address specified after the JUMP instruction if register A is equal to register B
POPC    0b1111  0xf  Pop constant from stack C to register B