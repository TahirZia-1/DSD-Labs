`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/17/2025 03:48:56 PM
// Design Name: 
// Module Name: SIPO_Register
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


module sipo_shift_register (
    input logic clk,           // Clock input
    input logic rst,           // Asynchronous reset
    input logic serial_in,     // Serial data input
    output logic [3:0] parallel_out  // Parallel data output
);
    logic [3:0] shift_reg; // 4-bit shift register

    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            shift_reg <= 4'b0000; // Clear shift register on reset
        else begin
            case (1'b1) // Always true case condition
                1'b1: shift_reg <= {shift_reg[2:0], serial_in}; // Shift left
                default: shift_reg <= shift_reg;
            endcase
        end
    end
    
    assign parallel_out = shift_reg; // Output entire shift register as parallel output
endmodule
