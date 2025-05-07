`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/05/2025 11:19:28 AM
// Design Name: 
// Module Name: 8bit_barrel_shifter
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


module Eightbit_barrel_shifter(
 logic [7:0] data;
    logic [2:0] amt;
    logic [7:0] result;
    
    barrel_shifter uut (.data(data), .amt(amt), .result(result));
    
    initial begin
        $monitor("Time=%0t, data=%b, amt=%d, result=%b", $time, data, amt, result);
        data = 8'b11010110;
        for (amt = 0; amt < 8; amt = amt + 1) #10;
        $stop;
    end
endmodule
