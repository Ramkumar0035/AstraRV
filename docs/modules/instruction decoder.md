# Instruction Decoder

## Status

✅ Completed

## Description

The Instruction Decoder extracts instruction fields from a 32-bit RV32I instruction.

## Outputs

- opcode
- rd
- funct3
- rs1
- rs2
- funct7

## Features

- Pure combinational logic
- No internal storage
- Supports all RV32I instruction formats

## Verification

Successfully decoded:

- ADDI
- ADD

Simulation passed successfully.