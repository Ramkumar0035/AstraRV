module astrarv_branch_unit_tb;

logic branch;
logic zero;

logic [31:0] pc;
logic [31:0] imm;

logic [31:0] next_pc;

astrarv_branch_unit dut(

    .i_branch(branch),
    .i_zero(zero),

    .i_pc(pc),
    .i_imm(imm),

    .o_next_pc(next_pc)

);

initial begin

    pc  = 32'h20;
    imm = 32'h10;

    // No Branch
    branch = 0;
    zero   = 0;
    #10;

    // Branch requested but comparison failed
    branch = 1;
    zero   = 0;
    #10;

    // Branch Taken
    branch = 1;
    zero   = 1;
    #10;

    $stop;

end

endmodule