# AstraRV CPU Design

## Overview

AstraRV is a **32-bit RV32I single-cycle RISC-V processor** developed entirely in **SystemVerilog**. The objective is to design the processor from the ground up while following an industrial RTL development methodology. Every module is designed, verified independently using dedicated testbenches, and then progressively integrated into the processor datapath.

---

# Processor Specifications

| Item              | Value         |
| ----------------- | ------------- |
| ISA               | RV32I         |
| Architecture      | Single Cycle  |
| Data Width        | 32-bit        |
| Instruction Width | 32-bit        |
| RTL Language      | SystemVerilog |
| Verification      | ModelSim      |
| Target FPGA       | Intel FPGA    |

---

# Development Progress

## ✔ Program Counter

### Description

Maintains the current instruction address and updates it every clock cycle.

### Verification

* Reset functionality verified
* Sequential PC increment verified
* Continuous instruction fetch verified

**Status:** Completed

---

## ✔ Instruction Memory

### Description

Stores the processor instruction memory and provides instructions based on the current program counter.

### Verification

* Address decoding verified
* Instruction fetch verified
* Sequential instruction execution verified

**Status:** Completed

---

## ✔ Instruction Decoder

### Description

Decodes every fetched instruction into its individual instruction fields.

### Outputs

* opcode
* rd
* rs1
* rs2
* funct3
* funct7

### Verification

* All instruction fields extracted correctly
* Verified using multiple RV32I instructions

**Status:** Completed

---

## ✔ Immediate Generator

### Description

Generates sign-extended immediate values for every RV32I instruction format.

### Supported Formats

* I-Type
* S-Type
* B-Type
* U-Type
* J-Type

### Verification

* Positive immediates verified
* Negative immediates verified
* Sign extension verified

**Status:** Completed

---

## ✔ Main Control Unit

### Description

Generates processor control signals based on instruction opcode.

### Generated Signals

* RegWrite
* MemRead
* MemWrite
* MemToReg
* ALUSrc
* Branch
* ALUOp

### Verification

Verified against:

* R-Type
* I-Type
* Load
* Store
* Branch

**Status:** Completed

---

## ✔ ALU Control Unit

### Description

Generates ALU control signals using:

* ALUOp
* funct3
* funct7

### Supported Operations

* ADD
* SUB
* AND
* OR
* XOR
* SLL
* SRL
* SRA
* SLT
* SLTU

### Verification

Verified using all supported ALU operations.

**Status:** Completed

---

## ✔ Register File

### Description

Implements a **32 × 32-bit** register file.

### Features

* Dual Read Ports
* Single Write Port
* Synchronous Write
* Combinational Read
* x0 hardwired to zero

### Verification

* Register write verified
* Register read verified
* x0 immutability verified

**Status:** Completed

---

## ✔ Operand Multiplexer

### Description

Selects the second ALU operand.

### Sources

* Register Data (rs2)
* Immediate Value

### Verification

Verified correct operand selection for:

* Register-register instructions
* Register-immediate instructions

**Status:** Completed

---

## ✔ Arithmetic Logic Unit (ALU)

### Description

Performs arithmetic and logical operations required by RV32I instructions.

### Supported Operations

* ADD
* SUB
* AND
* OR
* XOR
* SLL
* SRL
* SRA
* SLT
* SLTU

### Outputs

* Result
* Zero Flag

### Verification

Verified using dedicated ALU testbench for every supported operation.

**Status:** Completed

---

## ✔ Temporary Writeback Path

### Description

A temporary writeback path has been integrated to validate the complete arithmetic datapath before integrating the memory subsystem.

Currently, the ALU result is directly connected to the Register File write port.

### Purpose

* Enables complete execution of arithmetic instructions
* Allows end-to-end datapath verification
* Simplifies early processor integration
* Will later be replaced by the final Writeback Multiplexer

### Verification

Verified successful execution of:

* ADDI
* ADD

with ALU results written back into the Register File.

**Status:** Completed

---

# Current Integrated Datapath

```text
                      +----------------+
                      | Program Counter|
                      +-------+--------+
                              |
                              v
                  +----------------------+
                  |  Instruction Memory  |
                  +----------+-----------+
                             |
                             v
                  +----------------------+
                  | Instruction Decoder  |
                  +----------+-----------+
                             |
               +-------------+-------------+
               |                           |
               v                           v
      +----------------+          +------------------+
      | Immediate Gen  |          |  Control Unit    |
      +----------------+          +---------+--------+
                                            |
                                            |
                                  +---------v---------+
                                  |   ALU Control     |
                                  +---------+---------+
                                            |
                                            |
                   +------------------------+----------------------+
                   |                                               |
                   v                                               |
           +---------------+                                       |
           | Register File |<----------- Temporary Writeback -------+
           +-------+-------+
                   |
          +--------+--------+
          |                 |
          |                 |
          v                 v
     Operand A        Operand MUX
                            |
                     Register / Immediate
                            |
                            v
                      +-------------+
                      |     ALU     |
                      +------+------+ 
                             |
                             |
                         ALU Result
```

---

# Current Integration Flow

The processor currently executes the following datapath:

```
PC
 ↓
Instruction Memory
 ↓
Instruction Decoder
 ↓
Immediate Generator
 ↓
Control Unit
 ↓
ALU Control
 ↓
Register File
 ↓
Operand Multiplexer
 ↓
ALU
 ↓
Temporary Writeback
 ↓
Register File
```

---

# Integration Status

| Module                   | Status |
| ------------------------ | ------ |
| Program Counter          | ✔      |
| Instruction Memory       | ✔      |
| Instruction Decoder      | ✔      |
| Immediate Generator      | ✔      |
| Main Control Unit        | ✔      |
| ALU Control Unit         | ✔      |
| Register File            | ✔      |
| Operand Multiplexer      | ✔      |
| Arithmetic Logic Unit    | ✔      |
| Temporary Writeback Path | ✔      |
| Data Memory              | ⏳      |
| Writeback Multiplexer    | ⏳      |
| Branch Unit              | ⏳      |
| PC Selection Logic       | ⏳      |

---

# Verification Strategy

Every RTL module is verified independently using dedicated SystemVerilog testbenches before integration.

After successful standalone verification, modules are progressively integrated into the processor datapath.

Integrated simulations are performed using **ModelSim**, where waveforms are inspected to validate:

* Instruction Fetch
* Instruction Decode
* Immediate Generation
* Control Signal Generation
* Register File Read/Write
* Operand Selection
* ALU Execution
* Temporary Writeback Path

This incremental verification methodology simplifies debugging and ensures correctness at every integration stage.

---

# Current Capabilities

The processor is currently capable of:

* Sequential instruction fetch
* Instruction decoding
* Immediate generation
* Control signal generation
* Register file read/write
* Operand selection
* Arithmetic and logical execution
* Temporary ALU result writeback

The complete arithmetic datapath has been successfully integrated and verified.

---

# Next Milestone

The remaining processor components will be integrated in the following order:

1. Data Memory
2. Writeback Multiplexer
3. Memory Stage Integration
4. Branch Unit
5. PC Selection Logic
6. Complete RV32I Single-Cycle Processor
7. Full Instruction-Level Verification

---

# Current Project Completion

| Stage                           | Progress      |
| ------------------------------- | ------------- |
| Independent RTL Modules         | ✔ Completed   |
| Arithmetic Datapath Integration | ✔ Completed   |
| Memory Subsystem                | ⏳ Pending     |
| Branching Logic                 | ⏳ Pending     |
| Complete Single-Cycle CPU       | ⏳ In Progress |

**Overall Progress:** **~75% Complete**
