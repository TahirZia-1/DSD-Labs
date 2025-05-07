`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/17/2025 03:28:20 PM
// Design Name: 
// Module Name: async_down_counter_tb
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


module async_down_counter_tb();
logic clk, rst;
    logic [3:0] count;

    // Instantiate the Asynchronous Down Counter
    async_down_counter_case uut (
        .clk(clk),
        .rst(rst),
        .count(count)
    );

    // Clock generation
    always #5 clk = ~clk; // Generate a clock with a period of 10 time units

    initial begin
        // Initialize signals
        clk = 0;
        rst = 1;
        #10 rst = 0; // De-assert reset
        
        // Run the counter for some time
        #160;
        rst = 1; // Apply reset
        #10 rst = 0;
        #50;
        $finish;
    end

    // Monitor output
    initial begin
        $monitor("Time=%0t | Count=%b", $time, count);
    end
endmodule

