`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/17/2025 03:50:36 PM
// Design Name: 
// Module Name: SIPO_Register_tb
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


// Testbench for SIPO Shift Register using Case Statement
module tb_sipo_shift_register;
    logic clk, rst, serial_in;
    logic [3:0] parallel_out;
    
    // Instantiate the SIPO Shift Register
    sipo_shift_register uut (
        .clk(clk),
        .rst(rst),
        .serial_in(serial_in),
        .parallel_out(parallel_out)
    );
    
    // Clock generation
    always #5 clk = ~clk; // Generate a clock with a period of 10 time units
    
    initial begin
        // Initialize signals
        clk = 0;
        rst = 1;
        serial_in = 0;
        #10 rst = 0; // Release reset
        
        // Apply serial data
        #10 serial_in = 1;
        #10 serial_in = 0;
        #10 serial_in = 1;
        #10 serial_in = 1;
        #10 serial_in = 0;
        #10 serial_in = 1;
        #50;
        $finish;
    end
    
    // Monitor outputs
    initial begin
        $monitor("Time=%0t | Serial_In=%b | Parallel_Out=%b", $time, serial_in, parallel_out);
    end
endmodule
