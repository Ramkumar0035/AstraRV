# AstraRV Verification Report

# Overview

The AstraRV processor has been verified using a combination of dedicated module-level testbenches and a complete CPU integration testbench.

Functional verification was performed using **ModelSim**, where every RTL module was validated independently before being integrated into the complete single-cycle processor.

---

# Verification Methodology

The verification flow follows an incremental approach.

1. Develop RTL module.
2. Create dedicated SystemVerilog testbench.
3. Verify functionality using simulation.
4. Inspect ModelSim waveforms.
5. Integrate verified module into CPU.
6. Perform full CPU verification.

This methodology reduces debugging complexity and improves design reliability.

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
| ALU | ✔ | ✔ | PASS |
| Data Memory | ✔ | ✔ | PASS |
| Writeback Multiplexer | ✔ | ✔ | PASS |
| Branch Unit | ✔ | ✔ | PASS |

---

# CPU Integration Verification

The complete processor was verified using an integrated SystemVerilog testbench.

The following instruction groups were executed and verified.

---

## Arithmetic Instructions

### ADDI

Purpose

- Immediate addition
- Register writeback

Expected Result

```
x1 = Immediate Value
```

Status

PASS

---

### R-Type Operations

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

Expected Result

Correct ALU result written into destination register.

Status

PASS

---

## Memory Instructions

Verified Instructions

- LW
- SW

Verification Items

- Address generation
- Memory write
- Memory read
- Writeback MUX
- Register update

Status

PASS

---

## Branch Instructions

Verified Instruction

- BEQ

Verification Items

- Register comparison
- Zero flag generation
- Branch decision
- Program Counter update
- Branch target calculation

Status

PASS

---

# Integrated CPU Verification

The following datapath was verified.

```
PC
↓

Instruction Fetch
↓

Instruction Decode
↓

Immediate Generation
↓

Control Unit
↓

Register File
↓

Operand Selection
↓

ALU Execution
↓

Data Memory
↓

Writeback
↓

Register File Update
```

Status

PASS

---

# Waveform Verification

Waveforms were inspected for every major RTL module.

Verified signals include

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

All waveform transitions matched the expected processor behavior.

---

# Functional Verification Coverage

| Feature | Status |
|----------|--------|
| Instruction Fetch | PASS |
| Instruction Decode | PASS |
| Immediate Generation | PASS |
| Register Read | PASS |
| Register Write | PASS |
| Arithmetic Execution | PASS |
| Logical Execution | PASS |
| Shift Operations | PASS |
| Comparison Operations | PASS |
| Load Operation | PASS |
| Store Operation | PASS |
| Branch Operation | PASS |
| Writeback | PASS |

---

# Simulation Environment

Simulator

- ModelSim

Language

- SystemVerilog

Verification Style

- Directed Testbench

Waveform Analysis

- ModelSim Wave Viewer

---

# Verification Result

All implemented RTL modules successfully passed functional verification.

The complete single-cycle processor executes the currently implemented RV32I instruction subset correctly.

Overall Verification Status

PASS