`timescale 1ns/1ps

module astrarv_alu_control_tb;

logic [1:0] alu_op;
logic [2:0] funct3;
logic [6:0] funct7;

logic [3:0] alu_ctrl;

astrarv_alu_control dut(

.i_alu_op(alu_op),
.i_funct3(funct3),
.i_funct7(funct7),

.o_alu_ctrl(alu_ctrl)

);

initial begin

// ADD

alu_op=2'b10;
funct3=3'b000;
funct7=7'b0000000;

#10;
assert(alu_ctrl==4'b0000);

// SUB

funct7=7'b0100000;

#10;
assert(alu_ctrl==4'b0001);

// AND

funct3=3'b111;
funct7=7'b0000000;

#10;
assert(alu_ctrl==4'b0010);

// OR

funct3=3'b110;

#10;
assert(alu_ctrl==4'b0011);

// XOR

funct3=3'b100;

#10;
assert(alu_ctrl==4'b0100);

// SLL

funct3=3'b001;

#10;
assert(alu_ctrl==4'b0101);

// SRL

funct3=3'b101;
funct7=7'b0000000;

#10;
assert(alu_ctrl==4'b0110);

// SRA

funct7=7'b0100000;

#10;
assert(alu_ctrl==4'b0111);

// SLT

funct3=3'b010;
funct7=7'b0000000;

#10;
assert(alu_ctrl==4'b1000);

// SLTU

funct3=3'b011;

#10;
assert(alu_ctrl==4'b1001);

$display("PASS : ALU Control");

$finish;

end

endmodule