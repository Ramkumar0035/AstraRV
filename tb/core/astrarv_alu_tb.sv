`timescale 1ns/1ps

module astrarv_alu_tb;

logic [31:0] a;
logic [31:0] b;
logic [3:0] ctrl;

logic [31:0] result;
logic zero;

astrarv_alu dut(
    .i_operand_a(a),
    .i_operand_b(b),
    .i_alu_ctrl(ctrl),
    .o_result(result),
    .o_zero(zero)
);

initial begin

    //---------------- ADD ----------------

    a = 10;
    b = 20;
    ctrl = 4'b0000;

    #10;
    assert(result == 30);

    //---------------- SUB ----------------

    ctrl = 4'b0001;

    #10;
    assert(result == 32'hFFFFFFF6);

    //---------------- AND ----------------

    a = 32'hF0;
    b = 32'hCC;
    ctrl = 4'b0010;

    #10;
    assert(result == 32'hC0);

    //---------------- OR ----------------

    ctrl = 4'b0011;

    #10;
    assert(result == 32'hFC);

    //---------------- XOR ----------------

    ctrl = 4'b0100;

    #10;
    assert(result == 32'h3C);

    //---------------- SLL ----------------

    a = 1;
    b = 3;
    ctrl = 4'b0101;

    #10;
    assert(result == 8);

    //---------------- SRL ----------------

    a = 32'h10;
    b = 2;
    ctrl = 4'b0110;

    #10;
    assert(result == 4);

    //---------------- SRA ----------------

    a = 32'hFFFFFFF0;
    b = 2;
    ctrl = 4'b0111;

    #10;
    assert(result == 32'hFFFFFFFC);

    //---------------- SLT ----------------

    a = -5;
    b = 3;
    ctrl = 4'b1000;

    #10;
    assert(result == 1);

    //---------------- SLTU ----------------

    a = 5;
    b = 10;
    ctrl = 4'b1001;

    #10;
    assert(result == 1);

    $display("--------------------------------");
    $display("PASS : ALU");
    $display("--------------------------------");

    $finish;

end

endmodule