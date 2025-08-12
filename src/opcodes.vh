`ifndef OPCODES_VH
`define OPCODES_VH

`include "src/sizes.vh"

// OPCLASS
`define OPCLASS_0 4'b0000
`define OPCLASS_1 4'b0001
`define OPCLASS_2 4'b0010
`define OPCLASS_3 4'b0011
`define OPCLASS_4 4'b0100
`define OPCLASS_5 4'b0101
`define OPCLASS_6 4'b0110
`define OPCLASS_7 4'b0111
`define OPCLASS_8 4'b1000
`define OPCLASS_9 4'b1001
`define OPCLASS_A 4'b1010
`define OPCLASS_B 4'b1011
`define OPCLASS_C 4'b1100
`define OPCLASS_D 4'b1101
`define OPCLASS_E 4'b1110
`define OPCLASS_F 4'b1111

// OPCLASS_0
`define SUBOP_NOP   4'b0000 // µop & isa
`define SUBOP_MOVur 4'b0001 // µop & isa
`define SUBOP_MCCur 4'b0010 // µop & isa
`define SUBOP_ADDur 4'b0011 // µop & isa
`define SUBOP_SUBur 4'b0100 // µop & isa
`define SUBOP_NOTur 4'b0101 // µop & isa
`define SUBOP_ANDur 4'b0110 // µop & isa
`define SUBOP_ORur  4'b0111 // µop & isa
`define SUBOP_XORur 4'b1000 // µop & isa
`define SUBOP_SHLur 4'b1001 // µop & isa
`define SUBOP_ROLur 4'b1010 // µop & isa
`define SUBOP_SHRur 4'b1011 // µop & isa
`define SUBOP_RORur 4'b1100 // µop & isa
`define SUBOP_CMPur 4'b1101 // µop & isa
`define SUBOP_TSTur 4'b1110 // µop & isa

`define OPC_NOP   {`OPCLASS_0, `SUBOP_NOP}
`define OPC_MOVur {`OPCLASS_0, `SUBOP_MOVur}
`define OPC_MCCur {`OPCLASS_0, `SUBOP_MCCur}
`define OPC_ADDur {`OPCLASS_0, `SUBOP_ADDur}
`define OPC_SUBur {`OPCLASS_0, `SUBOP_SUBur}
`define OPC_NOTur {`OPCLASS_0, `SUBOP_NOTur}
`define OPC_ANDur {`OPCLASS_0, `SUBOP_ANDur}
`define OPC_ORur  {`OPCLASS_0, `SUBOP_ORur}
`define OPC_XORur {`OPCLASS_0, `SUBOP_XORur}
`define OPC_SHLur {`OPCLASS_0, `SUBOP_SHLur}
`define OPC_ROLur {`OPCLASS_0, `SUBOP_ROLur}
`define OPC_SHRur {`OPCLASS_0, `SUBOP_SHRur}
`define OPC_RORur {`OPCLASS_0, `SUBOP_RORur}
`define OPC_CMPur {`OPCLASS_0, `SUBOP_CMPur}
`define OPC_TSTur {`OPCLASS_0, `SUBOP_TSTur}

// OPCLASS_1
`define SUBOP_LUIui 4'b0000 // µop & isa
`define SUBOP_MOVui 4'b0001 // µop & isa
`define SUBOP_ADDui 4'b0011 // µop & isa
`define SUBOP_SUBui 4'b0100 // µop & isa
`define SUBOP_ANDui 4'b0110 // µop & isa
`define SUBOP_ORui  4'b0111 // µop & isa
`define SUBOP_XORui 4'b1000 // µop & isa
`define SUBOP_SHLui 4'b1001 // µop & isa
`define SUBOP_ROLui 4'b1010 // µop & isa
`define SUBOP_SHRui 4'b1011 // µop & isa
`define SUBOP_RORui 4'b1100 // µop & isa
`define SUBOP_CMPui 4'b1101 // µop & isa

`define OPC_LUIui {`OPCLASS_1, `SUBOP_LUIui}
`define OPC_MOVui {`OPCLASS_1, `SUBOP_MOVui}
`define OPC_ADDui {`OPCLASS_1, `SUBOP_ADDui}
`define OPC_SUBui {`OPCLASS_1, `SUBOP_SUBui}
`define OPC_ANDui {`OPCLASS_1, `SUBOP_ANDui}
`define OPC_ORui  {`OPCLASS_1, `SUBOP_ORui}
`define OPC_XORui {`OPCLASS_1, `SUBOP_XORui}
`define OPC_SHLui {`OPCLASS_1, `SUBOP_SHLui}
`define OPC_ROLui {`OPCLASS_1, `SUBOP_ROLui}
`define OPC_SHRui {`OPCLASS_1, `SUBOP_SHRui}
`define OPC_RORui {`OPCLASS_1, `SUBOP_RORui}
`define OPC_CMPui {`OPCLASS_1, `SUBOP_CMPui}

// OPCLASS_2
`define SUBOP_ADDsr 4'b0011 // µop & isa
`define SUBOP_SUBsr 4'b0100 // µop & isa
`define SUBOP_NEGsr 4'b0101 // µop & isa
`define SUBOP_SHRsr 4'b1011 // µop & isa
`define SUBOP_CMPsr 4'b1101 // µop & isa
`define SUBOP_TSTsr 4'b1110 // µop & isa

`define OPC_NEGsr {`OPCLASS_2, `SUBOP_NEGsr}
`define OPC_ADDsr {`OPCLASS_2, `SUBOP_ADDsr}
`define OPC_SUBsr {`OPCLASS_2, `SUBOP_SUBsr}
`define OPC_SHRsr {`OPCLASS_2, `SUBOP_SHRsr}
`define OPC_CMPsr {`OPCLASS_2, `SUBOP_CMPsr}
`define OPC_TSTsr {`OPCLASS_2, `SUBOP_TSTsr}

// OPCLASS_3
`define SUBOP_MOVsi 4'b0000 // µop & isa
`define SUBOP_MCCsi 4'b0001 // µop & isa
`define SUBOP_ADDsi 4'b0011 // µop & isa
`define SUBOP_SUBsi 4'b0100 // µop & isa
`define SUBOP_SHRsi 4'b1011 // µop & isa
`define SUBOP_CMPsi 4'b1101 // µop & isa

`define OPC_MOVsi {`OPCLASS_3, `SUBOP_MOVsi}
`define OPC_MCCsi {`OPCLASS_3, `SUBOP_MCCsi}
`define OPC_ADDsi {`OPCLASS_3, `SUBOP_ADDsi}
`define OPC_SUBsi {`OPCLASS_3, `SUBOP_SUBsi}
`define OPC_SHRsi {`OPCLASS_3, `SUBOP_SHRsi}
`define OPC_CMPsi {`OPCLASS_3, `SUBOP_CMPsi}

// OPCLASS_4
`define SUBOP_LDur 4'b0000 // µop & isa
`define SUBOP_STur 4'b0001 // µop & isa
`define SUBOP_STui 4'b0010 // µop & isa
`define SUBOP_STsi 4'b0011 // µop & isa

`define OPC_LDur {`OPCLASS_4, `SUBOP_LDur}
`define OPC_STur {`OPCLASS_4, `SUBOP_STur}
`define OPC_STui {`OPCLASS_4, `SUBOP_STui}
`define OPC_STsi {`OPCLASS_4, `SUBOP_STsi}

// OPCLASS_5
`define SUBOP_LDso  4'b0000 // µop & isa
`define SUBOP_STso  4'b0001 // µop & isa
`define SUBOP_LDAso 4'b0010 // µop & isa
`define SUBOP_STAso 4'b0011 // µop & isa

`define OPC_LDso  {`OPCLASS_5, `SUBOP_LDso}
`define OPC_STso  {`OPCLASS_5, `SUBOP_STso}
`define OPC_LDAso {`OPCLASS_5, `SUBOP_LDAso}
`define OPC_STAso {`OPCLASS_5, `SUBOP_STAso}

// OPCLASS_6
`define SUBOP_MOVAur 4'b0001 // µop & isa
`define SUBOP_MOVDur 4'b0010 // µop & isa
`define SUBOP_ADDAur 4'b0011 // µop & isa
`define SUBOP_SUBAur 4'b0100 // µop & isa
`define SUBOP_MOVAsr 4'b0101 // µop & isa
`define SUBOP_ADDAsr 4'b0110 // µop & isa
`define SUBOP_SUBAsr 4'b0111 // µop & isa
`define SUBOP_ADDAsi 4'b1000 // µop & isa
`define SUBOP_SUBAsi 4'b1001 // µop & isa
`define SUBOP_LEAso  4'b1010 // µop & isa
`define SUBOP_ADRAso 4'b1011 // µop & isa
`define SUBOP_CMPAur 4'b1101 // µop & isa
`define SUBOP_TSTAur 4'b1110 // µop & isa

`define OPC_MOVAur {`OPCLASS_6, `SUBOP_MOVAur}
`define OPC_MOVDur {`OPCLASS_6, `SUBOP_MOVDur}
`define OPC_ADDAur {`OPCLASS_6, `SUBOP_ADDAur}
`define OPC_SUBAur {`OPCLASS_6, `SUBOP_SUBAur}
`define OPC_MOVAsr {`OPCLASS_6, `SUBOP_MOVAsr}
`define OPC_ADDAsr {`OPCLASS_6, `SUBOP_ADDAsr}
`define OPC_SUBAsr {`OPCLASS_6, `SUBOP_SUBAsr}
`define OPC_ADDAsi {`OPCLASS_6, `SUBOP_ADDAsi}
`define OPC_SUBAsi {`OPCLASS_6, `SUBOP_SUBAsi}
`define OPC_LEAso  {`OPCLASS_6, `SUBOP_LEAso}
`define OPC_ADRAso {`OPCLASS_6, `SUBOP_ADRAso}
`define OPC_CMPAur {`OPCLASS_6, `SUBOP_CMPAur}
`define OPC_TSTAur {`OPCLASS_6, `SUBOP_TSTAur}

// OPCLASS_7
`define SUBOP_BTP   4'b0000 // isa
`define SUBOP_JCCur 4'b0001 // µop & isa
`define SUBOP_JCCui 4'b0010 // µop & isa
`define SUBOP_BCCsr 4'b0011 // µop & isa
`define SUBOP_BCCso 4'b0100 // µop & isa
`define SUBOP_BALso 4'b0101 // µop & isa
`define SUBOP_JSRur 4'b0110 // isa
`define SUBOP_JSRui 4'b0111 // isa
`define SUBOP_BSRsr 4'b1000 // isa
`define SUBOP_BSRso 4'b1001 // isa
`define SUBOP_RET   4'b1010 // isa

`define OPC_BTP   {`OPCLASS_7, `SUBOP_BTP}
`define OPC_JCCur {`OPCLASS_7, `SUBOP_JCCur}
`define OPC_JCCui {`OPCLASS_7, `SUBOP_JCCui}
`define OPC_BCCsr {`OPCLASS_7, `SUBOP_BCCsr}
`define OPC_BCCso {`OPCLASS_7, `SUBOP_BCCso}
`define OPC_BALso {`OPCLASS_7, `SUBOP_BALso}
`define OPC_JSRur {`OPCLASS_7, `SUBOP_JSRur}
`define OPC_JSRui {`OPCLASS_7, `SUBOP_JSRui}
`define OPC_BSRsr {`OPCLASS_7, `SUBOP_BSRsr}
`define OPC_BSRso {`OPCLASS_7, `SUBOP_BSRso}
`define OPC_RET   {`OPCLASS_7, `SUBOP_RET}

// OPCLASS_8
`define SUBOP_PUSHur  4'b0000 // isa
`define SUBOP_PUSHAur 4'b0001 // isa
`define SUBOP_POPur   4'b0010 // isa
`define SUBOP_POPAur  4'b0011 // isa

`define OPC_PUSHur  {`OPCLASS_8, `SUBOP_PUSHur}
`define OPC_PUSHAur {`OPCLASS_8, `SUBOP_PUSHAur}
`define OPC_POPur   {`OPCLASS_8, `SUBOP_POPur}
`define OPC_POPAur  {`OPCLASS_8, `SUBOP_POPAur}

// OPCLASS_9

// OPCLASS_A

`define SUBOP_SRHLT  4'b0000 // µop & isa
`define SUBOP_SETSSP 4'b0001 // isa

`define OPC_SRHLT  {`OPCLASS_A, `SUBOP_SRHLT}
`define OPC_SETSSP {`OPCLASS_A, `SUBOP_SETSSP}

// OPCLASS_B

// OPCLASS_C

// OPCLASS_D

// OPCLASS_E

// OPCLASS_F

`define SUBOP_SRMOVur  4'b0000 // µop
`define SUBOP_SRMOVAur 4'b0001 // µop
`define SUBOP_SRJCCso  4'b0010 // µop
`define SUBOP_SRADDsi  4'b0011 // µop
`define SUBOP_SRSUBsi  4'b0100 // µop
`define SUBOP_SRSTso   4'b0101 // µop
`define SUBOP_SRLDso   4'b0110 // µop

`define OPC_SRMOVur {`OPCLASS_F, `SUBOP_SRMOVur}
`define OPC_SRJCCso {`OPCLASS_F, `SUBOP_SRJCCso}
`define OPC_SRADDsi {`OPCLASS_F, `SUBOP_SRADDsi}
`define OPC_SRSUBsi {`OPCLASS_F, `SUBOP_SRSUBsi}
`define OPC_SRSTso  {`OPCLASS_F, `SUBOP_SRSTso}
`define OPC_SRLDso  {`OPCLASS_F, `SUBOP_SRLDso}

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
