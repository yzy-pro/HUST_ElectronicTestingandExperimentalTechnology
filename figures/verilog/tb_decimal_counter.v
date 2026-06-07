`timescale 1us/1ns

module tb_decimal_counter;
    reg clk = 1'b0;
    reg ext_clr_n = 1'b1;
    reg en = 1'b1;
    wire [3:0] q;
    wire q0 = q[0];
    wire q1 = q[1];
    wire q2 = q[2];
    wire q3 = q[3];
    wire decode_10;
    wire clr_n;

    // 1 kHz square wave: period = 1 ms = 1000 us.
    always #500 clk = ~clk;

    decimal_counter dut (
        .clk(clk),
        .ext_clr_n(ext_clr_n),
        .en(en),
        .q(q),
        .decode_10(decode_10),
        .clr_n(clr_n)
    );

    initial begin
        $dumpfile("decimal_counter.vcd");
        $dumpvars(0, tb_decimal_counter);

        // Generate a real active-low asynchronous clear pulse before counting.
        #100 ext_clr_n = 1'b0;
        #100 ext_clr_n = 1'b1;

        // Run long enough to show two complete 0..9 cycles.
        #22000 $finish;
    end
endmodule
