# Changelog

All notable changes to the AstraRV project are documented in this file.

---

# Version 1.0

Release Date: June 2026

## Added

### Processor

- 32-bit RV32I Single-Cycle Processor
- Modular RTL Architecture
- Complete CPU Integration

### RTL Modules

- Program Counter
- Instruction Memory
- Instruction Decoder
- Immediate Generator
- Main Control Unit
- ALU Control Unit
- Register File
- Operand Multiplexer
- Arithmetic Logic Unit
- Data Memory
- Writeback Multiplexer
- Branch Unit
- Top-Level CPU

### Implemented Instructions

#### R-Type

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

#### I-Type

- ADDI
- ANDI
- ORI
- XORI
- SLLI
- SRLI
- SRAI
- SLTI
- SLTIU

#### Memory

- LW
- SW

#### Branch

- BEQ

### Verification

- Module-Level Verification
- CPU Integration Verification
- Complete Verification of 22 Implemented Instructions
- ModelSim Waveform Validation

---

## Status

Stable Release