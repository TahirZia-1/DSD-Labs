`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/17/2025 03:03:54 PM
// Design Name: 
// Module Name: Up_Counter_4bit
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

 //// 4 bit sychronous up counter
module Up_Counter_4bit(

   input logic clk,    // Clock input
    input logic rst,    // Synchronous reset
    output logic [3:0] sync_count // 4-bit counter output
);
    always_ff @(posedge clk) begin
        if (rst)
            sync_count <= 0;
        else
            sync_count <= sync_count + 1;
    end
endmodule

