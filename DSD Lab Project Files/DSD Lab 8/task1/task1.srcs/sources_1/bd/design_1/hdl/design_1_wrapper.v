//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
//Date        : Thu Apr 10 15:14:33 2025
//Host        : PC-15 running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (P_0);
  output [7:0]P_0;

  wire [7:0]P_0;

  design_1 design_1_i
       (.P_0(P_0));
endmodule
