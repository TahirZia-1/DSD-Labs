`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/05/2025 11:33:09 AM
// Design Name: 
// Module Name: Barrel8_shifter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Barrel8_shifter(
  input logic [7:0] data,
    input logic [2:0] amt,
    output logic [7:0] result
);
    always_comb begin
        case (amt)
            3'd0: result = data;
            3'd1: result = {data[0], data[7:1]};
            3'd2: result = {data[1:0], data[7:2]};
            3'd3: result = {data[2:0], data[7:3]};
            3'd4: result = {data[3:0], data[7:4]};
            3'd5: result = {data[4:0], data[7:5]};
            3'd6: result = {data[5:0], data[7:6]};
            3'd7: result = {data[6:0], data[7]};
            default: result = data; // Default case (should not occur)
        endcase
    end
endmodule
