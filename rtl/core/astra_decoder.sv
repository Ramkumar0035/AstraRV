module astrarv_decoder(

    input  logic [31:0] i_instr,

    output logic [6:0] opcode,
    output logic [4:0] rd,
    output logic [2:0] funct3,
    output logic [4:0] rs1,
    output logic [4:0] rs2,
    output logic [6:0] funct7

);

always_comb begin

    opcode = i_instr[6:0];

    rd      = i_instr[11:7];

    funct3  = i_instr[14:12];

    rs1     = i_instr[19:15];

    rs2     = i_instr[24:20];

    funct7  = i_instr[31:25];

end

endmodule