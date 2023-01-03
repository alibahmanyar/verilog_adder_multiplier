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
module ripple_adder
        #(parameter N=16)(
        input [N-1:0] a,
        input [N-1:0] b,
        input c_in,
        output [N-1:0] out,
        output c_out
    );

    wire [N-2:0] cw; // carry wires cw[i] marks c_out[i] being connected to c_in[i+1] 

    FA fa0 (.a(a[0]), .b(b[0]), .c_in(c_in), .c_out(cw[0]), .out(out[0]));

    genvar i;
    generate
        for (i = 1; i < N-1; i = i + 1) begin
            FA fa1 (.a(a[i]), .b(b[i]), .c_in(cw[i-1]), .c_out(cw[i]), .out(out[i]));
        end
    endgenerate

    FA fa2 (.a(a[N-1]), .b(b[N-1]), .c_in(cw[N-2]), .c_out(c_out), .out(out[N-1]));
endmodule
