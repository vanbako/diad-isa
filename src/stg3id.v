`include "src/sizes.vh"
`include "src/opcodes.vh"

module stg_id(
    input wire                   iw_clk,
    input wire                   iw_rst,
    input wire  [`HBIT_ADDR:0]   iw_pc,
    output wire [`HBIT_ADDR:0]   ow_pc,
    input wire  [`HBIT_DATA:0]   iw_instr,
    output wire [`HBIT_DATA:0]   ow_instr,
    output wire [`HBIT_OPC:0]    ow_opc,
    output wire                  ow_sgn_en,
    output wire                  ow_imm_en,
    output wire [`HBIT_IMM:0]    ow_imm_val,
    output wire [`HBIT_IMMSR:0]  ow_immsr_val,
    output wire [`HBIT_CC:0]     ow_cc,
    output wire                  ow_has_src_gp,
    output wire [`HBIT_TGT_GP:0] ow_tgt_gp,
    output wire                  ow_tgt_gp_we,
    output wire                  ow_has_src_sr,
    output wire [`HBIT_TGT_SR:0] ow_tgt_sr,
    output wire                  ow_tgt_sr_we,
    output wire [`HBIT_SRC_GP:0] ow_src_gp,
    output wire [`HBIT_SRC_SR:0] ow_src_sr,
    input wire                   iw_flush,
    input wire                   iw_stall
);
    wire [`HBIT_OPC:0] w_opc = iw_instr[`HBIT_INSTR_OPC:`LBIT_INSTR_OPC];
    wire w_sgn_en =
        (w_opc == `OPC_RS_ADDs)     || (w_opc == `OPC_RS_SUBs)    ||
        (w_opc == `OPC_RS_SHRs)     || (w_opc == `OPC_RS_CMPs)    ||
        (w_opc == `OPC_RS_BCCs)     ||
        (w_opc == `OPC_IS_MOVis)    || (w_opc == `OPC_IS_ADDis)   ||
        (w_opc == `OPC_IS_SUBis)    || (w_opc == `OPC_IS_SHRis)   ||
        (w_opc == `OPC_IS_CMPis)    || (w_opc == `OPC_IS_BCCis)   ||
        (w_opc == `OPC_IS_STis)     ||
        (w_opc == `OPC_SR_SRADDis)  || (w_opc == `OPC_SR_SRSUBis);
    wire w_imm_en =
        (w_opc == `OPC_RU_LUI)      ||
        (w_opc == `OPC_IU_MOViu)    || (w_opc == `OPC_IU_ADDiu)   ||
        (w_opc == `OPC_IU_SUBiu)    || (w_opc == `OPC_IU_ANDiu)   ||
        (w_opc == `OPC_IU_ORiu)     || (w_opc == `OPC_IU_XORiu)   ||
        (w_opc == `OPC_IU_SHLiu)    || (w_opc == `OPC_IU_SHRiu)   ||
        (w_opc == `OPC_IU_CMPiu)    || (w_opc == `OPC_IU_JCCiu)   ||
        (w_opc == `OPC_IU_STiu)     ||
        (w_opc == `OPC_IS_MOVis)    || (w_opc == `OPC_IS_ADDis)   ||
        (w_opc == `OPC_IS_SUBis)    || (w_opc == `OPC_IS_SHRis)   ||
        (w_opc == `OPC_IS_CMPis)    || (w_opc == `OPC_IS_BCCis)   ||
        (w_opc == `OPC_IS_STis)     ||
        (w_opc == `OPC_SR_SRADDis)  || (w_opc == `OPC_SR_SRSUBis);
    wire w_is_branch =
        (w_opc == `OPC_RU_JCCu)     ||
        (w_opc == `OPC_RS_BCCs)     ||
        (w_opc == `OPC_IU_JCCiu)    ||
        (w_opc == `OPC_IS_BCCis)    ||
        (w_opc == `OPC_SR_SRJCCu);
    wire w_tgt_gp_we =
        (w_opc == `OPC_RU_MOVu)     || (w_opc == `OPC_RU_ADDu)    ||
        (w_opc == `OPC_RU_SUBu)     || (w_opc == `OPC_RU_NOTu)    ||
        (w_opc == `OPC_RU_ANDu)     || (w_opc == `OPC_RU_ORu)     ||
        (w_opc == `OPC_RU_XORu)     || (w_opc == `OPC_RU_SHLu)    ||
        (w_opc == `OPC_RU_SHRu)     || (w_opc == `OPC_RU_LDu)     ||
        (w_opc == `OPC_RS_ADDs)     || (w_opc == `OPC_RS_SUBs)    ||
        (w_opc == `OPC_RS_SHRs)     ||
        (w_opc == `OPC_IU_MOViu)    || (w_opc == `OPC_IU_ADDiu)   ||
        (w_opc == `OPC_IU_SUBiu)    || (w_opc == `OPC_IU_ANDiu)   ||
        (w_opc == `OPC_IU_ORiu)     || (w_opc == `OPC_IU_XORiu)   ||
        (w_opc == `OPC_IU_SHLiu)    || (w_opc == `OPC_IU_SHRiu)   ||
        (w_opc == `OPC_IS_MOVis)    || (w_opc == `OPC_IS_ADDis)   ||
        (w_opc == `OPC_IS_SUBis)    || (w_opc == `OPC_IS_SHRis);
    wire w_has_tgt_gp =
        w_tgt_gp_we                 ||
        (w_opc == `OPC_RU_CMPu)     || (w_opc == `OPC_RU_STu)     ||
        (w_opc == `OPC_RS_CMPs)     ||
        (w_opc == `OPC_IU_CMPiu)    || (w_opc == `OPC_IU_STiu)    ||
        (w_opc == `OPC_IS_CMPis)    || (w_opc == `OPC_IS_STis);
    wire w_tgt_sr_we =
        (w_opc == `OPC_SR_SRMOVu)   || (w_opc == `OPC_SR_SRADDis) ||
        (w_opc == `OPC_SR_SRSUBis)  || (w_opc == `OPC_SR_SRLDu);
    wire w_has_tgt_sr =
        w_tgt_sr_we                 || (w_opc == `OPC_SR_SRCMPu)  ||
        (w_opc == `OPC_SR_SRSTu);
    wire w_has_src_gp =
        (w_opc == `OPC_RU_MOVu)     || (w_opc == `OPC_RU_ADDu)    ||
        (w_opc == `OPC_RU_SUBu)     || (w_opc == `OPC_RU_ANDu)    ||
        (w_opc == `OPC_RU_ORu)      || (w_opc == `OPC_RU_XORu)    ||
        (w_opc == `OPC_RU_SHLu)     || (w_opc == `OPC_RU_SHRu)    ||
        (w_opc == `OPC_RU_CMPu)     || (w_opc == `OPC_RU_JCCu)    ||
        (w_opc == `OPC_RU_LDu)      || (w_opc == `OPC_RU_STu)     ||
        (w_opc == `OPC_RS_ADDs)     || (w_opc == `OPC_RS_SUBs)    ||
        (w_opc == `OPC_RS_SHRs)     || (w_opc == `OPC_RS_CMPs)    ||
        (w_opc == `OPC_RS_BCCs);
    wire w_has_src_sr =
        (w_opc == `OPC_SR_SRMOVu)   || (w_opc == `OPC_SR_SRCMPu)  ||
        (w_opc == `OPC_SR_SRJCCu)   || (w_opc == `OPC_SR_SRLDu)   ||
        (w_opc == `OPC_SR_SRSTu);
    wire [`HBIT_IMM:0]    w_imm_val   = w_imm_en ? iw_instr[`HBIT_INSTR_IMM:`LBIT_INSTR_IMM] : `SIZE_IMM'b0;
    wire [`HBIT_IMMSR:0]  w_immsr_val = (w_opc == `OPC_SR_SRJCCu) ? iw_instr[`HBIT_INSTR_IMMSR:`LBIT_INSTR_IMMSR] : `SIZE_IMMSR'b0;
    wire [`HBIT_CC:0]     w_cc        = w_is_branch ? iw_instr[`HBIT_INSTR_CC:`LBIT_INSTR_CC] : `SIZE_CC'b0;
    wire [`HBIT_TGT_GP:0] w_tgt_gp    = w_has_tgt_gp ? iw_instr[`HBIT_INSTR_TGT_GP:`LBIT_INSTR_TGT_GP] : `SIZE_TGT_GP'b0;
    wire [`HBIT_TGT_SR:0] w_tgt_sr    = w_has_tgt_sr ? iw_instr[`HBIT_INSTR_TGT_SR:`LBIT_INSTR_TGT_SR] : `SIZE_TGT_SR'b0;
    wire [`HBIT_SRC_GP:0] w_src_gp    = w_has_src_gp ? iw_instr[`HBIT_INSTR_SRC_GP:`LBIT_INSTR_SRC_GP] : `SIZE_SRC_GP'b0;
    wire [`HBIT_SRC_SR:0] w_src_sr    = w_has_src_sr ? iw_instr[`HBIT_INSTR_SRC_SR:`LBIT_INSTR_SRC_SR] : `SIZE_SRC_SR'b0;

    reg [`HBIT_ADDR:0]   r_pc_latch;
    reg [`HBIT_DATA:0]   r_instr_latch;
    reg [`HBIT_OPC:0]    r_opc_latch;
    reg                  r_sgn_en_latch;
    reg                  r_imm_en_latch;
    reg [`HBIT_IMM:0]    r_imm_val_latch;
    reg [`HBIT_IMMSR:0]  r_immsr_val_latch;
    reg [`HBIT_CC:0]     r_cc_latch;
    reg                  r_has_src_gp_latch;
    reg [`HBIT_TGT_GP:0] r_tgt_gp_latch;
    reg                  r_tgt_gp_we_latch;
    reg                  r_has_src_sr_latch;
    reg [`HBIT_TGT_SR:0] r_tgt_sr_latch;
    reg                  r_tgt_sr_we_latch;
    reg [`HBIT_SRC_GP:0] r_src_gp_latch;
    reg [`HBIT_SRC_SR:0] r_src_sr_latch;

    always @(posedge iw_clk or posedge iw_rst) begin
        if (iw_rst) begin
            r_pc_latch         <= `SIZE_ADDR'b0;
            r_instr_latch      <= `SIZE_DATA'b0;
            r_opc_latch        <= `SIZE_OPC'b0;
            r_sgn_en_latch     <= 1'b0;
            r_imm_en_latch     <= 1'b0;
            r_imm_val_latch    <= `SIZE_IMM'b0;
            r_immsr_val_latch  <= `SIZE_IMMSR'b0;
            r_cc_latch         <= `SIZE_CC'b0;
            r_has_src_gp_latch <= 1'b0;
            r_tgt_gp_latch     <= `SIZE_TGT_GP'b0;
            r_tgt_gp_we_latch  <= 1'b0;
            r_has_src_sr_latch <= 1'b0;
            r_tgt_sr_latch     <= `SIZE_TGT_SR'b0;
            r_tgt_sr_we_latch  <= 1'b0;
            r_src_gp_latch     <= `SIZE_SRC_GP'b0;
            r_src_sr_latch     <= `SIZE_SRC_SR'b0;
        end else if (iw_flush) begin
            r_pc_latch         <= `SIZE_ADDR'b0;
            r_instr_latch      <= `SIZE_DATA'b0;
            r_opc_latch        <= `SIZE_OPC'b0;
            r_sgn_en_latch     <= 1'b0;
            r_imm_en_latch     <= 1'b0;
            r_imm_val_latch    <= `SIZE_IMM'b0;
            r_immsr_val_latch  <= `SIZE_IMMSR'b0;
            r_cc_latch         <= `SIZE_CC'b0;
            r_has_src_gp_latch <= 1'b0;
            r_tgt_gp_latch     <= `SIZE_TGT_GP'b0;
            r_tgt_gp_we_latch  <= 1'b0;
            r_has_src_sr_latch <= 1'b0;
            r_tgt_sr_latch     <= `SIZE_TGT_SR'b0;
            r_tgt_sr_we_latch  <= 1'b0;
            r_src_gp_latch     <= `SIZE_SRC_GP'b0;
            r_src_sr_latch     <= `SIZE_SRC_SR'b0;
        end else if (iw_stall) begin
            r_pc_latch         <= r_pc_latch;
            r_instr_latch      <= r_instr_latch;
            r_opc_latch        <= r_opc_latch;
            r_sgn_en_latch     <= r_sgn_en_latch;
            r_imm_en_latch     <= r_imm_en_latch;
            r_imm_val_latch    <= r_imm_val_latch;
            r_immsr_val_latch  <= r_immsr_val_latch;
            r_cc_latch         <= r_cc_latch;
            r_has_src_gp_latch <= r_has_src_gp_latch;
            r_tgt_gp_latch     <= r_tgt_gp_latch;
            r_tgt_gp_we_latch  <= r_tgt_gp_we_latch;
            r_has_src_sr_latch <= r_has_src_sr_latch;
            r_tgt_sr_latch     <= r_tgt_sr_latch;
            r_tgt_sr_we_latch  <= r_tgt_sr_we_latch;
            r_src_gp_latch     <= r_src_gp_latch;
            r_src_sr_latch     <= r_src_sr_latch;
        end else begin
            r_pc_latch         <= iw_pc;
            r_instr_latch      <= iw_instr;
            r_opc_latch        <= w_opc;
            r_sgn_en_latch     <= w_sgn_en;
            r_imm_en_latch     <= w_imm_en;
            r_imm_val_latch    <= w_imm_val;
            r_immsr_val_latch  <= w_immsr_val;
            r_cc_latch         <= w_cc;
            r_has_src_gp_latch <= w_has_src_gp;
            r_tgt_gp_latch     <= w_tgt_gp;
            r_tgt_gp_we_latch  <= w_tgt_gp_we;
            r_has_src_sr_latch <= w_has_src_sr;
            r_tgt_sr_latch     <= w_tgt_sr;
            r_tgt_sr_we_latch  <= w_tgt_sr_we;
            r_src_gp_latch     <= w_src_gp;
            r_src_sr_latch     <= w_src_sr;
        end
    end

    assign ow_pc         = r_pc_latch;
    assign ow_instr      = r_instr_latch;
    assign ow_opc        = r_opc_latch;
    assign ow_sgn_en     = r_sgn_en_latch;
    assign ow_imm_en     = r_imm_en_latch;
    assign ow_imm_val    = r_imm_val_latch;
    assign ow_immsr_val  = r_immsr_val_latch;
    assign ow_cc         = r_cc_latch;
    assign ow_has_src_gp = r_has_src_gp_latch;
    assign ow_tgt_gp     = r_tgt_gp_latch;
    assign ow_tgt_gp_we  = r_tgt_gp_we_latch;
    assign ow_has_src_sr = r_has_src_sr_latch;
    assign ow_tgt_sr     = r_tgt_sr_latch;
    assign ow_tgt_sr_we  = r_tgt_sr_we_latch;
    assign ow_src_gp     = r_src_gp_latch;
    assign ow_src_sr     = r_src_sr_latch;
endmodule
