module astrarv_alu #(
    parameter XLEN = 32
)(
    input  logic [XLEN-1:0] i_operand_a,
    input  logic [XLEN-1:0] i_operand_b,
    input  logic [3:0]      i_alu_ctrl,

    output logic [XLEN-1:0] o_result,
    output logic            o_zero
);

always_comb begin

    unique case(i_alu_ctrl)

        4'b0000: o_result = i_operand_a + i_operand_b;                       // ADD
        4'b0001: o_result = i_operand_a - i_operand_b;                       // SUB
        4'b0010: o_result = i_operand_a & i_operand_b;                       // AND
        4'b0011: o_result = i_operand_a | i_operand_b;                       // OR
        4'b0100: o_result = i_operand_a ^ i_operand_b;                       // XOR
        4'b0101: o_result = i_operand_a << i_operand_b[4:0];                 // SLL
        4'b0110: o_result = i_operand_a >> i_operand_b[4:0];                 // SRL
        4'b0111: o_result = $signed(i_operand_a) >>> i_operand_b[4:0];       // SRA
        4'b1000: o_result = ($signed(i_operand_a) < $signed(i_operand_b));   // SLT
        4'b1001: o_result = (i_operand_a < i_operand_b);                     // SLTU

        default: o_result = '0;

    endcase

end

assign o_zero = (o_result == 0);

endmodule