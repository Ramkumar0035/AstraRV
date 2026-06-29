module astrarv_single_cycle_cpu #(
    parameter XLEN = 32
)(
    input logic i_clk,
    input logic i_rst_n
);

    //---------------------------------------
    // Program Counter Signals
    //---------------------------------------
    logic [XLEN-1:0] pc;
    logic [XLEN-1:0] next_pc;

    //---------------------------------------
    // Instruction Fetch Signals
    //---------------------------------------
    logic [31:0] instruction;

    //---------------------------------------
    // Program Counter
    //---------------------------------------
    astrarv_pc #(
        .XLEN(XLEN)
    ) u_pc (
        .clk_i    (i_clk),
        .rst_ni   (i_rst_n),
        .i_enable (1'b1),
        .i_next_pc(next_pc),
        .o_pc     (pc)
    );

    //---------------------------------------
    // Instruction Memory
    //---------------------------------------
    astrarv_imem u_imem (
        .i_addr (pc),
        .o_instr(instruction)
    );

    //---------------------------------------
    // Next PC Logic
    //---------------------------------------
    assign next_pc = pc + 32'd4;

endmodule