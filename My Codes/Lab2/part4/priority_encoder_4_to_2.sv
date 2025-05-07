module priority_encoder_4to2 (
    input  logic [3:0] In_A,
    output logic [1:0] Out_y
);
    always_comb begin
      if (In_A[3]==1'b1)        Out_y = 2'b11;
      else if (In_A[2]==1'b1)   Out_y = 2'b10;
      else if (In_A[1]==1'b1)   Out_y = 2'b01;
      else if (In_A[0]==1'b1)   Out_y = 2'b00;
        else                Out_y = 2'b00;
    end
endmodule