module tb_con;
reg clk, rst, in;
wire z;

consec inst (.z(z),.clk(clk),.rst(rst),.in(in));

initial begin
clk = 0;
forever #5 clk = ~clk;
end

initial begin
    rst = 1;
    in = 0;
    #10 rst = 0;
    #10 in = 1;
    #50
    #10 in = 0;
    #50
    #10 in = 1;
    #10 in = 0;
    #10 in = 0;
    #10 in = 1;
    #10 $stop;
  end
endmodule
