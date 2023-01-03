`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:27:57 01/03/2023 
// Design Name: 
// Module Name:    carry_select_adder 
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
// `include "FA.v"
`include "ripple_adder.v"

module carry_select_adder(
        input [15:0] a,
        input [15:0] b,
        input c_in,
        output [15:0] out,
        output c_out
    );

    wire [2:0] c;

    ripple_adder #(4) rca1(
        .a(a[3:0]),
        .b(b[3:0]),
        .c_in(c_in),
        .out(out[3:0]),
        .c_out(c[0]));

    
    csa_slice csa_slice1(
        .a(a[7:4]),
        .b(b[7:4]),
        .c_in(c[0]),
        .out(out[7:4]),
        .c_out(c[1]));

    csa_slice csa_slice2(
        .a(a[11:8]),
        .b(b[11:8]),
        .c_in(c[1]),
        .out(out[11:8]), 
        .c_out(c[2]));

    csa_slice csa_slice3(
        .a(a[15:12]),
        .b(b[15:12]),
        .c_in(c[2]),
        .out(out[15:12]),
        .c_out(c_out));
    
endmodule

module csa_slice( // carry select adder 4-bit slice; optimum slice size for 16 bits is sqrt(16) = 4
        input [3:0] a,
        input [3:0] b,
        input c_in,
        output [3:0] out,
        output c_out
    );

    wire [3:0] s0, s1;
    wire c0, c1;

    ripple_adder #(4) rca1(
        .a(a[3:0]),
        .b(b[3:0]),
        .c_in(1'b0),
        .out(s0[3:0]),
        .c_out(c0));

    ripple_adder #(4) rca2(
        .a(a[3:0]),
        .b(b[3:0]),
        .c_in(1'b1),
        .out(s1[3:0]),
        .c_out(c1));

    mux2X1 #(4) ms0(
        .in0(s0[3:0]),
        .in1(s1[3:0]),
        .sel(c_in),
        .out(out[3:0]));

    mux2X1 #(1) mc0(
        .in0(c0),
        .in1(c1),
        .sel(c_in),
        .out(c_out));
endmodule


module mux2X1(in0,in1,sel,out);
    parameter N=16;
    input [N-1:0] in0,in1;
    input sel;
    output [N-1:0] out;

    assign out=(sel)?in1:in0;
endmodule
