Startup procedure (only required if you toggled CLK before programming)
-----------------------------------------------------------------------

Since jumps use absolute addresses and there is no option to reset the IRAM
counter, you need to jump to 0000 before starting to toggle in the program.

1. load 0100 (NOP) to the whole instruction RAM (IRAM)
2. load 1100 (JUMP) and 0000 (address 0) to IRAM
3. step through the program until the processor does a jump. At CLK = Low after
   the jump, the IRAM pointer is at 0000 and you can start to toggle in the
   program.