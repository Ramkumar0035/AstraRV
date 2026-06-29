Module: astrarv_branch_unit

Purpose:
Determines the next Program Counter based on branch control and ALU zero flag.

Verification:
• branch=0, zero=0 → next_pc = pc + 4
• branch=1, zero=0 → next_pc = pc + 4
• branch=1, zero=1 → next_pc = pc + immediate

Status:
PASS