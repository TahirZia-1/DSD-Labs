`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/25/2025 04:07:20 PM
// Design Name: 
// Module Name: mux_5to1
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


module mux_5to1(
    input u,v,w,x,y,
    input [2:0] sel,
    output reg m
    );
    always @(*) begin
        case (sel)
            3'b000: m = u;
            3'b001: m = v;
            3'b010: m = w;
            3'b011: m = x;
            3'b100: m = y;
            default: m = 3'b000; // Default case to avoid latches
        endcase
    end
    
    endmodule

