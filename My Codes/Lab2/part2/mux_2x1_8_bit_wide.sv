module mux_2x1 (
  input logic x,y,s,
  output logic m);
  assign m = s ? y:x;
endmodule

module final_code (
  input logic [7:0] x,y,
  input logic s,
  output logic [7:0] m);
  mux_2x1 m1 (x[0],y[0],s,m[0]);
  mux_2x1 m2 (x[1],y[1],s,m[1]);
  mux_2x1 m3 (x[2],y[2],s,m[2]);
  mux_2x1 m4 (x[3],y[3],s,m[3]);
  mux_2x1 m5 (x[4],y[4],s,m[4]);
  mux_2x1 m6 (x[5],y[5],s,m[5]);
  mux_2x1 m7 (x[6],y[6],s,m[6]);
  mux_2x1 m8 (x[7],y[7],s,m[7]);
endmodule
