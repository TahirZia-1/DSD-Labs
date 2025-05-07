`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/30/2025 12:04:56 PM
// Design Name: 
// Module Name: barrel_shifter
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


module barrel_shifter (
    input  logic [7:0] data_in,  // 8-bit input data
    input  logic [2:0] shift_amt, // Shift amount (3-bit for 0-7 shift range)
    input  logic       dir,      // Shift direction (0 = left, 1 = right)
    output logic [7:0] data_out  // 8-bit output data
);

    always_comb begin
        case (shift_amt)
            3'd0: data_out = data_in;
            3'd1: data_out = dir ? (data_in >> 1) : (data_in << 1);
            3'd2: data_out = dir ? (data_in >> 2) : (data_in << 2);
            3'd3: data_out = dir ? (data_in >> 3) : (data_in << 3);
            3'd4: data_out = dir ? (data_in >> 4) : (data_in << 4);
            3'd5: data_out = dir ? (data_in >> 5) : (data_in << 5);
            3'd6: data_out = dir ? (data_in >> 6) : (data_in << 6);
            3'd7: data_out = dir ? (data_in >> 7) : (data_in << 7);
            default: data_out = 8'b0;
        endcase
    end
    
endmodule
