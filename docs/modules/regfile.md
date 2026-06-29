# Register File

## Status

✅ Completed

## Description

The Register File implements the general-purpose register storage of the AstraRV processor. It contains 32 registers, each 32 bits wide, following the RV32I specification.

The module provides:

* Two asynchronous read ports
* One synchronous write port
* Register x0 permanently hardwired to zero

## Interface

### Inputs

* `clk_i`
* `rst_ni`
* `i_we`
* `i_rs1_addr`
* `i_rs2_addr`
* `i_rd_addr`
* `i_rd_data`

### Outputs

* `o_rs1_data`
* `o_rs2_data`

## Features

* 32 × 32-bit register array
* Asynchronous read
* Synchronous write
* Write protection for register x0
* Parameterized data width

## Verification

The following tests were successfully completed:

* Reset verification
* Write to x1
* Write to x2
* Read from x1
* Read from x2
* Attempted write to x0 (verified x0 remains zero)

## Result

Simulation completed successfully in ModelSim Intel FPGA Starter Edition 2021.1.

The Register File behaves according to the RV32I specification.
