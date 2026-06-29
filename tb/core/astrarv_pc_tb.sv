`timescale 1ns/1ps

module astrarv_pc_tb;

logic clk;
logic rst_n;
logic enable;
logic [31:0] next_pc;
logic [31:0] pc;

astrarv_pc dut(
    .clk_i(clk),
    .rst_ni(rst_n),
    .i_enable(enable),
    .i_next_pc(next_pc),
    .o_pc(pc)
);

// Clock Generation
always #5 clk = ~clk;

initial begin

    clk = 0;
    rst_n = 0;
    enable = 0;
    next_pc = 32'h0;

    // Reset
    #20;
    rst_n = 1;

    // Load first address
    enable = 1;
    next_pc = 32'h00000004;

    #10;

    next_pc = 32'h00000008;

    #10;

    next_pc = 32'h0000000C;

    #10;

    enable = 0;

    next_pc = 32'h00000010;

    #20;

    $finish;

end

endmodule