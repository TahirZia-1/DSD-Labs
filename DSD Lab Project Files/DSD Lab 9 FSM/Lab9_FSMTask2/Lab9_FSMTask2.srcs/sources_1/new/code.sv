module task2(z,clk,rst,w);
input clk,rst,w;
output reg z;

reg [3:0]store,store2;

always@(posedge clk) begin
if (rst) begin
store <= 0;
store2<=0;
z <= 0;
end
else
store<= {store,w};
store2<= {store2,w};

if (store == 4'b0000 || store2 == 4'b1111) begin
z <= 1;
end
else
z <= 0;
end
endmodule