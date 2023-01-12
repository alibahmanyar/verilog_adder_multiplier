// Verilog Test Fixture Template

`timescale 1 ns / 1 ps

module carry_save_multiplier_tb;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;

    // Outputs
	wire [7:0] out;

	// Instantiate the Unit Under Test (UUT)
	carry_save_multiplier uut (
		.a(a), 
		.b(b),  
		.out(out)
	);

	initial begin
		// Initialize Inputs
		a = 4'd9;
		b = 4'd7;
		
	end
      
endmodule
