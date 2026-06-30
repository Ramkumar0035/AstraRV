# AstraRV Architecture

# Overview

AstraRV is a 32-bit RV32I Single-Cycle RISC-V Processor developed entirely in SystemVerilog.

The processor executes one instruction per clock cycle by performing instruction fetch, decode, execute, memory access, and writeback within a single clock period.

The design follows a modular RTL methodology where each functional block is implemented, verified independently, and then integrated into the complete CPU datapath.

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

# Top-Level Architecture

```
                    +----------------+
                    | Program Counter|
                    +-------+--------+
                            |
                            v
                  +--------------------+
                  | Instruction Memory |
                  +---------+----------+
                            |
                            v
                  +--------------------+
                  | Instruction Decoder|
                  +---------+----------+
                            |
            +---------------+----------------+
            |                                |
            v                                v
   Immediate Generator                Control Unit
                                              |
                                        ALU Control
                                              |
                +-----------------------------+
                |
                v
          +-------------+
          | Register File|
          +------+------+
                 |
         +-------+-------+
         |               |
         v               |
     Operand A      Operand MUX
                         |
              Register / Immediate
                         |
                         v
                   +-----------+
                   |    ALU    |
                   +-----+-----+
                         |
               +---------+----------+
               |                    |
               v                    v
          Data Memory        Writeback MUX
               |                    |
               +---------+----------+
                         |
                         v
                  Register File
```

---

# Datapath Flow

Each instruction is executed using the following sequence.

1. Program Counter generates the instruction address.
2. Instruction Memory fetches the instruction.
3. Instruction Decoder extracts instruction fields.
4. Immediate Generator produces the required immediate value.
5. Main Control Unit generates processor control signals.
6. ALU Control generates the ALU operation.
7. Register File reads source operands.
8. Operand Multiplexer selects Register or Immediate operand.
9. ALU performs arithmetic or logical operation.
10. Data Memory performs load/store operations when required.
11. Writeback Multiplexer selects ALU or Memory result.
12. Register File writes the destination register.
13. Branch Unit computes the next Program Counter.

---

# RTL Modules

| Module | Description |
|---------|-------------|
| astrarv_pc | Program Counter |
| astrarv_imem | Instruction Memory |
| astrarv_decoder | Instruction Decoder |
| astrarv_imm_gen | Immediate Generator |
| astrarv_control | Main Control Unit |
| astrarv_alu_control | ALU Control Unit |
| astrarv_regfile | Register File |
| astrarv_operand_mux | Operand Multiplexer |
| astrarv_alu | Arithmetic Logic Unit |
| astrarv_dmem | Data Memory |
| astrarv_writeback_mux | Writeback Multiplexer |
| astrarv_branch_unit | Branch Decision Logic |
| astrarv_single_cycle_cpu | Top-Level CPU |

---

# Implemented Instruction Groups

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

# Control Signals

| Signal | Function |
|---------|----------|
| RegWrite | Enables Register File write |
| MemRead | Enables Data Memory read |
| MemWrite | Enables Data Memory write |
| MemToReg | Selects Memory data for writeback |
| ALUSrc | Selects Register/Immediate operand |
| Branch | Enables Branch Unit |
| ALUOp | Selects ALU operation group |

---

# Current Verification Status

| Module | Status |
|---------|--------|
| Program Counter | PASS |
| Instruction Memory | PASS |
| Decoder | PASS |
| Immediate Generator | PASS |
| Main Control | PASS |
| ALU Control | PASS |
| Register File | PASS |
| Operand MUX | PASS |
| ALU | PASS |
| Data Memory | PASS |
| Writeback MUX | PASS |
| Branch Unit | PASS |
| Complete CPU | PASS |

---

# Design Methodology

The processor was developed using an incremental RTL methodology.

1. Design individual RTL modules.
2. Verify each module using dedicated SystemVerilog testbenches.
3. Integrate modules progressively.
4. Verify integrated datapath functionality.
5. Validate complete instruction execution using ModelSim waveforms.

This approach simplifies debugging while ensuring functional correctness at every stage of development.

---

# Future Work

- Complete remaining RV32I instructions.
- Implement JAL and JALR.
- Add remaining branch instructions.
- Develop a 5-stage pipelined processor.
- Build a UVM-based verification environment.
- Perform FPGA implementation and timing analysis.