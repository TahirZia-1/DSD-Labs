`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2025 05:13:23 AM
// Design Name: 
// Module Name: Multiplier_CSR_6x6
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

// Half Adder Module
module HA(sum, carry, a, b);
    output sum, carry;
    input a, b;
    assign sum = a ^ b;
    assign carry = a & b;
endmodule

// Full Adder Module
module FA(sum, carry, a, b, cin);
    output sum, carry;
    input a, b, cin;
    assign sum = a ^ b ^ cin;
    assign carry = (a & b) | (a & cin) | (b & cin);
endmodule

// 6x6 Carry Save Reduction Multiplier
module multiply6x6(product, A, B);
    output [11:0] product;
    input [5:0] A, B;

    wire [5:0] pp[5:0]; // Partial products

    // Generate partial products
    genvar i, j;
    generate
        for (i = 0; i < 6; i = i + 1) begin
            for (j = 0; j < 6; j = j + 1) begin
                assign pp[i][j] = A[j] & B[i];
            end
        end
    endgenerate

    // Intermediate wires for sum and carry
    wire s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, s16, s17;
    wire c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15, c16, c17;

    // Level 0
    HA HA1(product[1], c1, pp[0][1], pp[1][0]);
    FA FA1(s1, c2, pp[0][2], pp[1][1], pp[2][0]);
    FA FA2(s2, c3, pp[0][3], pp[1][2], pp[2][1]);
    FA FA3(s3, c4, pp[0][4], pp[1][3], pp[2][2]);
    FA FA4(s4, c5, pp[0][5], pp[1][4], pp[2][3]);
    HA HA2(s5, c6, pp[1][5], pp[2][4]);

    // Level 1
    FA FA5(s6, c7, s1, pp[3][0], c1);
    FA FA6(s7, c8, s2, pp[3][1], c2);
    FA FA7(s8, c9, s3, pp[3][2], c3);
    FA FA8(s9, c10, s4, pp[3][3], c4);
    FA FA9(s10, c11, s5, pp[3][4], c5);
    HA HA3(s11, c12, pp[3][5], c6);

    // Level 2
    FA FA10(s12, c13, s6, pp[4][0], c7);
    FA FA11(s13, c14, s7, pp[4][1], c8);
    FA FA12(s14, c15, s8, pp[4][2], c9);
    FA FA13(s15, c16, s9, pp[4][3], c10);
    FA FA14(s16, c17, s10, pp[4][4], c11);
    HA HA4(s17, product[10], pp[4][5], c12);

    // Final CPA Stage
    assign product[0] = pp[0][0];
    assign product[2] = s6;
    assign product[3] = s12;
    assign product[4] = s13;
    assign product[5] = s14;
    assign product[6] = s15;
    assign product[7] = s16;
    assign product[8] = s17;
    assign product[9] = c17;
    assign product[11] = 0; // Unused bit for 12-bit output

endmodule

