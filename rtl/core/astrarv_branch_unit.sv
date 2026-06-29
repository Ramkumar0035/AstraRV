module astrarv_branch_unit(

    input logic        i_branch,
    input logic        i_zero,

    input logic [31:0] i_pc,
    input logic [31:0] i_imm,

    output logic [31:0] o_next_pc

);

always_comb begin

    if(i_branch && i_zero)
        o_next_pc = i_pc + i_imm;
    else
        o_next_pc = i_pc + 32'd4;

end

endmodule