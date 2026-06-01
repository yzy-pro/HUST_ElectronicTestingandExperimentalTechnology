`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:58:07 05/20/2026
// Design Name:   led
// Module Name:   /home/yzy/code/ElectronicTestingandExperimentalTechnology/E8/Experiment/led/test.v
// Project Name:  led
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: led
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [3:0] led_out;
	
	parameter PERIOD = 10;

	// Instantiate the Unit Under Test (UUT)
	led uut (
		.clk(clk), 
		.reset(reset), 
		.led_out(led_out)
	);
	
	always begin
				clk = 1'b0;
				#(PERIOD / 2) clk=1'b1;
				#(PERIOD / 2);
	end

	initial begin
		// Initialize Inputs
		clk = 1'b0;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#500;
        
		// Add stimulus here
		reset = 0;

	end
      
endmodule

