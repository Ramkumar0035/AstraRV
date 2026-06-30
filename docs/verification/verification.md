# AstraRV Verification Report

# Overview

The AstraRV processor has been verified using dedicated SystemVerilog testbenches and ModelSim waveform analysis.

Each RTL module was verified independently before progressive integration into the complete RV32I single-cycle processor. After integration, complete processor functionality was validated using directed instruction-level test programs.

---

# Verification Methodology

The verification flow follows an incremental RTL design methodology.

1. Design RTL module.
2. Develop dedicated SystemVerilog testbench.
3. Verify module functionality.
4. Inspect ModelSim waveforms.
5. Integrate verified module into CPU.
6. Execute instruction-level verification.
7. Validate complete processor functionality.

This approach minimizes integration bugs and simplifies debugging.

---

# Module Verification Summary

| Module | Testbench | Waveform | Status |
|---------|-----------|----------|--------|
| Program Counter | ✔ | ✔ | PASS |
| Instruction Memory | ✔ | ✔ | PASS |
| Instruction Decoder | ✔ | ✔ | PASS |
| Immediate Generator | ✔ | ✔ | PASS |
| Main Control Unit | ✔ | ✔ | PASS |
| ALU Control Unit | ✔ | ✔ | PASS |
| Register File | ✔ | ✔ | PASS |
| Operand Multiplexer | ✔ | ✔ | PASS |
| Arithmetic Logic Unit | ✔ | ✔ | PASS |
| Data Memory | ✔ | ✔ | PASS |
| Writeback Multiplexer | ✔ | ✔ | PASS |
| Branch Unit | ✔ | ✔ | PASS |
| Top-Level CPU Integration | ✔ | ✔ | PASS |

---

# Instruction Verification

## R-Type Instructions

Verified Instructions

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

Status

PASS

---

## I-Type Instructions

Verified Instructions

- ADDI
- ANDI
- ORI
- XORI
- SLLI
- SRLI
- SRAI
- SLTI
- SLTIU

Status

PASS

---

## Memory Instructions

Verified Instructions

- LW
- SW

Verification Items

- Address Generation
- Memory Write
- Memory Read
- Writeback Operation

Status

PASS

---

## Branch Instructions

Verified Instruction

- BEQ

Verification Items

- Register Comparison
- Zero Flag Generation
- Branch Decision
- Branch Target Calculation
- Program Counter Update

Status

PASS

---

# Integrated CPU Verification

The complete processor datapath has been verified.

```
Program Counter
      │
      ▼
Instruction Fetch
      │
      ▼
Instruction Decode
      │
      ▼
Immediate Generation
      │
      ▼
Control Unit
      │
      ▼
ALU Control
      │
      ▼
Register File
      │
      ▼
Operand Selection
      │
      ▼
Arithmetic Logic Unit
      │
      ▼
Data Memory
      │
      ▼
Writeback
      │
      ▼
Register File Update
```

Status

PASS

---

# Waveform Verification

Waveforms were analyzed for every major RTL module.

Verified Signals

- Program Counter
- Next Program Counter
- Instruction
- Opcode
- Register Addresses
- Immediate
- Control Signals
- ALU Control
- Register Data
- Operand Selection
- ALU Result
- Zero Flag
- Data Memory
- Writeback Data
- Branch Logic

All observed signal transitions matched the expected RV32I processor behavior.

---

# Functional Coverage

| Feature | Status |
|----------|--------|
| Instruction Fetch | PASS |
| Instruction Decode | PASS |
| Immediate Generation | PASS |
| Register Read | PASS |
| Register Write | PASS |
| Arithmetic Operations | PASS |
| Logical Operations | PASS |
| Shift Operations | PASS |
| Comparison Operations | PASS |
| Load Operations | PASS |
| Store Operations | PASS |
| Branch Operations | PASS |
| Writeback | PASS |
| Complete CPU Integration | PASS |

---

# Verification Statistics

| Item | Result |
|------|--------|
| RTL Modules Verified | 13 |
| CPU Integration | PASS |
| R-Type Instructions | 10 |
| I-Type Instructions | 9 |
| Memory Instructions | 2 |
| Branch Instructions | 1 |
| Total Verified Instructions | **22** |

---

# Simulation Environment

Simulator

- ModelSim

Language

- SystemVerilog

Verification Method

- Directed Verification

Waveform Analysis

- ModelSim Wave Viewer

---

# Verification Result

All RTL modules have successfully passed standalone verification.

The complete AstraRV single-cycle processor successfully executes every currently implemented RV32I instruction.

## Final Verification Status

# ✅ PASS

**AstraRV v1.0 is functionally verified and considered a stable release.**