// Verilog Test Fixture Template

`timescale 1 ns / 1 ps

module array_multiplier_tb;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;

    // Outputs
	wire [7:0] out;

	// Instantiate the Unit Under Test (UUT)
	array_multiplier uut (
		.a(a), 
		.b(b),  
		.out(out)
	);

	initial begin
		// Initialize Inputs
		a = 4'd7;
		b = 4'd8;
		
	end
      
endmodule
