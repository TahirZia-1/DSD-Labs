module consec(z,clk,rst,in);
input clk,rst,in;
output reg z;
//reg [3:0]cs,ns;

(* fsm_encoding = "gray" *) reg [3:0] cs,ns;
always@(posedge clk) begin
if (rst) begin
cs <= 4'b0000;
end else begin
cs <= ns;
end
end

always@(*) begin
case(cs)

4'b0000:
begin
z=0;
if(in==0)
ns=4'b0101;
else 
ns=4'b0001;
end

4'b0001:
begin
z=0;
if(in==0)
ns=4'b0101;
else
ns=4'b0010;
end

4'b0010:
begin
z=0;
if(in==0)
ns=4'b0101;
else
ns=4'b0011;
end

4'b0011:
begin
z=0;
if(in==0)
ns=4'b0101;
else 
ns=4'b0100;
end

4'b0100:
begin 
z=1;
if(in==0)
ns=4'b0101;
else begin 
ns=4'b0100;
end
end

4'b0101:
begin
z=0; 
if(in==0)
ns=4'b0110;
else 
ns=4'b0001;
end

4'b0110:
begin
z=0; 
if(in==0)
ns=4'b0111;
else 
ns=4'b0001;
end

4'b0111:
begin
z=0;
if(in==0)
ns=4'b1000;
else 
ns=4'b0001;
end

4'b1000:
begin
z=1;
if(in==0)begin
ns=4'b1000;
end
else
ns=4'b0001;
end

default:
begin
z=0;
ns=0;
end

endcase
end

endmodule
