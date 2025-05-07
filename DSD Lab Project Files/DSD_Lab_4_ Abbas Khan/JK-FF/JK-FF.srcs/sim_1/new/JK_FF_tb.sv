`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/17/2025 02:47:04 PM
// Design Name: 
// Module Name: JK_FF_tb
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


module JK_FF_tb;
 logic clk, rst, j, k;
   logic q, q_bar;

   // Instantiate the JK flip-flop
   JK_FF uut (
       .clk(clk),
       .rst(rst),
       .j(j),
       .k(k),
       .q(q),
       .q_bar(q_bar)
   );

   // Clock generation
   always #5 clk = ~clk; // Generate a clock with a period of 10 time units

   initial begin
       // Initialize signals
       clk = 0;
       rst = 1; j = 0; k = 0;
       #10 rst = 0; // De-assert reset
       
       // Apply test cases
       #10 j = 0; k = 0; // No change
       #10 j = 0; k = 1; // Reset
       #10 j = 1; k = 0; // Set
       #10 j = 1; k = 1; // Toggle
       #10 j = 0; k = 0; // No change
       #10 j = 1; k = 1; // Toggle
       #10 rst = 1; // Apply reset
       #10 rst = 0; j = 1; k = 0; // Set after reset
       #20 $finish;
   end

   // Monitor output
   initial begin
       $monitor("Time=%0t | J=%b K=%b | Q=%b Q_bar=%b", $time, j, k, q, q_bar);
   end
endmodule

