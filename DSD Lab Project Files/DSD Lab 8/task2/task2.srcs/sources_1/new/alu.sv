module alu (
 input [4:0] A, // First 2-bit input
 input [4:0] B, // Second 2-bit input
 input [3:0] ALU_Sel, // ALU select signal
 output reg [5:0] Result // Output result (3 bits to account for carry/borrow)
);
always @(*) begin
 case(ALU_Sel)
 3'b000: Result = 0; 
 3'b001: Result = A + B;
 3'b010: Result = A - B; 
 3'b011: Result = A & B;
 3'b100: Result = A / B;
 3'b101: Result = ~A;
 default: Result = Result;
 endcase
end
endmodule
