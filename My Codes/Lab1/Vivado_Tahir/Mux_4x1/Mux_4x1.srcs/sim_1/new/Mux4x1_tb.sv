`timescale 1ns / 100ps

module mux4x1_tb;
logic w,x,y,z;
logic [1:0] sel;
logic out;

mux4x1 m1(.b(x), .a(w), .c(y), .d(z), .out(out), .s(sel)); // module instantiate


initial
begin

w = 1'b0; x = 1; y = 0; z = 1; sel = 2'b00;
#1;
// $display("a = %b, b = %b, c = %b, d = %b, sel = %d, out = %b", w,x,y,z,sel,out); 

#10;
sel = 2'b01;

#10;
sel = 2'd2;

#10;
sel = 2'd3;

#10;
$stop;
$finish;

end

initial
begin
$monitor("a = %b, b = %b, c = %b, d = %b, sel = %d, out = %b", w,x,y,z,sel,out); 
end


endmodule;