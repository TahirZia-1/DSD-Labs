module barrel_shifter_8_bit (
    input  logic [7:0] data,
    input  logic [2:0] amt,
    output logic [7:0] shifted_data
);
    always_comb begin
        case(amt)
            3'b000: shifted_data = data;
            3'b001: shifted_data = {1'b0, data[7:1]};
            3'b010: shifted_data = {2'b0, data[7:2]};
            3'b011: shifted_data = {3'b0, data[7:3]};
            3'b100: shifted_data = {4'b0, data[7:4]};
            3'b101: shifted_data = {5'b0, data[7:5]};
            3'b110: shifted_data = {6'b0, data[7:6]};  
            3'b111: shifted_data = {7'b0, data[7:7]};
        endcase
    end
endmodule
