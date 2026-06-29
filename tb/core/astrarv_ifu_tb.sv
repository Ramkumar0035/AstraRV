`timescale 1ns/1ps

module astrarv_ifu_tb;

logic clk;
logic rst_n;
logic enable;

logic [31:0] pc;
logic [31:0] instr;

astrarv_ifu dut(

    .clk_i(clk),
    .rst_ni(rst_n),
    .i_enable(enable),

    .o_pc(pc),
    .o_instr(instr)

);

always #5 clk = ~clk;

initial begin

    clk = 0;
    rst_n = 0;
    enable = 0;

    #20;

    rst_n = 1;
    enable = 1;

    repeat(5)
        #10;

    $finish;

end

endmodule