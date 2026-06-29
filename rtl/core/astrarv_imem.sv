module astrarv_imem #(
    parameter XLEN = 32,
    parameter DEPTH = 256
)(
    input  logic [XLEN-1:0] i_addr,
    output logic [31:0]     o_instr
);

logic [31:0] memory [0:DEPTH-1];

initial begin

    // Demo Program

    memory[0] = 32'h00500093; // addi x1,x0,5

    memory[1] = 32'h00A00113; // addi x2,x0,10

    memory[2] = 32'h002081B3; // add x3,x1,x2

    memory[3] = 32'h00000013; // nop

end

always_comb begin

    o_instr = memory[i_addr[9:2]];

end

endmodule