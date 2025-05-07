module regfile(
input regwrite, clk, rst,
input [4:0] regadd1, regadd2, wregadd,
input [31:0] data,
output reg [31:0] d1, d2
);

reg [31:0] r[31:0];

always@(posedge clk or negedge clk or posedge rst)
begin
    if(rst) begin
        for(integer i = 0; i < 32; i++) begin
            r[i] <= 32'd0;        
        end
            d1 <= 32'd0;
            d2 <= 32'd0;
     end
     else begin
        if (regwrite && clk ) begin
            if(wregadd != 5'b0) begin
                r[wregadd] <= data;
            end
        end
        else begin
            d1 <= r[regadd1];
            d2 <= r[regadd2];
        end
     end
end
endmodule