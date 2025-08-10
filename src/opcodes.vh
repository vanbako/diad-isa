`ifndef OPCODES_VH
`define OPCODES_VH

`include "src/sizes.vh"

// OPCLASS
`define OPCLASS_RU   4'h0
`define OPCLASS_RS   4'h1
`define OPCLASS_IU   4'h2
`define OPCLASS_IS   4'h3
`define OPCLASS_SR   4'h4
`define OPCLASS_ISA  4'h5

// OPCODE DEFINITIONS
`define OPC_NOP       8'h00
`define SUBOP_NOP     4'h0

// REGISTER UNSIGNED
`define OPC_RU_LUI      8'h01
`define SUBOP_RU_LUI    4'h1
`define OPC_RU_MOVu     8'h02
`define SUBOP_RU_MOVu   4'h2
`define OPC_RU_ADDu     8'h03
`define SUBOP_RU_ADDu   4'h3
`define OPC_RU_SUBu     8'h04
`define SUBOP_RU_SUBu   4'h4
`define OPC_RU_NOTu     8'h05
`define SUBOP_RU_NOTu   4'h5
`define OPC_RU_ANDu     8'h06
`define SUBOP_RU_ANDu   4'h6
`define OPC_RU_ORu      8'h07
`define SUBOP_RU_ORu    4'h7
`define OPC_RU_XORu     8'h08
`define SUBOP_RU_XORu   4'h8
`define OPC_RU_SHLu     8'h09
`define SUBOP_RU_SHLu   4'h9
`define OPC_RU_SHRu     8'h0A
`define SUBOP_RU_SHRu   4'hA
`define OPC_RU_CMPu     8'h0B
`define SUBOP_RU_CMPu   4'hB
`define OPC_RU_JCCu     8'h0C
`define SUBOP_RU_JCCu   4'hC
`define OPC_RU_LDu      8'h0E
`define SUBOP_RU_LDu    4'hE
`define OPC_RU_STu      8'h0F
`define SUBOP_RU_STu    4'hF

// REGISTER SIGNED
`define OPC_RS_ADDs     8'h13
`define SUBOP_RS_ADDs   4'h3
`define OPC_RS_SUBs     8'h14
`define SUBOP_RS_SUBs   4'h4
`define OPC_RS_SHRs     8'h1A
`define SUBOP_RS_SHRs   4'hA
`define OPC_RS_CMPs     8'h1B
`define SUBOP_RS_CMPs   4'hB
`define OPC_RS_BCCs     8'h1D
`define SUBOP_RS_BCCs   4'hD

// IMMEDIATE UNSIGNED
`define OPC_IU_MOViu    8'h22
`define SUBOP_IU_MOViu  4'h2
`define OPC_IU_ADDiu    8'h23
`define SUBOP_IU_ADDiu  4'h3
`define OPC_IU_SUBiu    8'h24
`define SUBOP_IU_SUBiu  4'h4
`define OPC_IU_ANDiu    8'h26
`define SUBOP_IU_ANDiu  4'h6
`define OPC_IU_ORiu     8'h27
`define SUBOP_IU_ORiu   4'h7
`define OPC_IU_XORiu    8'h28
`define SUBOP_IU_XORiu  4'h8
`define OPC_IU_SHLiu    8'h29
`define SUBOP_IU_SHLiu  4'h9
`define OPC_IU_SHRiu    8'h2A
`define SUBOP_IU_SHRiu  4'hA
`define OPC_IU_CMPiu    8'h2B
`define SUBOP_IU_CMPiu  4'hB
`define OPC_IU_JCCiu    8'h2C
`define SUBOP_IU_JCCiu  4'hC
`define OPC_IU_STiu     8'h2F
`define SUBOP_IU_STiu   4'hF

// IMMEDIATE SIGNED
`define OPC_IS_MOVis    8'h32
`define SUBOP_IS_MOVis  4'h2
`define OPC_IS_ADDis    8'h33
`define SUBOP_IS_ADDis  4'h3
`define OPC_IS_SUBis    8'h34
`define SUBOP_IS_SUBis  4'h4
`define OPC_IS_SHRis    8'h3A
`define SUBOP_IS_SHRis  4'hA
`define OPC_IS_CMPis    8'h3B
`define SUBOP_IS_CMPis  4'hB
`define OPC_IS_BCCis    8'h3D
`define SUBOP_IS_BCCis  4'hD
`define OPC_IS_STis     8'h3F
`define SUBOP_IS_STis   4'hF

// SPECIAL REGISTER
`define OPC_SR_HLT       8'h41
`define SUBOP_SR_HLT     4'h1
`define OPC_SR_SRMOVu    8'h42
`define SUBOP_SR_SRMOVu  4'h2
`define OPC_SR_SRADDis   8'h43
`define SUBOP_SR_SRADDis 4'h3
`define OPC_SR_SRSUBis   8'h44
`define SUBOP_SR_SRSUBis 4'h4
`define OPC_SR_SRCMPu    8'h4B
`define SUBOP_SR_SRCMPu  4'hB
`define OPC_SR_SRJCCu    8'h4C
`define SUBOP_SR_SRJCCu  4'hC
`define OPC_SR_SRLDu     8'h4E
`define SUBOP_SR_SRLDu   4'hE
`define OPC_SR_SRSTu     8'h4F
`define SUBOP_SR_SRSTu   4'hF

// ISA
`define OPC_ISA_PUSH    8'h50
`define SUBOP_ISA_PUSH  4'h0
`define OPC_ISA_POP     8'h51
`define SUBOP_ISA_POP   4'h1
`define OPC_ISA_JSR     8'h52
`define SUBOP_ISA_JSR   4'h2
`define OPC_ISA_JSRi    8'h53
`define SUBOP_ISA_JSRi  4'h3
`define OPC_ISA_BSR     8'h54
`define SUBOP_ISA_BSR   4'h4
`define OPC_ISA_BSRi    8'h55
`define SUBOP_ISA_BSRi  4'h5
`define OPC_ISA_RET     8'h56
`define SUBOP_ISA_RET   4'h6

function automatic [`HBIT_DATA:0] pack_instr;
    input [`HBIT_OPCLASS:0] i_opclass;
    input [`HBIT_SUBOP:0]   i_subop;
    input [`HBIT_TGT_GP:0]  i_tgt;
    input [`HBIT_SRC_GP:0]  i_src;
    input [`HBIT_IMM12:0]   i_imm12;
    input [`HBIT_IMM8:0]    i_imm8;
    reg   [`HBIT_DATA:0]    r_instr;
begin
    r_instr                                          = {`SIZE_DATA{1'b0}};
    r_instr[`HBIT_INSTR_OPCLASS:`LBIT_INSTR_OPCLASS] = i_opclass;
    r_instr[`HBIT_INSTR_SUBOP:`LBIT_INSTR_SUBOP]     = i_subop;
    r_instr[`HBIT_INSTR_TGT_GP:`LBIT_INSTR_TGT_GP]   = i_tgt;
    r_instr[`HBIT_INSTR_SRC_GP:`LBIT_INSTR_SRC_GP]   = i_src;
    r_instr[`HBIT_INSTR_IMM12:`LBIT_INSTR_IMM12]     = i_imm12;
    r_instr[`HBIT_INSTR_IMM8:`LBIT_INSTR_IMM8]       = i_imm8;
    pack_instr = r_instr;
end endfunction

function automatic [79:0] opc2str;
    input [`HBIT_OPC:0] opc;
    begin
        case (opc)
            `OPC_NOP:       opc2str = "NOP";
            `OPC_RU_LUI:    opc2str = "RU_LUI";
            `OPC_RU_MOVu:   opc2str = "RU_MOVu";
            `OPC_RU_ADDu:   opc2str = "RU_ADDu";
            `OPC_RU_SUBu:   opc2str = "RU_SUBu";
            `OPC_RU_NOTu:   opc2str = "RU_NOTu";
            `OPC_RU_ANDu:   opc2str = "RU_ANDu";
            `OPC_RU_ORu:    opc2str = "RU_ORu";
            `OPC_RU_XORu:   opc2str = "RU_XORu";
            `OPC_RU_SHLu:   opc2str = "RU_SHLu";
            `OPC_RU_SHRu:   opc2str = "RU_SHRu";
            `OPC_RU_CMPu:   opc2str = "RU_CMPu";
            `OPC_RU_JCCu:   opc2str = "RU_JCCu";
            `OPC_RU_LDu:    opc2str = "RU_LDu";
            `OPC_RU_STu:    opc2str = "RU_STu";
            `OPC_RS_ADDs:   opc2str = "RS_ADDs";
            `OPC_RS_SUBs:   opc2str = "RS_SUBs";
            `OPC_RS_SHRs:   opc2str = "RS_SHRs";
            `OPC_RS_CMPs:   opc2str = "RS_CMPs";
            `OPC_RS_BCCs:   opc2str = "RS_BCCs";
            `OPC_IU_MOViu:  opc2str = "IU_MOViu";
            `OPC_IU_ADDiu:  opc2str = "IU_ADDiu";
            `OPC_IU_SUBiu:  opc2str = "IU_SUBiu";
            `OPC_IU_ANDiu:  opc2str = "IU_ANDiu";
            `OPC_IU_ORiu:   opc2str = "IU_ORiu";
            `OPC_IU_XORiu:  opc2str = "IU_XORiu";
            `OPC_IU_SHLiu:  opc2str = "IU_SHLiu";
            `OPC_IU_SHRiu:  opc2str = "IU_SHRiu";
            `OPC_IU_CMPiu:  opc2str = "IU_CMPiu";
            `OPC_IU_JCCiu:  opc2str = "IU_JCCiu";
            `OPC_IU_STiu:   opc2str = "IU_STiu";
            `OPC_IS_MOVis:  opc2str = "IS_MOVis";
            `OPC_IS_ADDis:  opc2str = "IS_ADDis";
            `OPC_IS_SUBis:  opc2str = "IS_SUBis";
            `OPC_IS_SHRis:  opc2str = "IS_SHRis";
            `OPC_IS_CMPis:  opc2str = "IS_CMPis";
            `OPC_IS_BCCis:  opc2str = "IS_BCCis";
            `OPC_IS_STis:   opc2str = "IS_STis";
            `OPC_SR_HLT:    opc2str = "SR_HLT";
            `OPC_SR_SRMOVu: opc2str = "SR_SRMOVu";
            `OPC_SR_SRJCCu: opc2str = "SR_SRJCCu";
            `OPC_SR_SRADDis:opc2str = "SR_SRADDis";
            `OPC_SR_SRSUBis:opc2str = "SR_SRSUBis";
            `OPC_SR_SRCMPu: opc2str = "SR_SRCMPu";
            `OPC_SR_SRLDu:  opc2str = "SR_SRLDu";
            `OPC_SR_SRSTu:  opc2str = "SR_SRSTu";
            `OPC_ISA_PUSH:  opc2str = "ISA_PUSH";
            `OPC_ISA_POP:   opc2str = "ISA_POP";
            `OPC_ISA_JSR:   opc2str = "ISA_JSR";
            `OPC_ISA_JSRi:  opc2str = "ISA_JSRi";
            `OPC_ISA_BSR:   opc2str = "ISA_BSR";
            `OPC_ISA_BSRi:  opc2str = "ISA_BSRi";
            `OPC_ISA_RET:   opc2str = "ISA_RET";
            default:        opc2str = "UNKNOWN";
        endcase
    end
endfunction

`endif // OPCODES_VH
