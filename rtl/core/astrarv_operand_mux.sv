module astrarv_operand_mux #(
    parameter XLEN = 32
)(
    input  logic [XLEN-1:0] i_rs2_data,
    input  logic [XLEN-1:0] i_imm,
    input  logic            i_alu_src,

    output logic [XLEN-1:0] o_operand_b
);

always_comb begin

    if(i_alu_src)
        o_operand_b = i_imm;
    else
        o_operand_b = i_rs2_data;

end

endmodule