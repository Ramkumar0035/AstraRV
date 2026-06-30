# AstraRV Instruction Support

# Overview

The AstraRV processor currently implements a subset of the RV32I Instruction Set Architecture (ISA).

The following table summarizes the implementation and verification status of each supported instruction.

---

# Arithmetic Instructions

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

# Immediate Instructions

| Instruction | Implemented | Verified |
|------------|:-----------:|:--------:|
| ADDI  | ✅ | ✅ |
| SLTI  | ✅ | ❌ |
| SLTIU | ✅ | ❌ |
| ANDI  | ✅ | ❌ |
| ORI   | ✅ | ❌ |
| XORI  | ✅ | ❌ |
| SLLI  | ✅ | ❌ |
| SRLI  | ✅ | ❌ |
| SRAI  | ✅ | ❌ |

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
| BNE | ❌ | ❌ |
| BLT | ❌ | ❌ |
| BGE | ❌ | ❌ |
| BLTU | ❌ | ❌ |
| BGEU | ❌ | ❌ |

---

# Jump Instructions

| Instruction | Implemented | Verified |
|------------|:-----------:|:--------:|
| JAL | ❌ | ❌ |
| JALR | ❌ | ❌ |

---

# Upper Immediate Instructions

| Instruction | Implemented | Verified |
|------------|:-----------:|:--------:|
| LUI | ❌ | ❌ |
| AUIPC | ❌ | ❌ |

---

# Verification Summary

## Fully Verified

- ADD
- SUB
- SLT
- SLTU
- AND
- OR
- XOR
- SLL
- SRL
- SRA
- ADDI
- LW
- SW
- BEQ

---

## RTL Implemented but Not Yet Verified

- ANDI
- ORI
- XORI
- SLLI
- SRLI
- SRAI
- SLTI
- SLTIU

---

## Planned for Future Releases

- BNE
- BLT
- BGE
- BLTU
- BGEU
- JAL
- JALR
- LUI
- AUIPC

---

# Current ISA Coverage

| Category | Progress |
|----------|---------:|
| Arithmetic | 10 / 10 |
| Immediate | 9 / 9 |
| Memory | 2 / 2 |
| Branch | 1 / 6 |
| Jump | 0 / 2 |
| Upper Immediate | 0 / 2 |

---

# Version

Current Version

**AstraRV v1.0**