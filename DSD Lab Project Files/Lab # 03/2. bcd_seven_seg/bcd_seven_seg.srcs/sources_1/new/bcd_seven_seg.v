`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/08/2025 07:05:20 PM
// Design Name: 
// Module Name: bcd_seven_seg
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


module hex_decoder (
    input [3:0] bin,
    output reg [6:0] seg
);
    always @(*) begin
        case (bin)
            4'b0000: seg = 7'b1000000; // 0  common anode types O(ON) and 1 (Off) gfedcba
            4'b0001: seg = 7'b1111001; // 1
            4'b0010: seg = 7'b0100100; // 2
            4'b0011: seg = 7'b0110000; // 3
            4'b0100: seg = 7'b0011001; // 4
            4'b0101: seg = 7'b0010010; // 5
            4'b0110: seg = 7'b0000010; // 6
            4'b0111: seg = 7'b1111000; // 7
            4'b1000: seg = 7'b0000000; // 8
            4'b1001: seg = 7'b0010000; // 9
            default: seg = 7'b1111111; // Blank display for invalid BCD inputs
        endcase
    end
endmodule

module top_module (
    input [3:0] SW,        // 4-bit switch input (BCD input 0-9)
    output [6:0] HEX0,     // 7-segment display output
    output [7:0] AN        // Common anode control for Nexys 4 DDR
);
    // Instantiate hex_decoder for BCD to 7-segment display conversion
    hex_decoder h0 (.bin(SW[3:0]), .seg(HEX0));

    // Enable only one seven-segment display (Active-Low Configuration)
    assign AN = 8'b11111100; // Enable only AN0, disable others
endmodule