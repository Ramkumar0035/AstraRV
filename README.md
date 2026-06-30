# AstraRV

AstraRV is a **32-bit RV32I Single-Cycle RISC-V Processor** designed and implemented completely in **SystemVerilog** following an industrial RTL design methodology.

The processor is developed module-by-module with independent verification before full CPU integration. Every RTL block is verified using dedicated SystemVerilog testbenches and ModelSim waveform analysis.

---

# Features

- RV32I Single-Cycle Architecture
- 32-bit Datapath
- Modular RTL Design
- Independent Module Verification
- Integrated CPU Verification
- ModelSim Functional Verification
- Intel FPGA Compatible RTL

---

# Processor Specifications

| Item | Value |
|------|-------|
| ISA | RV32I |
| Architecture | Single Cycle |
| RTL Language | SystemVerilog |
| Data Width | 32-bit |
| Instruction Width | 32-bit |
| Verification | ModelSim |
| FPGA Target | Intel FPGA |

---

# Supported Instructions

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
          ┌──────────┴──────────┐
          ▼                     ▼
 Immediate Generator      Control Unit
                                 │
                          ALU Control
                                 │
          ┌──────────┬───────────┘
          ▼          ▼
     Register File  Operand MUX
             │          │
             └────┬─────┘
                  ▼
                 ALU
                  │
          ┌───────┴────────┐
          ▼                ▼
    Data Memory      Writeback MUX
          │                │
          └────────┬───────┘
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
- Single Cycle CPU Top

---

# Verification

The processor has been verified using dedicated SystemVerilog testbenches and ModelSim waveforms.

Completed verification:

- Program Counter
- Instruction Fetch
- Instruction Decode
- Immediate Generation
- Control Unit
- Register File
- ALU Operations
- Load / Store
- Branch (BEQ)
- Complete CPU Integration

---

# Repository Structure

```
rtl/
tb/
docs/
images/
```

---

# Tools Used

- SystemVerilog
- ModelSim
- VS Code
- Git
- GitHub

---

# Future Improvements

- Remaining RV32I Branch Instructions
- Jump Instructions (JAL/JALR)
- LUI/AUIPC
- Pipeline Architecture
- UVM Verification Environment
- FPGA Implementation

---

# Author

**Ram Kumar B**

Electronics and Communication Engineering

VIT Chennai