`timescale 1us/1ns

// Decimal counter built from a 74HC161-like binary counter plus
// active-low asynchronous clear generated when Q = 1010.
module decimal_counter (
    input  wire clk,
    input  wire ext_clr_n,
    input  wire en,
    output reg  [3:0] q,
    output wire decode_10,
    output wire clr_n
);
    assign decode_10 = q[3] & ~q[2] & q[1] & ~q[0];

    // A small gate delay makes the asynchronous clear pulse visible in GTKWave.
    assign #2 clr_n = ext_clr_n & ~decode_10;

    always @(posedge clk or negedge clr_n) begin
        if (!clr_n) begin
            q <= 4'b0000;
        end else if (en) begin
            q <= q + 4'b0001;
        end
    end
endmodule
