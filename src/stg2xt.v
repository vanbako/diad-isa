`include "src/sizes.vh"
`include "src/opcodes.vh"

module stg_xt(
    input wire                 iw_clk,
    input wire                 iw_rst,
    input wire  [`HBIT_ADDR:0] iw_pc,
    output wire [`HBIT_ADDR:0] ow_pc,
    input wire  [`HBIT_DATA:0] iw_instr,
    output wire [`HBIT_DATA:0] ow_instr,
    input wire                 iw_flush,
    input wire                 iw_stall
);
    wire [`HBIT_OPC:0]     w_opc       = iw_instr[`HBIT_INSTR_OPC:`LBIT_INSTR_OPC];
    wire [`HBIT_OPCLASS:0] w_opclass   = iw_instr[`HBIT_INSTR_OPCLASS:`LBIT_INSTR_OPCLASS];
    wire [`HBIT_SUBOP:0]   w_subop     = iw_instr[`HBIT_INSTR_SUBOP:`LBIT_INSTR_SUBOP];
    wire [`HBIT_IMM12:0]   w_imm12_val = iw_instr[`HBIT_INSTR_IMM12:`LBIT_INSTR_IMM12];
    wire [`HBIT_IMM8:0]    w_imm8_val  = iw_instr[`HBIT_INSTR_IMM8:`LBIT_INSTR_IMM8];
    wire [`HBIT_CC:0]      w_cc        = iw_instr[`HBIT_INSTR_CC:`LBIT_INSTR_CC];
    wire [`HBIT_TGT_GP:0]  w_tgt_gp    = iw_instr[`HBIT_INSTR_TGT_GP:`LBIT_INSTR_TGT_GP];
    wire [`HBIT_TGT_SR:0]  w_tgt_sr    = iw_instr[`HBIT_INSTR_TGT_SR:`LBIT_INSTR_TGT_SR];
    wire [`HBIT_SRC_GP:0]  w_src_gp    = iw_instr[`HBIT_INSTR_SRC_GP:`LBIT_INSTR_SRC_GP];
    wire [`HBIT_SRC_SR:0]  w_src_sr    = iw_instr[`HBIT_INSTR_SRC_SR:`LBIT_INSTR_SRC_SR];

    reg [`HBIT_ADDR:0] w_pc;
    reg [`HBIT_DATA:0] w_instr;
    always @(*) begin
        if ((w_opclass == `OPCLASS_RU) ||
            (w_opclass == `OPCLASS_RS) ||
            (w_opclass == `OPCLASS_IU) ||
            (w_opclass == `OPCLASS_IS))
        begin
            w_pc    = iw_pc;
            w_instr = iw_instr;
        end else if (w_opclass == `OPCLASS_SR) begin
            w_pc    = iw_pc;
            // w_instr = `SIZE_DATA'b0;
            w_instr = iw_instr;
        end else if (w_opclass == `OPCLASS_ISA) begin
            w_pc    = iw_pc;
            w_instr = iw_instr;
            case (w_subop)
                `SUBOP_ISA_PUSH: w_instr = `SIZE_DATA'b0;
                `SUBOP_ISA_POP:  w_instr = `SIZE_DATA'b0;
                `SUBOP_ISA_JSR:  w_instr = `SIZE_DATA'b0;
                `SUBOP_ISA_JSRi: w_instr = `SIZE_DATA'b0;
                `SUBOP_ISA_BSR:  w_instr = `SIZE_DATA'b0;
                `SUBOP_ISA_BSRi: w_instr = `SIZE_DATA'b0;
                `SUBOP_ISA_RET:  w_instr = `SIZE_DATA'b0;
                default:         w_instr = `SIZE_DATA'b0;
            endcase
        end else begin
            w_pc    = iw_pc;
            w_instr = `SIZE_DATA'b0;
        end
    end
    reg [`HBIT_ADDR:0] r_pc_latch;
    reg [`HBIT_DATA:0] r_instr_latch;
    always @(posedge iw_clk or posedge iw_rst) begin
        if (iw_flush) begin
            r_pc_latch    <= `SIZE_ADDR'b0;
            r_instr_latch <= `SIZE_DATA'b0;
        end else if (iw_stall) begin
            r_pc_latch    <= r_pc_latch;
            r_instr_latch <= r_instr_latch;
        end else begin
            r_pc_latch    <= w_pc;
            r_instr_latch <= w_instr;
        end
    end
    assign ow_pc    = r_pc_latch;
    assign ow_instr = r_instr_latch;
endmodule