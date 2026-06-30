# Instruction Fetch Unit

## Status

✅ Completed

## Description

The Instruction Fetch Unit (IFU) combines the Program Counter and Instruction Memory to fetch instructions sequentially.

## Features

- Sequential instruction fetch
- Automatic PC increment by 4
- Combinational instruction read
- Modular design using PC and IMEM

## Verification

Verified sequential instruction fetch:

| PC | Instruction |
|----|-------------|
| 0x00000000 | 0x00500093 |
| 0x00000004 | 0x00A00113 |
| 0x00000008 | 0x002081B3 |
| 0x0000000C | 0x00000013 |

Simulation completed successfully.