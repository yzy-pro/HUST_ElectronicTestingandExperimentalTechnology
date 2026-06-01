`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:15:09 05/20/2026 
// Design Name: 
// Module Name:    led 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module led(
    input clk,
    input reset,
    output [3:0] led_out
);

reg [26:0] counter;

always @(posedge clk)
    if (reset)
        counter <= 0;
    else
        counter <= counter + 1;

assign led_out = counter[26:23];

endmodule
