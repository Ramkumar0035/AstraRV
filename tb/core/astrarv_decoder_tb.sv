`timescale 1ns/1ps

module astrarv_decoder_tb;

logic [31:0] instr;

logic [6:0] opcode;
logic [4:0] rd;
logic [2:0] funct3;
logic [4:0] rs1;
logic [4:0] rs2;
logic [6:0] funct7;

astrarv_decoder dut(

    .i_instr(instr),

    .opcode(opcode),
    .rd(rd),
    .funct3(funct3),
    .rs1(rs1),
    .rs2(rs2),
    .funct7(funct7)

);

initial begin

    //-------------------------------------------------
    // addi x1,x0,5
    //-------------------------------------------------

    instr = 32'h00500093;

    #10;

    assert(opcode == 7'b0010011);
    assert(rd == 5'd1);
    assert(funct3 == 3'b000);
    assert(rs1 == 5'd0);
    assert(rs2 == 5'd5);
    assert(funct7 == 7'b0000000);

    //-------------------------------------------------
    // add x3,x1,x2
    //-------------------------------------------------

    instr = 32'h002081B3;

    #10;

    assert(opcode == 7'b0110011);
    assert(rd == 5'd3);
    assert(funct3 == 3'b000);
    assert(rs1 == 5'd1);
    assert(rs2 == 5'd2);
    assert(funct7 == 7'b0000000);

    $display("------------------------------------");
    $display("PASS : Instruction Decoder");
    $display("------------------------------------");

    $finish;

end

endmodule