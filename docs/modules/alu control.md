# ALU Control

## Status

✅ Completed

## Description

Generates the ALU control signal based on the instruction type and function fields.

## Inputs

- ALUOp
- funct3
- funct7

## Output

- 4-bit ALU control signal

## Verification

Verified generation of:

- ADD
- SUB
- AND
- OR
- XOR
- SLL
- SRL
- SRA
- SLT
- SLTU

Simulation passed successfully.