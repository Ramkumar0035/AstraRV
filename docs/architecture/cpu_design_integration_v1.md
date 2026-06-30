# AstraRV CPU Design Integration v1.0

# Overview

AstraRV is a 32-bit RV32I Single-Cycle RISC-V processor implemented entirely in SystemVerilog. The processor follows a modular RTL design methodology where each hardware block is designed, verified independently, and then integrated into the complete processor datapath.

The current v1.0 release represents a fully integrated and functionally verified single-cycle processor supporting the implemented RV32I instruction subset.

---

# Processor Specifications

| Item | Value |
|------|-------|
| ISA | RV32I |
| Architecture | Single-Cycle |
| Data Width | 32-bit |
| Instruction Width | 32-bit |
| RTL Language | SystemVerilog |
| Verification | ModelSim |
| Target FPGA | Intel FPGA |

---

# Integrated RTL Modules

| Module | Status |
|---------|--------|
| Program Counter | ✅ |
| Instruction Memory | ✅ |
| Instruction Decoder | ✅ |
| Immediate Generator | ✅ |
| Main Control Unit | ✅ |
| ALU Control Unit | ✅ |
| Register File | ✅ |
| Operand Multiplexer | ✅ |
| Arithmetic Logic Unit | ✅ |
| Data Memory | ✅ |
| Writeback Multiplexer | ✅ |
| Branch Unit | ✅ |
| Single-Cycle CPU Top | ✅ |

---

# Complete Processor Datapath

```
                    +----------------+
                    | Program Counter|
                    +-------+--------+
                            |
                            ▼
                 +----------------------+
                 | Instruction Memory   |
                 +----------+-----------+
                            |
                            ▼
                 +----------------------+
                 | Instruction Decoder  |
                 +----------+-----------+
                            |
             +--------------+--------------+
             |                             |
             ▼                             ▼
     Immediate Generator           Main Control Unit
                                          |
                                    ALU Control
                                          |
                  +-----------------------+
                  |
                  ▼
            Register File
                  |
          +-------+-------+
          |               |
          ▼               ▼
     Operand A      Operand MUX
                          |
                   Register / Immediate
                          |
                          ▼
                   +--------------+
                   |     ALU      |
                   +------+-------+
                          |
               +----------+----------+
               |                     |
               ▼                     ▼
          Data Memory         Writeback MUX
               |                     |
               +----------+----------+
                          |
                          ▼
                   Register File
```

---

# Processor Execution Flow

Each instruction is executed in a single clock cycle.

```
Program Counter
        ↓
Instruction Fetch
        ↓
Instruction Decode
        ↓
Immediate Generation
        ↓
Control Signal Generation
        ↓
Register File Read
        ↓
Operand Selection
        ↓
ALU Execution
        ↓
Memory Access (LW/SW)
        ↓
Writeback
        ↓
Register File Update
```

---

# Implemented and Verified Instructions

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

# Verification Summary

Every RTL module was verified individually before CPU integration.

The complete processor was then verified using directed SystemVerilog test programs and ModelSim waveform analysis.

Verification completed for:

- Module-Level Verification
- CPU Integration Verification
- Arithmetic Instructions
- Immediate Instructions
- Memory Instructions
- Branch Instructions

Overall Status

**PASS**

---

# Project Statistics

| Item | Value |
|------|-------|
| RTL Modules | 13 |
| Top-Level CPU | 1 |
| Testbenches | 1 |
| Verified Instructions | 22 |
| Verification Status | PASS |

---

# Design Methodology

The processor was developed using an incremental RTL design flow.

1. RTL Module Design
2. Standalone Module Verification
3. Progressive CPU Integration
4. CPU-Level Functional Verification
5. Waveform Validation
6. Stable v1.0 Release

This methodology simplified debugging and ensured functional correctness throughout development.

---

# Current Status

**AstraRV v1.0**

- Complete RTL Integration
- Complete Module Verification
- Complete CPU Verification
- Stable Release

---

# Next Version

Development of AstraRV v2.0 will focus on:

- Remaining RV32I Instructions
- Extended Branch Support
- Jump Instructions
- Upper Immediate Instructions

Subsequent releases will introduce a pipelined architecture, AXI4 integration, and a UVM-based verification environment.