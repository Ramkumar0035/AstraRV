module astrarv_ifu #(
    parameter XLEN = 32
)(
    input  logic             clk_i,
    input  logic             rst_ni,
    input  logic             i_enable,

    output logic [XLEN-1:0]  o_pc,
    output logic [31:0]      o_instr
);

logic [XLEN-1:0] next_pc;

//-------------------------------------
// Next PC Logic
//-------------------------------------

assign next_pc = o_pc + 32'd4;

//-------------------------------------
// Program Counter
//-------------------------------------

astrarv_pc pc_inst (

    .clk_i(clk_i),
    .rst_ni(rst_ni),
    .i_enable(i_enable),
    .i_next_pc(next_pc),
    .o_pc(o_pc)

);

//-------------------------------------
// Instruction Memory
//-------------------------------------

astrarv_imem imem_inst (

    .i_addr(o_pc),
    .o_instr(o_instr)

);

endmodule