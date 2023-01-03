`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:23:57 01/03/2023 
// Design Name: 
// Module Name:    carry_la_adder 
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
module carry_la_adder(
        input [15:0] a,
        input [15:0] b,
        input c_in,
        output [15:0] out,
        output c_out
    );

    wire [15:0] carry_la; // carry look ahead bits

    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin
            FA fa (.a(a[i]), .b(b[i]), .c_in(carry_la[i]), .c_out(), .out(out[i]));
        end
    endgenerate

    assign carry_la[0] = c_in;

    genvar j;
    generate
        for (j = 1; j < 16; j = j + 1) begin
            assign carry_la[j] = (a[j-1] & b[j-1]) | ((a[j-1] | b[j-1]) & carry_la[j-1]);
        end
    endgenerate
    
endmodule

