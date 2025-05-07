module tb_final;
  // Testbench signals
  logic [7:0] x, y;  // Inputs
  logic s;           // Select signal
  logic [7:0] m;     // Output

  // Instantiate the 'final' module
  final_code uut (
    .x(x),
    .y(y),
    .s(s),
    .m(m)
  );

  // Test sequence
  initial begin
    $display("Time |  s  |    x    |    y    |    m    ");
    $display("-------------------------------------------------");

    // Test Case 1: Select x (s=0)
    x = 8'b10101010;
    y = 8'b01010101;
    s = 0;
    #10;
    $display("%4t  |  %b  | %b | %b | %b", $time, s, x, y, m);

    // Test Case 2: Select y (s=1)
    s = 1;
    #10;
    $display("%4t  |  %b  | %b | %b | %b", $time, s, x, y, m);

    // Test Case 3: All 1s in y, All 0s in x, s=1
    x = 8'b00000000;
    y = 8'b11111111;
    s = 1;
    #10;
    $display("%4t  |  %b  | %b | %b | %b", $time, s, x, y, m);

    // Test Case 4: Random values, s=0
    x = 8'b11001100;
    y = 8'b00110011;
    s = 0;
    #10;
    $display("%4t  |  %b  | %b | %b | %b", $time, s, x, y, m);

    // Test Case 5: Random values, s=1
    s = 1;
    #10;
    $display("%4t  |  %b  | %b | %b | %b", $time, s, x, y, m);

    $stop;  // Stop simulation
  end
endmodule

