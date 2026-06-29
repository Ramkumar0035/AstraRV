module astrarv_control(

    input  logic [6:0] i_opcode,

    output logic       o_reg_write,
    output logic       o_mem_read,
    output logic       o_mem_write,
    output logic       o_mem_to_reg,
    output logic       o_alu_src,
    output logic       o_branch,
    output logic [1:0] o_alu_op

);

always_comb begin

    // Defaults

    o_reg_write = 0;
    o_mem_read  = 0;
    o_mem_write = 0;
    o_mem_to_reg= 0;
    o_alu_src   = 0;
    o_branch    = 0;
    o_alu_op    = 2'b00;

    unique case(i_opcode)

        // R-Type

        7'b0110011: begin
            o_reg_write = 1;
            o_alu_src   = 0;
            o_alu_op    = 2'b10;
        end

        // ADDI

        7'b0010011: begin
            o_reg_write = 1;
            o_alu_src   = 1;
            o_alu_op    = 2'b00;
        end

        // LW

        7'b0000011: begin
            o_reg_write = 1;
            o_mem_read  = 1;
            o_mem_to_reg= 1;
            o_alu_src   = 1;
            o_alu_op    = 2'b00;
        end

        // SW

        7'b0100011: begin
            o_mem_write = 1;
            o_alu_src   = 1;
            o_alu_op    = 2'b00;
        end

        // BEQ

        7'b1100011: begin
            o_branch = 1;
            o_alu_op = 2'b01;
        end

    endcase

end

endmodule