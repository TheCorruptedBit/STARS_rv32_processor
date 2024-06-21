module alu_mux (
input logic [31:0] imm_gen, reg_b,
input logic alu_mux_en,
output logic [31:0] rdb
);
    always_comb
        if (alu_mux_en)
            rdb = reg_b;
        else
            rdb = imm_gen;
endmodule

typedef enum logic [3:0] {
    FOP_ADD = 0,
    FOP_SUB = 1,
    FOP_SLL = 2,
    FOP_SRL = 3,
    FOP_SRA = 4, 
    FOP_AND = 5,
    FOP_OR = 6, 
    FOP_XOR = 7,
    FOP_IMM = 8
    } fop_t;

module ALU (
input logic [31:0] rda, rdb,
input logic [3:0] fop,
output logic [31:0] result,
output logic Z, N
);

    always_comb begin
        case (fop)
            FOP_ADD : result = rda + rdb;
            FOP_SUB : result = rda - rdb;
            FOP_SLL : result = rda << rdb;
            FOP_SRL : result = rda >> rdb;
            FOP_SRA : result = rda >>> rdb;
            FOP_AND : result = rda & rdb;
            FOP_OR : result = rda | rdb;
            FOP_XOR : result = rda ^ rdb;
            FOP_IMM : result = rdb;
        endcase
    end

    assign Z = (result == 0) ? 1'b1 : 1'b0;
    assign N = (result < 0) ? 1'b1 : 1'b0;

endmodule