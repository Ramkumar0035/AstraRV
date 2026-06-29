`timescale 1ns/1ps

module astrarv_regfile_tb;

logic clk;
logic rst_n;
logic we;

logic [4:0] rs1_addr;
logic [4:0] rs2_addr;
logic [4:0] rd_addr;

logic [31:0] rd_data;

logic [31:0] rs1_data;
logic [31:0] rs2_data;

astrarv_regfile dut(
    .clk_i(clk),
    .rst_ni(rst_n),
    .i_we(we),
    .i_rs1_addr(rs1_addr),
    .i_rs2_addr(rs2_addr),
    .i_rd_addr(rd_addr),
    .i_rd_data(rd_data),
    .o_rs1_data(rs1_data),
    .o_rs2_data(rs2_data)
);

always #5 clk = ~clk;

initial begin

    clk = 0;
    rst_n = 0;
    we = 0;

    rs1_addr = 0;
    rs2_addr = 0;
    rd_addr = 0;
    rd_data = 0;

    #20;
    rst_n = 1;

    // Write x1
    we = 1;
    rd_addr = 5'd1;
    rd_data = 32'h11111111;

    #10;

    // Write x2
    rd_addr = 5'd2;
    rd_data = 32'h22222222;

    #10;

    // Disable write
    we = 0;

    // Read x1 and x2
    rs1_addr = 5'd1;
    rs2_addr = 5'd2;

    #20;

    // Try writing x0
    we = 1;
    rd_addr = 5'd0;
    rd_data = 32'hFFFFFFFF;

    #10;

    rs1_addr = 5'd0;

    #20;

    $finish;

end

endmodule