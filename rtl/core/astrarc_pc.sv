//==============================================================================
// Project : AstraRV
// Module  : Program Counter
// File    : astrarv_pc.sv
//
// Description:
// 32-bit Program Counter for the AstraRV processor.
//
// Author  : Ram Kumar B
//==============================================================================

module astrarv_pc #(
    parameter XLEN = 32,
    parameter RESET_PC = 32'h0000_0000
)(
    input  logic             clk_i,
    input  logic             rst_ni,
    input  logic             i_enable,
    input  logic [XLEN-1:0]  i_next_pc,

    output logic [XLEN-1:0]  o_pc
);

always_ff @(posedge clk_i) begin

    if (!rst_ni)
        o_pc <= RESET_PC;

    else if (i_enable)
        o_pc <= i_next_pc;

end

endmodule