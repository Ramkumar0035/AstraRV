module astrarv_imm_gen (

    input  logic [31:0] i_instr,

    output logic [31:0] o_imm

);

logic [6:0] opcode;

always_comb begin

    opcode = i_instr[6:0];

    unique case (opcode)

        // I-Type
        7'b0010011,
        7'b0000011,
        7'b1100111:
            o_imm = {{20{i_instr[31]}}, i_instr[31:20]};

        // S-Type
        7'b0100011:
            o_imm = {{20{i_instr[31]}},
                     i_instr[31:25],
                     i_instr[11:7]};

        // B-Type
        7'b1100011:
            o_imm = {{19{i_instr[31]}},
                     i_instr[31],
                     i_instr[7],
                     i_instr[30:25],
                     i_instr[11:8],
                     1'b0};

        // U-Type
        7'b0110111,
        7'b0010111:
            o_imm = {i_instr[31:12],12'b0};

        // J-Type
        7'b1101111:
            o_imm = {{11{i_instr[31]}},
                     i_instr[31],
                     i_instr[19:12],
                     i_instr[20],
                     i_instr[30:21],
                     1'b0};

        default:
            o_imm = 32'h00000000;

    endcase

end

endmodule