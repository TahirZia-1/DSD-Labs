`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2025 07:20:32 PM
// Design Name: 
// Module Name: ripple_adder_tb
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


module ripple_adder_tb();
reg [3:0] A, B;
    reg cin;
    wire [3:0] sum;
    wire cout;
    
    ripple_carry_adder RCA (.A(A), .B(B), .cin(cin), .sum(sum), .cout(cout));
    
    initial begin
        $monitor("A = %b, B = %b, Cin = %b -> Sum = %b, Cout = %b", A, B, cin, sum, cout);
        
        A = 4'b0000; B = 4'b0000; cin = 0; #10;
        A = 4'b0001; B = 4'b0010; cin = 0; #10;
        A = 4'b0110; B = 4'b0011; cin = 1; #10;
        A = 4'b1111; B = 4'b1111; cin = 1; #10;
        
        $finish;
    end
endmodule

