`timescale 1ns / 1ps

module mux_2to1(
input x,
input y,
input s,
output m
    );
    assign m =(~s&x)|(s&y);
    
endmodule

