`include "src/sizes.vh"
`include "src/opcodes.vh"

module hazard(
    input wire                  iw_clk,
    input wire                  iw_rst,
    input wire [`HBIT_OPC:0]    iw_exma_opc,
    input wire [`HBIT_OPC:0]    iw_mamo_opc,
    input wire [`HBIT_SRC_GP:0] iw_exma_tgt_gp,
    input wire                  iw_exma_tgt_gp_we,
    input wire [`HBIT_SRC_GP:0] iw_mamo_tgt_gp,
    input wire                  iw_mamo_tgt_gp_we,
    input wire [`HBIT_TGT_GP:0] iw_tgt_gp,
    input wire [`HBIT_SRC_GP:0] iw_src_gp,
    input wire [`HBIT_SRC_GP:0] iw_exma_tgt_sr,
    input wire                  iw_exma_tgt_sr_we,
    input wire [`HBIT_SRC_GP:0] iw_mamo_tgt_sr,
    input wire                  iw_mamo_tgt_sr_we,
    input wire [`HBIT_TGT_GP:0] iw_tgt_sr,
    input wire [`HBIT_SRC_GP:0] iw_src_sr,
    output wire                 ow_stall
);
    reg [2:0] r_cnt;
    wire w_hazard1 =
        ((iw_mamo_opc == `OPC_RU_LDu)   && iw_mamo_tgt_gp_we && ((iw_mamo_tgt_gp == iw_src_gp) || (iw_mamo_tgt_gp == iw_tgt_gp))) ||
        ((iw_mamo_opc == `OPC_SR_SRLDu) && iw_mamo_tgt_sr_we && ((iw_mamo_tgt_sr == iw_src_sr) || (iw_mamo_tgt_sr == iw_tgt_sr)));
    wire w_hazard2 =
        ((iw_exma_opc == `OPC_RU_LDu)   && iw_exma_tgt_gp_we && ((iw_exma_tgt_gp == iw_src_gp) || (iw_exma_tgt_gp == iw_tgt_gp))) ||
        ((iw_exma_opc == `OPC_SR_SRLDu) && iw_exma_tgt_sr_we && ((iw_exma_tgt_sr == iw_src_sr) || (iw_exma_tgt_sr == iw_tgt_sr)));
    always @(posedge iw_clk or posedge iw_rst) begin
        if (iw_rst) begin
            r_cnt <= 2'd0;
        end else if (r_cnt != 2'd0) begin
            r_cnt <= r_cnt - 2'd1;
            // $display("HAZARD: stall cycle");
        // end else if (w_hazard1) begin
        //     $display("HAZARD: Hazard 1 detected, stalling for 1 cycles");
        //     r_cnt <= 2'd1;
        end else if (w_hazard2) begin
            // $display("HAZARD: Hazard 2 detected, stalling for 2 cycles");
            r_cnt <= 2'd1;
        end
    end
    assign ow_stall = (r_cnt != 2'd0) || w_hazard1 || w_hazard2;
endmodule
