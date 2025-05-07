`timescale 1ns/1ps

module regfile_tb;

reg clk, regwrite, rst;
reg [4:0] rr1, rr2, wr;
reg [31:0] data;
wire [31:0] d1, d2;

regfile rf(.regwrite(regwrite), .clk(clk), .rst(rst), .regadd1(rr1), .regadd2(rr2), .wregadd(wr),.data(data),.d1(d1), .d2(d2));

always #5 clk = ~clk;

initial begin
clk = 0;
rst = 1;
rr1 = 5'd1;
rr2 = 5'd2;
regwrite = 0;
#10 
rst = 0;
data = 32'd100;
wr = 5'd2;
regwrite = 1;
#10
rr1 = 5'd1;
rr2 = 5'd2;
regwrite = 0;
#100
$finish;
end
endmodule