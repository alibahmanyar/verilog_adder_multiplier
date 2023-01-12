`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:32:01 01/12/2023
// Design Name:   normal_multiplier
// Module Name:   /media/ali/Drive/Uni/7/Computer Architecture/proj1/Multipliers/normal_multiplier_tb.v
// Project Name:  Multipliers
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: normal_multiplier
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module normal_multiplier_tb;

	// Inputs
	reg clk;
	reg [15:0] a;
	reg [15:0] b;

	// Outputs
	wire [31:0] out;
	wire finished;

	// Instantiate the Unit Under Test (UUT)
	normal_multiplier uut (
		.clk(clk), 
		.a(a), 
		.b(b), 
		.out(out),
		.finished(finished)
	);

	initial begin 
		forever begin
			clk = 0;
			#10 clk = ~clk;
	end end

	initial begin
		
		// Initialize Inputs
		clk = 0;
		a = 16'd1234;
		b = 16'd4321;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end

	always 
    	#5  clk =  ! clk;
      
endmodule

