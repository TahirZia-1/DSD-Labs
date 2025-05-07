module tb_mux_5x1;
  // Testbench signals
  logic [2:0] U, V, W, X, Y;  // 3-bit inputs
  logic [2:0] sel;            // 3-bit select signal
  logic [2:0] M;              // 3-bit output

  // Instantiate the MUX module
  mux_5x1 uut (
    .U(U),
    .V(V),
    .W(W),
    .X(X),
    .Y(Y),
    .sel(sel),
    .M(M)
  );

  // Test sequence
  initial begin
    // Monitor the values during simulation
    $display("Time | sel |  U  |  V  |  W  |  X  |  Y  |  M  ");
    $display("------------------------------------------------");

    // Assign test values
    U = 3'b000;
    V = 3'b001;
    W = 3'b010;
    X = 3'b011;
    Y = 3'b100;

    // Test all select values
    for (int i = 0; i < 8; i++) begin
      sel = i; // Set selection input
      #10;     // Wait for some time
      $display("%4t  | %b  | %b | %b | %b | %b | %b | %b", 
               $time, sel, U, V, W, X, Y, M);
    end

    $stop;  // Stop simulation
  end
endmodule


