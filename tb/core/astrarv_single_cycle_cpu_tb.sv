`timescale 1ns/1ps

module astrarv_single_cycle_cpu_tb;

logic clk;
logic rst_n;

astrarv_single_cycle_cpu dut(
    .i_clk(clk),
    .i_rst_n(rst_n)
);

always #5 clk = ~clk;

initial begin

    clk = 0;
    rst_n = 0;

    #20;

    rst_n = 1;

    #100;

    $finish;

end

endmodule