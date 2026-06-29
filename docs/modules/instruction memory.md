# Instruction Memory

## Status

✅ Completed

## Description

The Instruction Memory stores the program executed by the AstraRV processor.

This version is implemented as a simple ROM initialized with a small demonstration program.

## Features

* 256 x 32-bit memory
* Combinational instruction read
* Word-aligned addressing
* Parameterized depth

## Verification

Verified instruction fetch from addresses:

* 0x00000000
* 0x00000004
* 0x00000008
* 0x0000000C

Simulation passed successfully.
