`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/17/2025 02:40:54 PM
// Design Name: 
// Module Name: JK-FF
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

// JK Flip-Flop Implementation in SystemVerilog
module JK_FF(
input logic clk,    // Clock input
    input logic rst,    // Asynchronous reset
    input logic j,      // J input
    input logic k,      // K input
    output logic q,     // Output Q
    output logic q_bar  // Complement of Q
);
    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            q <= 0;
        else begin
            case ({j, k})
                2'b00: q <= q;        // No change
                2'b01: q <= 0;        // Reset
                2'b10: q <= 1;        // Set
                2'b11: q <= ~q;       // Toggle
            endcase
        end
    end
    assign q_bar = ~q;
endmodule
