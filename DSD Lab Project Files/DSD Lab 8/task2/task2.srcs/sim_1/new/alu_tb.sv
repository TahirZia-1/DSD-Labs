`timescale 1ns/1ps

module alu_tb;

reg [4:0] A;
reg [4:0] B;
reg [3:0] ALU_Sel;
wire [5:0] Result;

alu a (.A(A),.B(B),.ALU_Sel(ALU_Sel),.Result(Result));

initial begin
// Initialize Inputs
A = 0;
B = 0;
ALU_Sel = 0;
#10 ALU_Sel = 1;
#10 A = 1;
B = 2;
#10 A = 1;
B = 2;
ALU_Sel = 2;
#10 A = 1;
B = 2;
ALU_Sel = 3;
#10 A = 4;
B = 2;
ALU_Sel = 4;
#10 A = 4;
B = 2;
ALU_Sel = 6;
#100 $finish;
end


endmodule