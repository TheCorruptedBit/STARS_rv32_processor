module ram (
    input logic clk, rst,
    input logic [31:0] data_address, // alu result to be read or written
    input logic [31:0] instruction_address, // no brainer, it is the insturction address
    input logic dm_read_en, dm_write_en, // enable ports for the read and enable
    input logic [31:0] data_to_write, // data to be written into memory
    output logic [31:0] instruction_read, data_read // things we got from memory dude
);

logic [31:0] mem [4095:0];
initial $readmemh("cpu.mem", mem, 0, 4095);

always_ff @(posedge clk) begin
    if (dm_write_en && data_address[11]) begin
        mem[data_address[11:0]] <= data_to_write;
    end

end

always_ff @(posedge clk, negedge rst) begin
    if (!rst) begin
        data_read <= '0;
        instruction_read <= mem[32'b0];
    end

    else if (dm_read_en) begin
        data_read <= mem[data_address[11:0]];

    end
    
    else if (!dm_read_en) begin
        instruction_read <= mem[instruction_address];

    end

    else begin
        instruction_read <= 32'b00000000000000000000000000010011;
        data_read <= '0;

    end
end



endmodule