`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/25/2025 12:51:04 AM
// Design Name: 
// Module Name: Eightbitwide_2to1_mux
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


module Eightbitwide_2to1_mux(
input[7:0] x,
input[7:0] y,
 input s,
output [7:0] m
    );
    
assign m[0] = (~s & x[0]) | (s & y[0]);
assign m[1] = (~s & x[1]) | (s & y[1]);
assign m[2] = (~s & x[2]) | (s & y[2]);
assign m[3] = (~s & x[3]) | (s & y[3]);
assign m[4] = (~s & x[4]) | (s & y[4]);
assign m[5] = (~s & x[5]) | (s & y[5]);
assign m[6] = (~s & x[6]) | (s & y[6]);
assign m[7] = (~s & x[7]) | (s & y[7]);
        
        
endmodule
