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
    reg [`HBIT_ADDR:0] w_pc;
    reg [`HBIT_DATA:0] w_instr;
    always @(*) begin
        if ((iw_instr[`HBIT_INSTRSET:`LBIT_INSTRSET] == `INSTRSET_RU) ||
            (iw_instr[`HBIT_INSTRSET:`LBIT_INSTRSET] == `INSTRSET_RS) ||
            (iw_instr[`HBIT_INSTRSET:`LBIT_INSTRSET] == `INSTRSET_IU) ||
            (iw_instr[`HBIT_INSTRSET:`LBIT_INSTRSET] == `INSTRSET_IS))
        begin
            w_pc    = iw_pc;
            w_instr = iw_instr;
        end else if (iw_instr[`HBIT_INSTRSET:`LBIT_INSTRSET] == `INSTRSET_SR) begin
            w_pc    = iw_pc;
            // w_instr = `SIZE_DATA'b0;
            w_instr = iw_instr;
        end else if (iw_instr[`HBIT_INSTRSET:`LBIT_INSTRSET] == `INSTRSET_ISA) begin
            w_pc    = iw_pc;
            w_instr = iw_instr;
            case (iw_instr[`HBIT_INSTR_OPC:`LBIT_INSTR_OPC])
                `OPC_ISA_PUSH: w_instr = `SIZE_DATA'b0;
                `OPC_ISA_POP: w_instr = `SIZE_DATA'b0;
                `OPC_ISA_JSR: w_instr = `SIZE_DATA'b0;
                `OPC_ISA_JSRi: w_instr = `SIZE_DATA'b0;
                `OPC_ISA_BSR: w_instr = `SIZE_DATA'b0;
                `OPC_ISA_BSRi: w_instr = `SIZE_DATA'b0;
                `OPC_ISA_RET: w_instr = `SIZE_DATA'b0;
                default: w_instr = `SIZE_DATA'b0;
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