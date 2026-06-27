# Program Counter (PC)

## Module Overview

The Program Counter (PC) is one of the fundamental sequential components of the AstraRV processor. It stores the address of the current instruction being fetched from instruction memory. During every clock cycle, the PC updates to the next instruction address provided by the Next PC Logic.

The Program Counter itself does not calculate the next address. It only stores the address supplied through the `i_next_pc` input. This separation keeps the module simple, reusable, and scalable for future processor enhancements such as pipelining, branch prediction, interrupts, and exceptions.

---

# Purpose

The primary purpose of the Program Counter is to maintain the current instruction address so that the Instruction Fetch stage always knows which instruction to read from memory.

---

# Functional Requirements

The Program Counter shall satisfy the following requirements:

* Store a 32-bit instruction address.
* Reset to a predefined reset address (`RESET_PC`).
* Update only on the rising edge of the system clock.
* Load the value of `i_next_pc` when `i_enable` is asserted.
* Hold its current value when `i_enable` is deasserted.
* Support future integration with branch, jump, interrupt, and exception logic.

---

# Inputs

| Signal    | Width | Description                    |
| --------- | ----: | ------------------------------ |
| clk_i     |     1 | System clock                   |
| rst_ni    |     1 | Active-low synchronous reset   |
| i_enable  |     1 | Enables Program Counter update |
| i_next_pc |    32 | Next Program Counter value     |

---

# Outputs

| Signal | Width | Description                   |
| ------ | ----: | ----------------------------- |
| o_pc   |    32 | Current Program Counter value |

---

# Functional Behavior

### Reset

When the reset signal is asserted (`rst_ni = 0`), the Program Counter loads the predefined reset address.

```
PC ← RESET_PC
```

---

### Normal Operation

On every rising edge of the clock:

If `i_enable = 1`

```
PC ← i_next_pc
```

Otherwise

```
PC ← PC
```

The Program Counter simply retains its previous value.

---

# Block Diagram

```
                 +-------------------------+
 clk_i --------->|                         |
 rst_ni -------->|                         |
 i_enable ------>|     Program Counter     |-------> o_pc
 i_next_pc ----->|                         |
                 +-------------------------+
```

---

# Timing Behavior

```
Clock Rising Edge

↓

If reset is active

    PC ← RESET_PC

Else if enable is HIGH

    PC ← i_next_pc

Else

    PC retains its previous value
```

---

# Design Decisions

## Why is the Program Counter 32 bits?

AstraRV implements the RV32IM instruction set architecture. Since the processor uses a 32-bit address space, the Program Counter must also be 32 bits wide.

---

## Why doesn't the Program Counter compute PC + 4?

The responsibility of the Program Counter is only to store the current instruction address.

The next instruction address depends on several situations:

* Sequential execution
* Branch instructions
* Jump instructions
* Interrupt handling
* Exception handling

Because of this, another hardware block called the **Next PC Logic** computes the correct address and provides it through `i_next_pc`.

This design improves modularity and simplifies future enhancements.

---

## Why is the Program Counter a sequential circuit?

The Program Counter represents processor state.

Processor state must only change on clock edges to ensure deterministic execution and proper synchronization with the rest of the CPU.

---

# Corner Cases

| Condition           | Expected Behavior                    |
| ------------------- | ------------------------------------ |
| Reset asserted      | Load RESET_PC                        |
| Enable LOW          | Hold current value                   |
| Enable HIGH         | Load i_next_pc                       |
| Consecutive updates | Update every clock cycle             |
| Maximum address     | Store correctly without modification |

---

# Verification Plan

The following tests will be performed.

| Test                   | Purpose                               |
| ---------------------- | ------------------------------------- |
| Reset Test             | Verify reset operation                |
| Enable Test            | Verify update when enabled            |
| Hold Test              | Verify value retention when disabled  |
| Random Address Test    | Verify loading of arbitrary addresses |
| Continuous Update Test | Verify multiple consecutive updates   |

---

# Future Enhancements

The current Program Counter is intentionally simple.

Future versions of AstraRV will integrate it with:

* Branch Target Calculation
* Jump Logic
* Exception Handler
* Interrupt Controller
* Branch Predictor
* Pipeline Flush Logic

No changes to the Program Counter interface are expected when these features are added.

---

# Interview Questions

### Why is the Program Counter incremented by four?

Because RV32IM instructions are 32 bits (4 bytes) wide, and instruction memory is byte-addressable.

---

### Why does the Program Counter receive `i_next_pc` instead of calculating `PC + 4`?

This allows the processor to support branches, jumps, exceptions, and interrupts without modifying the Program Counter module.

---

### Is the Program Counter a combinational or sequential circuit?

It is a sequential circuit because it stores processor state and updates only on clock edges.

---

# Module Status

**Status:** Design Complete

RTL Implementation: Pending

Testbench: Pending

Verification: Pending

Documentation Version: v1.0
