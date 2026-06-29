module astrarv_writeback_mux(

    input  logic [31:0] i_alu_result,
    input  logic [31:0] i_mem_data,

    input  logic        i_mem_to_reg,

    output logic [31:0] o_write_data

);

always_comb begin

    if(i_mem_to_reg)
        o_write_data = i_mem_data;
    else
        o_write_data = i_alu_result;

end

endmodule