`timescale 1ns / 1ps

module zero_99( 
input clock, 
input reset, 
output a, 
output b, 
output c, 
output d, 
output e, 
output f, 
output g, 
output dp, 
output [7:0]an
); 
reg [3:0]first; //register for the first digit 
reg [3:0]second; //register for the second digit 
reg [23:0] delay; //register to produce the 0.1 second delay 
//wire test; 


always @ (posedge clock or posedge reset) 
begin 
if (reset) 
delay <= 0; 
else 
delay <= delay + 1; 
end 
assign test = &delay; //AND each bit of delay with itself; test will be high only when all bits 
//of delay are high 


always @ (posedge test or posedge reset) 
begin 
if (reset) begin 
first <= 0; 
second <= 0; 
end 
else if (first==4'd9) begin  //x9 reached 
first <= 0; 
if (second == 4'd9) //99 reached 
second <= 0; 
else 
second <= second + 1; 
end 
else 
first <= first + 1; 
end


//Multiplexing circuit below 
localparam N = 18; 
reg [N-1:0]count; 
always @ (posedge clock or posedge reset) 
begin 
if (reset) 
count <= 0; 
else 
count <= count + 1; 
end 
reg [6:0]sseg; 
reg [7:0]an_temp; 


always @ (*) 
begin 
case(count[N-1:N-2]) // This reads the top 2 bits (N-1 and N-2), which are the 17th and 16th bits of count.// each digit is displayed for a short time, then the next digit, etc. This is "multiplexing".
                     // count[17:16] have 4 possible states: 00, 01, 10, 11 — which is perfect for controlling 4 digits.
   2'b00 :  
    begin 
     sseg = first; 
     an_temp = 8'b11111110; 
    end 
    
   2'b01: 
    begin 
     sseg = second; 
     an_temp = 8'b11111101; 
    end 
    
   2'b10: 
    begin 
     sseg = 6'ha; //unknown sent to produce '-' 
     an_temp = 8'b11111011; 
    end 
     
   2'b11: 
    begin 
     sseg = 6'ha; //unknown sent to produce '-' 
     an_temp = 8'b11110111; 
    end 
  endcase 
 end 
assign an = an_temp; 
 

reg [6:0] sseg_temp;  
always @ (*) 
 begin 
case(sseg) 
4'd0 : sseg_temp = 7'b1000000; //0 
4'd1 : sseg_temp = 7'b1111001; //1 
4'd2 : sseg_temp = 7'b0100100; //2 
4'd3 : sseg_temp = 7'b0110000; //3 
4'd4 : sseg_temp = 7'b0011001; //4 
4'd5 : sseg_temp = 7'b0010010; //5 
4'd6 : sseg_temp = 7'b0000010; //6 
4'd7 : sseg_temp = 7'b1111000; //7 
4'd8 : sseg_temp = 7'b0000000; //8 
4'd9 : sseg_temp = 7'b0010000; //9 
default : sseg_temp = 7'b0111111; //dash 
endcase 
end 

assign {g, f, e, d, c, b, a} = sseg_temp;  
assign dp = 1'b1; //we dont need the decimal here so turn all of them off
endmodule
