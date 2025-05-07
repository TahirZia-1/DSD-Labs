module mux_5x1 (
    input  logic [2:0] U, V, W, X, Y,
    input  logic [2:0] sel,
    output logic [2:0] M
);
    always_comb begin
        case(sel)
            3'b000: M = U;
            3'b001: M = V;
            3'b010: M = W;
            3'b011: M = X;
            3'b100: M = Y;
            default: M = Y;
        endcase
    end
endmodule