# AstraRV Instruction Support

## Overview

AstraRV is a modular 32-bit RV32I Single-Cycle RISC-V processor written in SystemVerilog.

This document summarizes the implementation and verification status of the currently supported RV32I instructions.

---

# Arithmetic Instructions (R-Type)

| Instruction | Implemented | Verified |
|------------|:-----------:|:--------:|
| ADD  | ✅ | ✅ |
| SUB  | ✅ | ✅ |
| SLT  | ✅ | ✅ |
| SLTU | ✅ | ✅ |
| AND  | ✅ | ✅ |
| OR   | ✅ | ✅ |
| XOR  | ✅ | ✅ |
| SLL  | ✅ | ✅ |
| SRL  | ✅ | ✅ |
| SRA  | ✅ | ✅ |

---

# Immediate Instructions (I-Type)

| Instruction | Implemented | Verified |
|------------|:-----------:|:--------:|
| ADDI  | ✅ | ✅ |
| ANDI  | ✅ | ✅ |
| ORI   | ✅ | ✅ |
| XORI  | ✅ | ✅ |
| SLLI  | ✅ | ✅ |
| SRLI  | ✅ | ✅ |
| SRAI  | ✅ | ✅ |
| SLTI  | ✅ | ✅ |
| SLTIU | ✅ | ✅ |

---

# Memory Instructions

| Instruction | Implemented | Verified |
|------------|:-----------:|:--------:|
| LW | ✅ | ✅ |
| SW | ✅ | ✅ |

---

# Branch Instructions

| Instruction | Implemented | Verified |
|------------|:-----------:|:--------:|
| BEQ | ✅ | ✅ |

---

# Fully Verified Instructions

The following implemented instructions have been functionally verified using directed SystemVerilog testbenches and ModelSim waveform analysis.

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
- ADDI
- ANDI
- ORI
- XORI
- SLLI
- SRLI
- SRAI
- SLTI
- SLTIU
- LW
- SW
- BEQ

---

# Current ISA Coverage

| Category | Verified |
|----------|---------:|
| R-Type Arithmetic | 10 / 10 |
| I-Type Arithmetic | 9 / 9 |
| Memory | 2 / 2 |
| Branch | 1 / 1 |
| Overall Implemented | **22 / 22** |

---

# Planned Instructions

The following RV32I instructions are planned for future releases.

### Branch

- BNE
- BLT
- BGE
- BLTU
- BGEU

### Jump

- JAL
- JALR

### Upper Immediate

- LUI
- AUIPC

---

# Version

Current Version

**AstraRV v1.0**