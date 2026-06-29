# CPU Integration - Part 2

## Objective

Integrate the Instruction Decoder with the CPU datapath.

## Modules

- Program Counter
- Instruction Memory
- Instruction Decoder

## Result

The fetched instruction is successfully decoded into:

- opcode
- rd
- rs1
- rs2
- funct3
- funct7

Simulation verified correct decoding for:

- ADDI x1,x0,5
- ADDI x2,x0,10
- ADD x3,x1,x2
- NOP