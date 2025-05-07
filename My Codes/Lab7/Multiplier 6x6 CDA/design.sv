// Muhammad Tahir Zia 
// 2021465

module HA(sout, cout, a, b);
  output sout, cout;
  input a, b;
  assign sout = a ^ b;
  assign cout = a & b;
endmodule

module FA(sout, cout, a, b, cin);
  output sout, cout;
  input a, b, cin;
  assign sout = a ^ b ^ cin;
  assign cout = (a & b) | (a & cin) | (b & cin);
endmodule

module multiply6bits(product, inp1, inp2);
  output [11:0] product;
  input [5:0] inp1, inp2;
  
  wire [0:49] w;

  assign product[0] = inp1[0] & inp2[0];

  // ** Level 0 **
  HA HA1(product[1], w[0], inp1[1] & inp2[0], inp1[0] & inp2[1]);

  FA FA1(w[1], w[2], inp1[1] & inp2[1], inp1[0] & inp2[2], w[0]);
  FA FA2(w[3], w[4], inp1[1] & inp2[2], inp1[0] & inp2[3], w[2]);
  FA FA3(w[5], w[6], inp1[1] & inp2[3], inp1[0] & inp2[4], w[4]);
  FA FA4(w[7], w[8], inp1[1] & inp2[4], inp1[0] & inp2[5], w[6]);

  HA HA2(w[9], w[10], inp1[1] & inp2[5], w[8]);

  // ** Level 1 **
  HA HA3(product[2], w[11], w[1], inp1[2] & inp2[0]);

  FA FA5(w[12], w[13], w[3], inp1[2] & inp2[1], w[11]);
  FA FA6(w[14], w[15], w[5], inp1[2] & inp2[2], w[13]);
  FA FA7(w[16], w[17], w[7], inp1[2] & inp2[3], w[15]);
  FA FA8(w[18], w[19], w[9], inp1[2] & inp2[4], w[17]);
  FA FA9(w[20], w[21], w[10], inp1[2] & inp2[5], w[19]);

  // ** Level 2 **
  HA HA4(product[3], w[22], w[12], inp1[3] & inp2[0]);

  FA FA10(w[23], w[24], w[14], inp1[3] & inp2[1], w[22]);
  FA FA11(w[25], w[26], w[16], inp1[3] & inp2[2], w[24]);
  FA FA12(w[27], w[28], w[18], inp1[3] & inp2[3], w[26]);
  FA FA13(w[29], w[30], w[20], inp1[3] & inp2[4], w[28]);
  FA FA14(w[31], w[32], w[21], inp1[3] & inp2[5], w[30]);

  // ** Level 3 **
  HA HA5(product[4], w[33], w[23], inp1[4] & inp2[0]);

  FA FA15(w[34], w[35], w[25], inp1[4] & inp2[1], w[33]);
  FA FA16(w[36], w[37], w[27], inp1[4] & inp2[2], w[35]);
  FA FA17(w[38], w[39], w[29], inp1[4] & inp2[3], w[37]);
  FA FA18(w[40], w[41], w[31], inp1[4] & inp2[4], w[39]);
  FA FA19(w[42], w[43], w[32], inp1[4] & inp2[5], w[41]);

  // ** Level 4 **
  HA HA6(product[5], w[44], w[34], inp1[5] & inp2[0]);

  FA FA20(product[6], w[45], w[36], inp1[5] & inp2[1], w[44]);
  FA FA21(product[7], w[46], w[38], inp1[5] & inp2[2], w[45]);
  FA FA22(product[8], w[47], w[40], inp1[5] & inp2[3], w[46]);
  FA FA23(product[9], w[48], w[42], inp1[5] & inp2[4], w[47]);
  FA FA24(product[10], w[49], w[43], inp1[5] & inp2[5], w[48]);

  assign product[11] = w[49]; 
endmodule


