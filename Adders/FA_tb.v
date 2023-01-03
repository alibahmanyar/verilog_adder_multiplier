`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:39:22 01/03/2023
// Design Name:   FA
// Module Name:   /media/ali/Drive/Uni/7/Computer Architecture/proj1/Adders/FA_tb.v
// Project Name:  Adders
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FA
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FA_tb;

	// Inputs
	reg a;
	reg b;
	reg c_in;

	// Outputs
	wire c_out;
	wire out;

	// Instantiate the Unit Under Test (UUT)
	FA uut (
		.a(a), 
		.b(b), 
		.c_in(c_in), 
		.c_out(c_out), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		a = 1;
		b = 0;
		c_in = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		a = 0;
		b = 0;
		c_in = 0;
		#5;
		a = 0;
		b = 0;
		c_in = 1;
		#5;  
		a = 0;
		b = 1;
		c_in = 0;
		#5;
		a = 0;
		b = 1;
		c_in = 1;
		#5;
		a = 1;
		b = 0;
		c_in = 0;
		#5;
		a = 1;
		b = 0;
		c_in = 1;
		#5;
		a = 1;
		b = 1;
		c_in = 0;
		#5;  
		a = 1;
		b = 1;
		c_in = 1;
		#5;

	end
      
endmodule

