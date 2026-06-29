# Main Control Unit

## Status

✅ Completed

## Description

Generates the datapath control signals based on the decoded RV32I opcode.

## Supported Instructions

- R-Type
- ADDI
- LW
- SW
- BEQ

## Outputs

- RegWrite
- MemRead
- MemWrite
- MemToReg
- ALUSrc
- Branch
- ALUOp

## Verification

Verified all supported instruction types using a self-checking testbench.