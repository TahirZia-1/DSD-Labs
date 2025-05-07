`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/30/2025 12:04:56 PM
// Design Name: 
// Module Name: barrel_shifter_tb
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


module tb_barrel_shifter;
    logic [7:0] data_in;
    logic [2:0] shift_amt;
    logic dir;
    logic [7:0] data_out;
    
    // Instantiate the barrel shifter module
    barrel_shifter uut (
        .data_in(data_in),
        .shift_amt(shift_amt),
        .dir(dir),
        .data_out(data_out)
    );
    
    initial begin
        // Monitor values
        $monitor("Time=%0t | data_in=%b | shift_amt=%d | dir=%b | data_out=%b", 
                 $time, data_in, shift_amt, dir, data_out);
        
        // Test cases
        data_in = 8'b10101010; shift_amt = 3'd0; dir = 0; #10;
        data_in = 8'b10101010; shift_amt = 3'd1; dir = 0; #10;
        data_in = 8'b10101010; shift_amt = 3'd2; dir = 0; #10;
        data_in = 8'b10101010; shift_amt = 3'd3; dir = 1; #10;
        data_in = 8'b10101010; shift_amt = 3'd4; dir = 1; #10;
        data_in = 8'b10101010; shift_amt = 3'd5; dir = 1; #10;
        
        // Stop simulation
        $stop;
    end
endmodule

