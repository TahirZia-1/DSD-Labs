`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/17/2025 03:26:29 PM
// Design Name: 
// Module Name: async_down_counter_case
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


module async_down_counter_case(
 input logic clk,    // Clock input
   input logic rst,    // Asynchronous reset
   output logic [3:0] count // 4-bit down counter output
);
   always_ff @(posedge clk or posedge rst) begin
       if (rst)
           count <= 4'b1111; // Start from max value
       else begin
           case (count)
               4'b1111: count <= 4'b1110;
               4'b1110: count <= 4'b1101;
               4'b1101: count <= 4'b1100;
               4'b1100: count <= 4'b1011;
               4'b1011: count <= 4'b1010;
               4'b1010: count <= 4'b1001;
               4'b1001: count <= 4'b1000;
               4'b1000: count <= 4'b0111;
               4'b0111: count <= 4'b0110;
               4'b0110: count <= 4'b0101;
               4'b0101: count <= 4'b0100;
               4'b0100: count <= 4'b0011;
               4'b0011: count <= 4'b0010;
               4'b0010: count <= 4'b0001;
               4'b0001: count <= 4'b0000;
               4'b0000: count <= 4'b1111; // Wrap around to max value
               default: count <= 4'b1111;
           endcase
       end
   end
endmodule

