`timescale 1ns/1ps

module tb_task2;
reg clk;
reg rst;
reg w;
wire z;

task2 inst (.clk(clk),.rst(rst),.w(w),.z(z));

initial begin
clk = 0;
forever #5 clk = ~clk;
end

initial begin
rst = 1; w = 0;
#10 rst = 0;
#60 w = 1;
#60 w = 0;
#60 w = 1;
#60 w = 1;
#30 $stop;
end
endmodule
