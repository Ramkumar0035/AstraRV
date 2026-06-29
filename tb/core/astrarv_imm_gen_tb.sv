`timescale 1ns/1ps

module astrarv_imm_gen_tb;

logic [31:0] instr;
logic [31:0] imm;

astrarv_imm_gen dut(

    .i_instr(instr),
    .o_imm(imm)

);

initial begin

    //------------------------------------------------
    // ADDI x1,x0,5
    //------------------------------------------------

    instr = 32'h00500093;

    #10;

    assert(imm == 32'd5)
        else $fatal("I-Type failed");

    //------------------------------------------------
    // ADDI x1,x0,-1
    //------------------------------------------------

    instr = 32'hFFF00093;

    #10;

    assert(imm == 32'hFFFFFFFF)
        else $fatal("Negative immediate failed");

    //------------------------------------------------
    // LUI x1,0x12345
    //------------------------------------------------

    instr = 32'h123450B7;

    #10;

    assert(imm == 32'h12345000)
        else $fatal("U-Type failed");

    $display("--------------------------------");
    $display("PASS : Immediate Generator");
    $display("--------------------------------");

    $finish;

end

endmodule