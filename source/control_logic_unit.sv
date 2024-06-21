typedef enum logic [2:0] {R = 0, I = 1, S = 2, SB = 3, UJ = 4, U = 5} inst_type;
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

module control_logic_unit(
    input logic [2:0] i_type,
    input logic [16:0] instruction,
    output logic [3:0] alu_op,
    output logic [2:0] branch_type,
    output logic reg_write_en, alu_mux_en, store_byte, 
    mem_to_reg, pc_absolute_jump_vec, load_byte, read_next_pc,
    write_mem, read_mem
);

always_comb begin
    if (i_type == R) begin
        branch_type = 3'd0;
        read_mem = 1'b0;
        mem_to_reg = 1'b0;
        write_mem = 1'b0;
        alu_mux_en = 1'b0;
        reg_write_en = 1'b1;
        store_byte = 1'b0;
        load_byte = 1'b0;
        pc_absolute_jump_vec = 1'b0;
        read_next_pc = 1'b0;

        case (instruction)
        /*
        17'b00000000000110011: begin alu_op = FOP_ADD; end
        17'b01000000000110011: begin alu_op = FOP_SUB; end
        17'b00000001000110011: begin alu_op = FOP_XOR; end
        17'b00000001100110011: begin alu_op = FOP_OR; end
        17'b00000001110110011: begin alu_op = FOP_AND; end
        17'b00000000010110011: begin alu_op = FOP_SLL; end
        17'b00000001010110011: begin alu_op = FOP_SRL; end
        17'b01000001010110011: begin alu_op = FOP_SRA; end
        // 17'b00000000100110011: begin alu_op = FOP_SLT; end
        // 17'b00000000110110011: begin alu_op = FOP_SLTU; end
        */
        17'b00000000000000011: begin end //lb
        17'b00000000100000011: begin end //lw
        17'b00000000000010011: begin end //addi
        17'b00000000010010011: begin end //slli
        17'b00000000100010011: begin end //slti
        17'b00000000110010011: begin end //sltiu
        17'b00000001000010011: begin end //xori
        17'b00000001010010011: begin end //srli
        17'b01000001010010011: begin end //srai
        17'b00000001100010011: begin end //ori
        17'b00000001110010011: begin end //andi
        17'b00000000000100011: begin end //sb
        17'b00000000100100011: begin end //sw
        17'b00000000000110011: begin end //add
        17'b01000000000110011: begin end //sub
        17'b00000000010110011: begin end //sll
        17'b00000000100110011: begin end //slt
        17'b00000000110110011: begin end //sltu
        17'b00000001000110011: begin end //xor
        17'b00000001010110011: begin end //srl
        17'b01000001010110011: begin end //sra
        17'b00000001100110011: begin end //or
        17'b00000001110110011: begin end //and
        17'b00000000000110111: begin end //lui
        17'b00000000011100011: begin end //beq
        17'b00000001001100011: begin end //bne
        17'b00000001011100011: begin end //blt
        17'b00000001101100011: begin end //bge
        17'b00000001111100011: begin end //bltu
        17'b00000000001100011: begin end //bgeu
        17'b00000000001100111: begin end //jalr
        17'b00000000001101111: begin end //jal





        endcase

    end

    else begin

        case (instruction)
        17'b0000000000001001: begin 
            branch_type = 3'b0;
            read_mem = 1'b0;
            mem_to_reg = 1'b0;
            write_mem = 1'b0;
            alu_mux_en = 1'b1;
            store_byte = 1'b0;
            load_byte = 1'b0;
            pc_absolute_jump_vec = 1'b0;
            read_next_pc = 1'b0;

            alu_op = FOP_ADD;
        end
        endcase
    end


end





endmodule