`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/25/2025 07:36:05 AM
// Design Name: 
// Module Name: mux_2to1_tb
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


module mux_2to1_tb();
reg X,Y,S;
wire M;

multiplexer_2to11_dut(.x(X),.y(Y),.s(S));

initial begin
X = 0; Y = 0;  S = 0;
X = 0; Y = 1;  S = 0;
X = 1; Y = 0;  S = 0;
X = 1; Y = 1;  S = 0;
#10

X = 0; Y = 0;  S = 1;
X = 0; Y = 1;  S = 1;
X = 1; Y = 0;  S = 1;
X = 1; Y = 1;  S = 1;
#10

$stop;
end

endmodule
