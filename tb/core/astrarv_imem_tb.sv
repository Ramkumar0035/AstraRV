`timescale 1ns/1ps

module astrarv_imem_tb;

logic [31:0] addr;
logic [31:0] instr;

astrarv_imem dut(
    .i_addr(addr),
    .o_instr(instr)
);

initial begin

    addr = 32'd0;
    #10;

    assert(instr == 32'h00500093)
        else $fatal("Instruction 0 mismatch");

    addr = 32'd4;
    #10;

    assert(instr == 32'h00A00113)
        else $fatal("Instruction 1 mismatch");

    addr = 32'd8;
    #10;

    assert(instr == 32'h002081B3)
        else $fatal("Instruction 2 mismatch");

    addr = 32'd12;
    #10;

    assert(instr == 32'h00000013)
        else $fatal("Instruction 3 mismatch");

    $display("PASS: Instruction Memory");

    $finish;

end

endmodule