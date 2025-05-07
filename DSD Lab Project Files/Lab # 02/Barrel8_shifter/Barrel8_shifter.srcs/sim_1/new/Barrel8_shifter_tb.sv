`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/05/2025 11:35:20 AM
// Design Name: 
// Module Name: Barrel8_shifter_tb
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


module Barrel8_shifter_tb();
logic [7:0] data;
    logic [2:0] amt;
    logic [7:0] result;
    
    Barrel8_shifter uut (.data(data), .amt(amt), .result(result));
    
    initial begin
        $monitor("Time=%0t, data=%b, amt=%d, result=%b", $time, data, amt, result);
        data = 8'b11010110;
        for (amt = 0; amt < 8; amt = amt + 1) #10;
        $stop;
    end
endmodule

