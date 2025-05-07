`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/25/2025 05:06:43 PM
// Design Name: 
// Module Name: mux_5to1_tb
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


module mux_5to1_tb();
reg V,U,W,X,Y;
reg [2:0] SEL;
 wire M;
 mux_5to1_tb_dut(.v(V),.u(U),.w(W),.x(X),.y(Y));
 
 initial begin
 // Initialize inputs
         V = 3'b000; U = 3'b001; W = 3'b010; X = 3'b011; Y = 3'b100;
         
          // Apply test cases
                $display("sel\ty");
                SEL = 3'b000; #10; $display("%b\t%b", SEL, M);
                SEL = 3'b001; #10; $display("%b\t%b", SEL, M);
                SEL = 3'b010; #10; $display("%b\t%b", SEL, M);
                SEL = 3'b011; #10; $display("%b\t%b", SEL, M);
                SEL = 3'b100; #10; $display("%b\t%b", SEL, M);
        
                // Test default case
                SEL = 3'b101; #10; $display("%b\t%b", SEL, M);
        
                $finish;
            endS
endmodule
