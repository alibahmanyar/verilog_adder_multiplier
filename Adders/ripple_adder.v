`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:19:03 01/03/2023 
// Design Name: 
// Module Name:    ripple_adder 
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
`include "FA.v"
module ripple_adder(
        input [15:0] a,
        input [15:0] b,
        input c_in,
        output [15:0] out,
        output c_out
    );

    wire [14:0] cw; // carry wires cw[i] marks c_out[i] being connected to c_in[i+1] 

    FA fa0 (.a(a[0]), .b(b[0]), .c_in(c_in), .c_out(cw[0]), .out(out[0]));

    genvar i;
    generate
        for (i = 1; i < 15; i = i + 1) begin
            FA fa1 (.a(a[i]), .b(b[i]), .c_in(cw[i-1]), .c_out(cw[i]), .out(out[i]));
        end
    endgenerate

    FA fa2 (.a(a[15]), .b(b[15]), .c_in(cw[14]), .c_out(c_out), .out(out[15]));
endmodule
