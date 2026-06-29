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
    // Instruction Fetch
    //---------------------------------------
    logic [31:0] instruction;

    //---------------------------------------
    // Decoder
    //---------------------------------------
    logic [6:0] opcode;
    logic [4:0] rd;
    logic [2:0] funct3;
    logic [4:0] rs1;
    logic [4:0] rs2;
    logic [6:0] funct7;

    //---------------------------------------
    // Immediate Generator
    //---------------------------------------
    logic [31:0] immediate;

    //---------------------------------------
    // Main Control
    //---------------------------------------
    logic       reg_write;
    logic       mem_read;
    logic       mem_write;
    logic       mem_to_reg;
    logic       alu_src;
    logic       branch;
    logic [1:0] alu_op;

    //---------------------------------------
    // ALU Control
    //---------------------------------------
    logic [3:0] alu_ctrl;

    //---------------------------------------
    // Register File
    //---------------------------------------
    logic [31:0] rs1_data;
    logic [31:0] rs2_data;

    //---------------------------------------
    // Operand MUX
    //---------------------------------------
    logic [31:0] operand_b;

    //---------------------------------------
    // ALU
    //---------------------------------------
    logic [31:0] alu_result;
    logic        zero;

    //---------------------------------------
    // Temporary Writeback
    //---------------------------------------
    logic [31:0] write_back_data;

    assign write_back_data = alu_result;

    //---------------------------------------
    // Program Counter
    //---------------------------------------
    astrarv_pc #(
        .XLEN(XLEN)
    ) u_pc (
        .clk_i(i_clk),
        .rst_ni(i_rst_n),
        .i_enable(1'b1),
        .i_next_pc(next_pc),
        .o_pc(pc)
    );

    //---------------------------------------
    // Instruction Memory
    //---------------------------------------
    astrarv_imem u_imem (
        .i_addr(pc),
        .o_instr(instruction)
    );

    assign next_pc = pc + 32'd4;

    //---------------------------------------
    // Decoder
    //---------------------------------------
    astrarv_decoder u_decoder (
        .i_instr(instruction),
        .opcode(opcode),
        .rd(rd),
        .funct3(funct3),
        .rs1(rs1),
        .rs2(rs2),
        .funct7(funct7)
    );

    //---------------------------------------
    // Immediate Generator
    //---------------------------------------
    astrarv_imm_gen u_imm_gen (
        .i_instr(instruction),
        .o_imm(immediate)
    );

    //---------------------------------------
    // Main Control
    //---------------------------------------
    astrarv_control u_control (
        .i_opcode(opcode),
        .o_reg_write(reg_write),
        .o_mem_read(mem_read),
        .o_mem_write(mem_write),
        .o_mem_to_reg(mem_to_reg),
        .o_alu_src(alu_src),
        .o_branch(branch),
        .o_alu_op(alu_op)
    );

    //---------------------------------------
    // ALU Control
    //---------------------------------------
    astrarv_alu_control u_alu_control (
        .i_alu_op(alu_op),
        .i_funct3(funct3),
        .i_funct7(funct7),
        .o_alu_ctrl(alu_ctrl)
    );

    //---------------------------------------
    // Register File
    //---------------------------------------
    astrarv_regfile u_regfile (

        .clk_i(i_clk),
        .rst_ni(i_rst_n),

        .i_we(reg_write),

        .i_rs1_addr(rs1),
        .i_rs2_addr(rs2),
        .i_rd_addr(rd),

        .i_rd_data(write_back_data),

        .o_rs1_data(rs1_data),
        .o_rs2_data(rs2_data)

    );

    //---------------------------------------
    // Operand MUX
    //---------------------------------------
    astrarv_operand_mux u_operand_mux (

        .i_rs2_data(rs2_data),
        .i_imm(immediate),

        .i_alu_src(alu_src),

        .o_operand_b(operand_b)

    );

    //---------------------------------------
    // ALU
    //---------------------------------------
    astrarv_alu u_alu (

        .i_operand_a(rs1_data),
        .i_operand_b(operand_b),

        .i_alu_ctrl(alu_ctrl),

        .o_result(alu_result),
        .o_zero(zero)

    );

endmodule