`timescale 1ns/1ps

module part5_tb;
    // Testbench signals
    logic [7:0] data;
    logic [2:0] amt;
    logic [7:0] shifted_data;

    // Instantiate the barrel shifter module
    barrel_shifter_8_bit uut (
        .data(data),
        .amt(amt),
        .shifted_data(shifted_data)
    );

    // Testbench procedure
    initial begin
        // Display header
        $display("Time |  amt  |   data   | shifted_data");
        $display("--------------------------------------");

        // Apply test cases
        data = 8'b10101010; amt = 3'b000; #10;
        $display("%4t |  %b  | %b |   %b", $time, amt, data, shifted_data);

        data = 8'b10101010; amt = 3'b001; #10;
        $display("%4t |  %b  | %b |   %b", $time, amt, data, shifted_data);

        data = 8'b10101010; amt = 3'b010; #10;
        $display("%4t |  %b  | %b |   %b", $time, amt, data, shifted_data);

        data = 8'b10101010; amt = 3'b011; #10;
        $display("%4t |  %b  | %b |   %b", $time, amt, data, shifted_data);

        data = 8'b11110000; amt = 3'b100; #10;
        $display("%4t |  %b  | %b |   %b", $time, amt, data, shifted_data);

        data = 8'b11110000; amt = 3'b101; #10;
        $display("%4t |  %b  | %b |   %b", $time, amt, data, shifted_data);

        data = 8'b00001111; amt = 3'b110; #10;
        $display("%4t |  %b  | %b |   %b", $time, amt, data, shifted_data);

        data = 8'b00001111; amt = 3'b111; #10;
        $display("%4t |  %b  | %b |   %b", $time, amt, data, shifted_data);

        // End simulation
        $stop;
    end
endmodule


  


