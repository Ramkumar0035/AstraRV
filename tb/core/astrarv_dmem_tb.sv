module astrarv_dmem_tb;

logic clk;
logic mem_read;
logic mem_write;
logic [31:0] addr;
logic [31:0] write_data;
logic [31:0] read_data;

astrarv_dmem dut(
    .clk_i(clk),
    .i_mem_read(mem_read),
    .i_mem_write(mem_write),
    .i_addr(addr),
    .i_write_data(write_data),
    .o_read_data(read_data)
);

always #5 clk = ~clk;

initial begin

    clk = 0;
    mem_read = 0;
    mem_write = 0;
    addr = 0;
    write_data = 0;

    #10;

    addr = 32'h00000004;
    write_data = 32'h12345678;
    mem_write = 1;

    #10;

    mem_write = 0;
    mem_read = 1;

    #10;

    $stop;

end

endmodule