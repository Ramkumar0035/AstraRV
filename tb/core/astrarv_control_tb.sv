`timescale 1ns/1ps

module astrarv_control_tb;

logic [6:0] opcode;

logic reg_write;
logic mem_read;
logic mem_write;
logic mem_to_reg;
logic alu_src;
logic branch;
logic [1:0] alu_op;

astrarv_control dut(

.i_opcode(opcode),

.o_reg_write(reg_write),
.o_mem_read(mem_read),
.o_mem_write(mem_write),
.o_mem_to_reg(mem_to_reg),
.o_alu_src(alu_src),
.o_branch(branch),
.o_alu_op(alu_op)

);

initial begin

// R-Type

opcode=7'b0110011;

#10;

assert(reg_write);
assert(!alu_src);
assert(alu_op==2'b10);

// ADDI

opcode=7'b0010011;

#10;

assert(reg_write);
assert(alu_src);
assert(alu_op==2'b00);

// LW

opcode=7'b0000011;

#10;

assert(mem_read);
assert(mem_to_reg);
assert(reg_write);

// SW

opcode=7'b0100011;

#10;

assert(mem_write);

// BEQ

opcode=7'b1100011;

#10;

assert(branch);
assert(alu_op==2'b01);

$display("PASS : Main Control");

$finish;

end

endmodule