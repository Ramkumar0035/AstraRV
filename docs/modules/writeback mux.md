Module: astrarv_writeback_mux

Purpose:
Selects the value to be written back into the register file.

Verification:
• mem_to_reg = 0 → write_data = ALU Result (0x11111111)
• mem_to_reg = 1 → write_data = Memory Data (0xAAAAAAAA)

Status:
PASS