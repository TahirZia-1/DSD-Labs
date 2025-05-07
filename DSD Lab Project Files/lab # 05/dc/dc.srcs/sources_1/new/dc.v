`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2025 07:49:32 PM
// Design Name: 
// Module Name: dc
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


module segments(
input [5:0] number,
output reg [13:0] segments
 );
always@*
case(number)
6'd00: segments = 14'b0111111_0111111; // 0
6'd01: segments = 14'b0111111_0000110; // 1
6'd02: segments = 14'b0111111_1011011; // 2
6'd03: segments = 14'b0111111_1001111; // 3
6'd04: segments = 14'b0111111_1100110; // 4
6'd05: segments = 14'b0111111_1101101; // 5
6'd06: segments = 14'b0111111_1111101; // 6
6'd07: segments = 14'b0111111_0000111; // 7
6'd08: segments = 14'b0111111_1111111; // 8
6'd09: segments = 14'b0111111_1101111; // 9
6'd10: segments = 14'b0000110_0111111; // 10
6'd11: segments = 14'b0000110_0000110; // 11
6'd12: segments = 14'b0000110_1011011; // 12
6'd13: segments = 14'b0000110_1001111; // 13
6'd14: segments = 14'b0000110_1100110; // 14
6'd15: segments = 14'b0000110_1101101; // 15
6'd16: segments = 14'b0000110_1111101; // 16
6'd17: segments = 14'b0000110_0000111; // 17
6'd18: segments = 14'b0000110_1111111; // 18
6'd19: segments = 14'b0000110_1101111; // 19
6'd20: segments = 14'b1011011_0111111; // 20
6'd21: segments = 14'b1011011_0000110; // 21
6'd22: segments = 14'b1011011_1011011; // 22
6'd23: segments = 14'b1011011_1001111; // 23
6'd24: segments = 14'b1011011_1100110; // 24
6'd25: segments = 14'b1011011_1101101; // 25
6'd26: segments = 14'b1011011_1111101; // 26
6'd27: segments = 14'b1011011_0000111; // 27
6'd28: segments = 14'b1011011_1111111; // 28
6'd29: segments = 14'b1011011_1101111; // 29
6'd30: segments = 14'b1001111_0111111; // 30
endcase
endmodule
//Clock Module
module clock(
input clk,
input reset,
output reg [6:0] segments,
output reg [7:0]anodes
 );
reg [32:0] count;
reg clr_count;
reg [4:0] sec;
reg clr_sec;
reg [2:0] min;
reg clr_min;
reg [2:0] hrs;
reg clr_hrs;
wire [6:0] sec_mss;
wire [6:0] sec_lss;
wire [6:0] mins_mss;
wire [6:0] mins_lss;
wire [6:0] hrs_mss;
wire [6:0] hrs_lss;
reg [31:0] seg_count;
// Count
always@(posedge clk)
if(reset || clr_count) count <= #1 0;
else count <= #1 count+1;
// always@* clr_count = count == 33'd5_999_999_999;
always@* clr_count = count == 33'd99_999_999;
always@(posedge clk)
if(reset || clr_sec) sec <= #1 0;
else if(clr_count) sec <= #1 sec+1;
always@* clr_sec = clr_count & (sec == 6'd30);
always@(posedge clk)
if(reset || clr_min) min <= #1 0;
else if(clr_sec) min <= #1 min+1;
always@* clr_min = clr_sec & (min == 5'd2);
always@(posedge clk)
if(reset || clr_hrs) hrs <= #1 0;
else if(clr_min) hrs <= #1 hrs+1;
always@* clr_hrs = clr_sec & (min == 5'd2) & (hrs == 5'd2);
// Segments
segments sec_seg(
.number ({1'b0,sec}),
.segments ({sec_mss,sec_lss})
 );
 
segments mins_seg(
.number ({3'b0,min}),
.segments ({mins_mss,mins_lss})
 );
segments hrs_seg(
.number ({3'b0,hrs}),
.segments ({hrs_mss,hrs_lss})
 );
// Segments counter
always@(posedge clk)
if(reset) seg_count <= #1 0;
else seg_count <= #1 seg_count+1;
always@*
case(seg_count[19:17])
3'd0: segments = ~sec_lss;
 3'd1: segments = ~sec_mss;
3'd2: segments = ~mins_lss;
3'd3: segments = ~mins_mss;
3'd4: segments = ~hrs_lss;
3'd5: segments = ~hrs_mss;
default: segments = 0;
endcase
always@*
case(seg_count[19:17])
3'd0: anodes = 8'b11111110;
 3'd1: anodes = 8'b11111101;
3'd2: anodes = 8'b11111011;
3'd3: anodes = 8'b11110111;
3'd4: anodes = 8'b11101111;
3'd5: anodes = 8'b11011111;
default: anodes = 8'b11111111;
endcase
endmodule
