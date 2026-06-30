module astrarv_regfile #(
    parameter XLEN = 32,
    parameter REG_COUNT = 32
)(
    input  logic             clk_i,
    input  logic             rst_ni,
    input  logic             i_we,

    input  logic [4:0]       i_rs1_addr,
    input  logic [4:0]       i_rs2_addr,
    input  logic [4:0]       i_rd_addr,

    input  logic [XLEN-1:0]  i_rd_data,

    output logic [XLEN-1:0]  o_rs1_data,
    output logic [XLEN-1:0]  o_rs2_data
);

logic [XLEN-1:0] registers [0:REG_COUNT-1];

integer i;

always_ff @(posedge clk_i) begin

    if(!rst_ni) begin

        for(i=0;i<REG_COUNT;i=i+1)
            registers[i] <= '0;

    end

    else if(i_we && (i_rd_addr != 0))
        registers[i_rd_addr] <= i_rd_data;

end

always_comb begin

    if(i_rs1_addr == 0)
        o_rs1_data = '0;
    else
        o_rs1_data = registers[i_rs1_addr];

    if(i_rs2_addr == 0)
        o_rs2_data = '0;
    else
        o_rs2_data = registers[i_rs2_addr];

end

endmodule