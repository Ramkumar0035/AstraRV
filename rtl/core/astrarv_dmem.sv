module astrarv_dmem #(
    parameter XLEN = 32,
    parameter DEPTH = 256
)(
    input  logic             clk_i,
    input  logic             i_mem_read,
    input  logic             i_mem_write,
    input  logic [XLEN-1:0]  i_addr,
    input  logic [XLEN-1:0]  i_write_data,

    output logic [XLEN-1:0]  o_read_data
);

logic [31:0] mem [0:DEPTH-1];

always_ff @(posedge clk_i) begin
    if (i_mem_write)
        mem[i_addr[9:2]] <= i_write_data;
end

always_comb begin
    if (i_mem_read)
        o_read_data = mem[i_addr[9:2]];
    else
        o_read_data = 32'h00000000;
end

endmodule