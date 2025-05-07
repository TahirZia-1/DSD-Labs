`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/25/2025 02:17:36 AM
// Design Name: 
// Module Name: Eightbitwide_2to1_mux_tb
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


module Eightbitwide_2to1_mux_tb();
reg [7:0]X;
reg [7:0]Y;
reg S;
wire [7:0] M;

Eightbitwide_2to1_mux_dut(.x(X),.y(Y),.s(S),.m(M));
initial begin
 // Test case 1: s = 0, M should follow X
       X = 8'b00001111;
       Y = 8'b11110000;
       S = 0;
       #10;  // Wait for 10 time units

       // Test case 2: s = 1, M should follow Y
       S = 1;
       #10;
       // Test case 3: Different values for X and Y, s = 0
               X = 8'b10101010;
               Y = 8'b01010101;
               S = 0;
               #10;
       
               // Test case 4: Different values for X and Y, s = 1
               S = 1;
               #10;
       
               // Test case 5: Both X and Y are equal, output should match regardless of s
               X = 8'b11111111;
               Y = 8'b11111111;
               S = 0;
               #10;
               S = 1;
               #10;
       
               // Test case 6: Both X and Y are zero
               X = 8'b00000000;
               Y = 8'b00000000;
               S = 0;
               #10;
               S = 1;
               #10;
             $stop;

end
endmodule
