module astrarv_imem #(
    parameter XLEN  = 32,
    parameter DEPTH = 256
)(
    input  logic [XLEN-1:0] i_addr,
    output logic [31:0]     o_instr
);

logic [31:0] memory [0:DEPTH-1];

initial begin

    //----------------------------------------------------------
    // I-Type Instruction Verification Program
    //----------------------------------------------------------

    // x1 = 5
    memory[0] = 32'h00500093;     // addi  x1,x0,5

    // x2 = 10
    memory[1] = 32'h00A00113;     // addi  x2,x0,10

    // x3 = x1 & 3 = 1
    memory[2] = 32'h0030F193;     // andi  x3,x1,3

    // x4 = x1 | 8 = 13
    memory[3] = 32'h0080E213;     // ori   x4,x1,8

    // x5 = x2 ^ 15 = 5
    memory[4] = 32'h00F14293;     // xori  x5,x2,15

    // x6 = x1 << 2 = 20
    memory[5] = 32'h00209313;     // slli  x6,x1,2

    // x7 = x6 >> 2 = 5
    memory[6] = 32'h00235393;     // srli  x7,x6,2

    // x8 = x6 >>> 2 = 5
    memory[7] = 32'h40235413;     // srai  x8,x6,2

    // x9 = (5 < 10) = 1
    memory[8] = 32'h00A0A493;     // slti  x9,x1,10

    // x10 = (5 < 10) = 1
    memory[9] = 32'h00A0B513;     // sltiu x10,x1,10

    // End of Program
    memory[10] = 32'h00000013;    // nop

end

assign o_instr = memory[i_addr[9:2]];

endmodule