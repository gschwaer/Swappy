4-bit 2-Reg-Double-Stack-Swap-Machine
===============================

The CPU has two 4-bit registers (A and B in SWAPR4) and three 16 entry stacks
(AS, BS, CS as STACK4), one stack per register (AS for A, BS for B) and one
stack for constants (CS). The instruction memory (IRAM in CMD4) has 16 entries
with 4-bit instructions (instruction set, see below).

![2-Reg-Double-Stack-Swap-Machine](https://user-images.githubusercontent.com/3410079/102700492-304a7380-424e-11eb-807d-d6c4456d96ad.png)

Constants are pushed on the const stack using: set `Cload`, set value, toggle `CLK`, *repeat*, ... unset `Cload`.

The program code is loaded the same way: set `Iload`, set value, toggle `CLK`, *repeat*, ... unset `Iload`.

If `CLK` is toggled before programming the instructions read the section below about a startup procedure.

Instruction Set
---------------

```
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
```

Startup procedure (only required if you toggled CLK before programming)
-----------------------------------------------------------------------

Since jumps use absolute addresses and there is no option to reset the IRAM
counter, you need to jump to 0000 before starting to toggle in the program.

1. load 0100 (NOP) to the whole instruction RAM (IRAM)
2. load 1100 (JUMP) and 0000 (address 0) to IRAM
3. step through the program until the processor does a jump. At CLK = Low after
   the jump, the IRAM pointer is at 0000 and you can start to toggle in the
   program.

Example program fib.prog
------------------------

The program `programs/fib.prog` calculates the fibonacci numbers. Since this is a
4-bit CPU the numbers overflow after 13. The program (and any other) can be "compiled"
with the script `programs/compile.sh`.

The following shows an example execution of the `fib.prog` on the CPU. The register
content and current instruction was added after recording the execution.
![fib.prog](https://user-images.githubusercontent.com/3410079/102700578-f5950b00-424e-11eb-86fb-e2106e2d8bda.gif)
