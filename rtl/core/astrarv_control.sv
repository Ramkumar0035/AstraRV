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

    //---------------------------------------
    // Default Outputs
    //---------------------------------------

    o_reg_write = 1'b0;
    o_mem_read  = 1'b0;
    o_mem_write = 1'b0;
    o_mem_to_reg= 1'b0;
    o_alu_src   = 1'b0;
    o_branch    = 1'b0;
    o_alu_op    = 2'b00;

    unique case(i_opcode)

        //---------------------------------------
        // R-Type
        //---------------------------------------

        7'b0110011: begin

            o_reg_write = 1'b1;
            o_alu_src   = 1'b0;
            o_alu_op    = 2'b10;

        end

        //---------------------------------------
        // I-Type ALU
        //---------------------------------------

        7'b0010011: begin

            o_reg_write = 1'b1;
            o_alu_src   = 1'b1;
            o_alu_op    = 2'b11;

        end

        //---------------------------------------
        // Load
        //---------------------------------------

        7'b0000011: begin

            o_reg_write = 1'b1;
            o_mem_read  = 1'b1;
            o_mem_to_reg= 1'b1;
            o_alu_src   = 1'b1;
            o_alu_op    = 2'b00;

        end

        //---------------------------------------
        // Store
        //---------------------------------------

        7'b0100011: begin

            o_mem_write = 1'b1;
            o_alu_src   = 1'b1;
            o_alu_op    = 2'b00;

        end

        //---------------------------------------
        // Branch
        //---------------------------------------

        7'b1100011: begin

            o_branch = 1'b1;
            o_alu_op = 2'b01;

        end

        default: begin

        end

    endcase

end

endmodule