`include "src/sizes.vh"
`include "src/opcodes.vh"

module hazard(
    input wire                  iw_clk,
    input wire                  iw_rst,
    input wire [`HBIT_OPC:0]    iw_idex_opc,
    input wire                  iw_has_src_gp,
    input wire [`HBIT_SRC_GP:0] iw_src_gp,
    input wire                  iw_has_tgt_gp,
    input wire [`HBIT_TGT_GP:0] iw_tgt_gp,
    input wire                  iw_tgt_gp_we,
    output wire                 ow_stall
);
    reg [`HBIT_TGT_GP:0] r_ld_gp [1:0];
    reg [1:0] r_ld_valid;
    wire new_load = (iw_idex_opc == `OPC_RU_LDu);

    always @(posedge iw_clk or posedge iw_rst) begin
        if (iw_rst) begin
            r_ld_valid <= 2'b00;
            r_ld_gp[0] <= `SIZE_TGT_GP'b0;
            r_ld_gp[1] <= `SIZE_TGT_GP'b0;
        end else begin
            r_ld_valid <= {r_ld_valid[0], new_load};
            r_ld_gp[1] <= r_ld_gp[0];
            r_ld_gp[0] <= new_load ? iw_tgt_gp : `SIZE_TGT_GP'b0;
        end
    end

    wire uses_tgt_as_src =
        iw_has_tgt_gp &&
        ((!iw_tgt_gp_we) ||
         !((iw_idex_opc == `OPC_RU_MOVu) ||
           (iw_idex_opc == `OPC_RU_LDu) ||
           (iw_idex_opc == `OPC_IU_MOViu) ||
           (iw_idex_opc == `OPC_IS_MOVis)));

    wire hazard_src = iw_has_src_gp &&
        ((r_ld_valid[0] && (iw_src_gp == r_ld_gp[0])) ||
         (r_ld_valid[1] && (iw_src_gp == r_ld_gp[1])));

    wire hazard_tgt = uses_tgt_as_src &&
        ((r_ld_valid[0] && (iw_tgt_gp == r_ld_gp[0])) ||
         (r_ld_valid[1] && (iw_tgt_gp == r_ld_gp[1])));

    assign ow_stall = hazard_src || hazard_tgt;
endmodule
