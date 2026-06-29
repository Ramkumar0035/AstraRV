module astrarv_single_cycle_cpu #(
    parameter XLEN = 32
)(
    input logic i_clk,
    input logic i_rst_n
);

    //---------------------------------------
    // Program Counter Signals
    //---------------------------------------
    logic [XLEN-1:0] pc;
    logic [XLEN-1:0] next_pc;

    //---------------------------------------
    // Instruction Fetch Signals
    //---------------------------------------
    logic [31:0] instruction;

    //---------------------------------------
// Decoder Signals
//---------------------------------------

logic [6:0] opcode;
logic [4:0] rd;
logic [2:0] funct3;
logic [4:0] rs1;
logic [4:0] rs2;
logic [6:0] funct7;

    //---------------------------------------
    // Program Counter
    //---------------------------------------
    astrarv_pc #(
        .XLEN(XLEN)
    ) u_pc (
        .clk_i    (i_clk),
        .rst_ni   (i_rst_n),
        .i_enable (1'b1),
        .i_next_pc(next_pc),
        .o_pc     (pc)
    );

    //---------------------------------------
    // Instruction Memory
    //---------------------------------------
    astrarv_imem u_imem (
        .i_addr (pc),
        .o_instr(instruction)
    );

    //---------------------------------------
    // Next PC Logic
    //---------------------------------------
    assign next_pc = pc + 32'd4;

    //---------------------------------------
// Instruction Decoder
//---------------------------------------

astrarv_decoder u_decoder (

    .i_instr (instruction),

    .opcode  (opcode),
    .rd      (rd),
    .funct3  (funct3),
    .rs1     (rs1),
    .rs2     (rs2),
    .funct7  (funct7)

);

endmodule