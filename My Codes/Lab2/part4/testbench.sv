module tb_priority_encoder_4to2;
  // Testbench signals
  logic [3:0] In_A;
  logic [1:0] Out_y;

  // Instantiate the DUT (Device Under Test)
  priority_encoder_4to2 uut (
    .In_A(In_A),
    .Out_y(Out_y)
  );

  // Test sequence
  initial begin
    $display("Time | In_A  | Out_y");
    $display("----------------------");

    // Apply test cases
    In_A = 4'b0000; #10; $display("%4t |  %b  |  %b", $time, In_A, Out_y); // No active input
    In_A = 4'b0001; #10; $display("%4t |  %b  |  %b", $time, In_A, Out_y); // Priority at bit 0
    In_A = 4'b0010; #10; $display("%4t |  %b  |  %b", $time, In_A, Out_y); // Priority at bit 1
    In_A = 4'b0011; #10; $display("%4t |  %b  |  %b", $time, In_A, Out_y); // Bit 1 has priority over bit 0
    In_A = 4'b0100; #10; $display("%4t |  %b  |  %b", $time, In_A, Out_y); // Priority at bit 2
    In_A = 4'b0110; #10; $display("%4t |  %b  |  %b", $time, In_A, Out_y); // Bit 2 has priority over bit 1
    In_A = 4'b1000; #10; $display("%4t |  %b  |  %b", $time, In_A, Out_y); // Priority at bit 3
    In_A = 4'b1010; #10; $display("%4t |  %b  |  %b", $time, In_A, Out_y); // Bit 3 has priority over lower bits
    In_A = 4'b1111; #10; $display("%4t |  %b  |  %b", $time, In_A, Out_y); // Bit 3 dominates all

    $stop;  // Stop the simulation
  end
endmodule

  


