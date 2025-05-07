`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/17/2025 03:06:59 PM
// Design Name: 
// Module Name: Up_Counter_4bit_tb
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


module Up_Counter_4bit_tb();
 logic clk, rst;
   logic [3:0]  sync_count;
   // Instantiate Synchronous Counter
       Up_Counter_4bit uut_sync (
           .clk(clk),
           .rst(rst),
           .sync_count(sync_count)
       );
   
       // Clock generation
       always #5 clk = ~clk; // Generate a clock with a period of 10 time units
   
       initial begin
           // Initialize signals
           clk = 0;
           rst = 1;
           #10 rst = 0; // De-assert reset
           
           // Run the counter for some time
           #100;
           rst = 1; // Reset counters
           #10 rst = 0;
           #50;
           $finish;
       end
   
       // Monitor output
       initial begin
           $monitor("Time=%0t | Sync_Count=%b", $time, sync_count);
       end
   endmodule

