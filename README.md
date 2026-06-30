# AstraRV
![SystemVerilog](https://img.shields.io/badge/Language-SystemVerilog-blue)![Architecture](https://img.shields.io/badge/Architecture-RV32I%20Single%20Cycle-green)![Verification](https://img.shields.io/badge/Verification-ModelSim-success)![Status](https://img.shields.io/badge/Project-v1.0-orange)

AstraRV is a **32-bit RV32I Single-Cycle RISC-V Processor** designed and implemented completely in **SystemVerilog** following an industrial RTL design methodology.

The processor is developed module-by-module with independent verification before full CPU integration. Every RTL block is verified using dedicated SystemVerilog testbenches and ModelSim waveform analysis.

---

# Features

- 32-bit RV32I Single-Cycle Processor
- Modular RTL Architecture
- SystemVerilog RTL Implementation
- Independent Module Verification
- Complete CPU Integration
- Complete Verification of All Implemented Instructions
- ModelSim Waveform Validation
- Intel FPGA Compatible RTL

---

# Processor Specifications

| Item | Value |
|------|-------|
| ISA | RV32I |
| Architecture | Single Cycle |
| Data Width | 32-bit |
| Instruction Width | 32-bit |
| RTL Language | SystemVerilog |
| Verification | ModelSim |
| FPGA Target | Intel FPGA |

---

# Verified Instruction Support

## R-Type

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

## I-Type

- ADDI
- ANDI
- ORI
- XORI
- SLLI
- SRLI
- SRAI
- SLTI
- SLTIU

## Memory

- LW
- SW

## Branch

- BEQ

---

# Processor Datapath

```
                Program Counter
                       │
                       ▼
            Instruction Memory
                       │
                       ▼
            Instruction Decoder
              ┌────────┴────────┐
              ▼                 ▼
    Immediate Generator    Main Control Unit
                                    │
                               ALU Control
                                    │
        ┌───────────────────────────┘
        ▼
    Register File
        │
        ▼
    Operand Multiplexer
        │
        ▼
        ALU
        │
   ┌────┴─────┐
   ▼          ▼
Data Memory Writeback MUX
        │
        ▼
 Register File
```

---

# RTL Modules

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
- Single-Cycle CPU Top Module

---

# Verification Summary

Successfully Verified

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
- Complete CPU Integration

Instruction Verification

- R-Type Arithmetic Instructions
- I-Type Arithmetic Instructions
- Memory Instructions
- Branch Instructions

Total Verified Instructions

**22**

---

# Repository Structure

```
AstraRV/
│
├── rtl/
├── tb/
├── docs/
├── images/
├── README.md
├── LICENSE
├── .gitignore
└── modelsim.do
```

---

# Project Statistics

| Item | Value |
|------|-------|
| RTL Modules | 13 |
| Testbenches | 1 |
| Verified Instructions | 22 |
| Verification Status | PASS |
| Simulator | ModelSim |
| Language | SystemVerilog |

---

# Tools Used

- SystemVerilog
- ModelSim
- Git
- GitHub
- Visual Studio Code

---

# Future Work

## AstraRV v2.0

- BNE
- BLT
- BGE
- BLTU
- BGEU
- JAL
- JALR
- LUI
- AUIPC

## AstraRV v3.0

- Five-Stage Pipeline
- Hazard Detection Unit
- Forwarding Unit
- Pipeline Registers

## AstraRV v4.0

- AXI4 Interface
- Instruction Cache
- Data Cache

## AstraRV v5.0

- UVM Verification Environment
- Functional Coverage
- Assertions
- Constrained Random Verification

---

# Author

**Ram Kumar B**

B.Tech Electronics and Communication Engineering

VIT Chennai
