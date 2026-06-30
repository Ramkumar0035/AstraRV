module astrarv_alu_control(

    input logic [1:0] i_alu_op,
    input logic [2:0] i_funct3,
    input logic [6:0] i_funct7,

    output logic [3:0] o_alu_ctrl

);

always_comb begin

    //---------------------------------------
    // Default
    //---------------------------------------

    o_alu_ctrl = 4'b0000;

    unique case(i_alu_op)

        //---------------------------------------
        // LW / SW
        //---------------------------------------

        2'b00:
            o_alu_ctrl = 4'b0000;

        //---------------------------------------
        // BEQ
        //---------------------------------------

        2'b01:
            o_alu_ctrl = 4'b0001;

        //---------------------------------------
        // R-Type
        //---------------------------------------

        2'b10: begin

            unique case(i_funct3)

                3'b000:
                    if(i_funct7 == 7'b0100000)
                        o_alu_ctrl = 4'b0001;
                    else
                        o_alu_ctrl = 4'b0000;

                3'b111: o_alu_ctrl = 4'b0010;

                3'b110: o_alu_ctrl = 4'b0011;

                3'b100: o_alu_ctrl = 4'b0100;

                3'b001: o_alu_ctrl = 4'b0101;

                3'b101:
                    if(i_funct7 == 7'b0100000)
                        o_alu_ctrl = 4'b0111;
                    else
                        o_alu_ctrl = 4'b0110;

                3'b010: o_alu_ctrl = 4'b1000;

                3'b011: o_alu_ctrl = 4'b1001;

                default: o_alu_ctrl = 4'b0000;

            endcase

        end

        //---------------------------------------
        // I-Type ALU
        //---------------------------------------

        2'b11: begin

            unique case(i_funct3)

                // ADDI
                3'b000:
                    o_alu_ctrl = 4'b0000;

                // SLLI
                3'b001:
                    o_alu_ctrl = 4'b0101;

                // SLTI
                3'b010:
                    o_alu_ctrl = 4'b1000;

                // SLTIU
                3'b011:
                    o_alu_ctrl = 4'b1001;

                // XORI
                3'b100:
                    o_alu_ctrl = 4'b0100;

                // SRLI / SRAI
                3'b101:
                    if(i_funct7 == 7'b0100000)
                        o_alu_ctrl = 4'b0111;
                    else
                        o_alu_ctrl = 4'b0110;

                // ORI
                3'b110:
                    o_alu_ctrl = 4'b0011;

                // ANDI
                3'b111:
                    o_alu_ctrl = 4'b0010;

                default:
                    o_alu_ctrl = 4'b0000;

            endcase

        end

        default:
            o_alu_ctrl = 4'b0000;

    endcase

end

endmodule