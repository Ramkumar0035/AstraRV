module astrarv_writeback_mux_tb;

logic [31:0] alu_result;
logic [31:0] mem_data;
logic mem_to_reg;

logic [31:0] write_data;

astrarv_writeback_mux dut(

    .i_alu_result(alu_result),
    .i_mem_data(mem_data),

    .i_mem_to_reg(mem_to_reg),

    .o_write_data(write_data)

);

initial begin

    alu_result = 32'h11111111;
    mem_data   = 32'hAAAAAAAA;

    mem_to_reg = 0;

    #10;

    mem_to_reg = 1;

    #10;

    $stop;

end

endmodule