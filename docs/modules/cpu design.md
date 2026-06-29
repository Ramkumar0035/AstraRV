# AstraRV CPU Design

## Overview

AstraRV is a 32-bit RV32I single-cycle RISC-V processor developed entirely in SystemVerilog. The objective is to design the processor from the ground up while following an industrial RTL development methodology. Every module is designed, verified independently, and then integrated into the processor datapath.

---

# Processor Specifications

| Item | Value |
|------|-------|
| ISA | RV32I |
| Architecture | Single Cycle |
| Data Width | 32-bit |
| Instruction Width | 32-bit |
| Language | SystemVerilog |
| Verification | ModelSim |
| Target FPGA | Intel FPGA |

---

# Development Progress

## ✔ Program Counter

### Description

Maintains the current instruction address and updates it every clock cycle.

### Verification

- Reset functionality verified
- Sequential PC increment verified

Status: **Completed**

---

## ✔ Instruction Memory

### Description

Stores the processor instructions.

### Verification

- Address decoding verified
- Correct instruction fetch verified

Status: **Completed**

---

## ✔ Instruction Decoder

### Description

Extracts all instruction fields.

Outputs

- opcode
- rd
- rs1
- rs2
- funct3
- funct7

Status: **Completed**

---

## ✔ Immediate Generator

### Description

Generates sign-extended immediate values for all RV32I instruction formats.

Supported Formats

- I-Type
- S-Type
- B-Type
- U-Type
- J-Type

Status: **Completed**

---

## ✔ Main Control Unit

### Description

Generates processor control signals based on opcode.

Generated Signals

- RegWrite
- MemRead
- MemWrite
- MemToReg
- ALUSrc
- Branch
- ALUOp

Status: **Completed**

---

## ✔ ALU Control

### Description

Generates ALU control signals using

- ALUOp
- funct3
- funct7

Status: **Completed**

---

## ✔ Register File

### Description

32 × 32-bit general purpose register file.

Features

- Dual Read Ports
- Single Write Port
- x0 hardwired to zero

Status: **Completed**

---

## ✔ Operand Multiplexer

### Description

Selects the second ALU operand.

Sources

- Register Data
- Immediate

Status: **Completed**

---

## ✔ Arithmetic Logic Unit

### Description

Executes arithmetic and logical operations.

Supported Operations

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

Status: **Completed**

---

# Current Integrated Datapath

```
        +----------------+
        | Program Counter|
        +-------+--------+
                |
                v
      +------------------+
      | Instruction Mem  |
      +--------+---------+
               |
               v
      +------------------+
      | Instruction Decode|
      +--------+---------+
               |
       +-------+-------+
       |               |
       v               v
 Immediate         Control Unit
       |               |
       +-------+-------+
               |
               v
      +------------------+
      | Register File    |
      +--------+---------+
               |
       +-------+-------+
       |               |
       v               |
    Operand MUX <------+
           |
           v
      +---------+
      |   ALU   |
      +---------+
```

---

# Integration Status

| Module | Status |
|---------|--------|
| PC | ✔ |
| IMEM | ✔ |
| Decoder | ✔ |
| Immediate Generator | ✔ |
| Control Unit | ✔ |
| ALU Control | ✔ |
| Register File | ✔ |
| Operand MUX | ✔ |
| ALU | ✔ |
| Data Memory | ⏳ |
| Write Back | ⏳ |
| Branch Unit | ⏳ |
| PC MUX | ⏳ |

---

# Verification

Every module is verified independently using dedicated SystemVerilog testbenches.

Waveforms are generated using ModelSim to validate functional correctness before integration.

---

# Next Milestone

- Data Memory
- Write Back Multiplexer
- Branch Logic
- PC Selection Logic
- Complete Single Cycle CPU

