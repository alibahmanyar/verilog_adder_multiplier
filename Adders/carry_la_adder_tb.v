// Verilog Test Fixture Template

`timescale 1 ns / 1 ps

module carry_la_adder_tb;

	// Inputs
	reg [15:0] a;
	reg [15:0] b;
	reg c_in;

	// Outputs
	wire c_out;
	wire [15:0] out;

	// Instantiate the Unit Under Test (UUT)
	carry_la_adder uut (
		.a(a), 
		.b(b), 
		.c_in(c_in), 
		.c_out(c_out), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		a = 16'd1;
		b = 16'd1;
		c_in = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		a = 16'd1;
		b = 16'd10;
		c_in = 0;
		#5;

        a = 16'd15;
		b = 16'd31;
		c_in = 0;
		#5;

        a = 16'd128;
		b = 16'd1478;
		c_in = 0;
		#5;

        a = 16'd94;
		b = 16'd333;
		c_in = 0;
		#5;
	end
      
endmodule

