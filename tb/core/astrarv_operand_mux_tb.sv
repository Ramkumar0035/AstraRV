`timescale 1ns/1ps

module astrarv_operand_mux_tb;

logic [31:0] rs2;
logic [31:0] imm;
logic alu_src;

logic [31:0] operand_b;

astrarv_operand_mux dut(

.i_rs2_data(rs2),
.i_imm(imm),
.i_alu_src(alu_src),

.o_operand_b(operand_b)

);

initial begin

rs2 = 32'd20;
imm = 32'd5;

alu_src = 0;

#10;

assert(operand_b==20);

alu_src = 1;

#10;

assert(operand_b==5);

$display("--------------------------------");
$display("PASS : Operand MUX");
$display("--------------------------------");

$finish;

end

endmodule