`timescale 1ns / 1ps

`include "FA.v"

module carry_save_multiplier(
        input [3:0] a,
        input [3:0] b,
        output [7:0] out
    );

    wire [3:0] sum_vec[3:0];
    wire [3:0] carry_vec[3:0];


    cell c00(a[0], b[0], 1'b0, 1'b0, sum_vec[0][0], carry_vec[0][0]);
    cell c01(a[1], b[0], 1'b0, carry_vec[0][0], sum_vec[0][1], carry_vec[0][1]);
    cell c02(a[2], b[0], 1'b0, carry_vec[0][1], sum_vec[0][2], carry_vec[0][2]);
    cell c03(a[3], b[0], 1'b0, carry_vec[0][2], sum_vec[0][3], carry_vec[0][3]);

    cell c10(a[0], b[1], sum_vec[0][1], 1'b0, sum_vec[1][0], carry_vec[1][0]);
    cell c11(a[1], b[1], sum_vec[0][2], carry_vec[1][0], sum_vec[1][1], carry_vec[1][1]);
    cell c12(a[2], b[1], sum_vec[0][3], carry_vec[1][1], sum_vec[1][2], carry_vec[1][2]);
    cell c13(a[3], b[1], carry_vec[0][3], carry_vec[1][2], sum_vec[1][3], carry_vec[1][3]);

    cell c20(a[0], b[2], sum_vec[1][1], 1'b0, sum_vec[2][0], carry_vec[2][0]);
    cell c21(a[1], b[2], sum_vec[1][2], carry_vec[2][0], sum_vec[2][1], carry_vec[2][1]);
    cell c22(a[2], b[2], sum_vec[1][3], carry_vec[2][1], sum_vec[2][2], carry_vec[2][2]);
    cell c23(a[3], b[2], carry_vec[1][3], carry_vec[2][2], sum_vec[2][3], carry_vec[2][3]);

    cell c30(a[0], b[3], sum_vec[2][1], 1'b0, sum_vec[3][0], carry_vec[3][0]);
    cell c31(a[1], b[3], sum_vec[2][2], carry_vec[3][0], sum_vec[3][1], carry_vec[3][1]);
    cell c32(a[2], b[3], sum_vec[2][3], carry_vec[3][1], sum_vec[3][2], carry_vec[3][2]);
    cell c33(a[3], b[3], carry_vec[2][3], carry_vec[3][2], sum_vec[3][3], carry_vec[3][3]);

    assign out[0] = sum_vec[0][0];
    assign out[1] = sum_vec[1][0];
    assign out[2] = sum_vec[2][0];
    assign out[3] = sum_vec[3][0];
    assign out[4] = sum_vec[3][1];
    assign out[5] = sum_vec[3][2];
    assign out[6] = sum_vec[3][3];
    assign out[7] = carry_vec[3][3];

endmodule

module cell(
    input b1, b2, b_i, c_i,
    output out, c_o);

    wire mult_res;
    assign mult_res = b1 & b2;
    FA adder(mult_res, b_i, c_i, out, c_o);

endmodule