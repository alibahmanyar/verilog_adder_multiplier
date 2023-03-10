`timescale 1ns / 1ps

`include "FA.v"

module array_multiplier(
        input [3:0] a,
        input [3:0] b,
        output [7:0]out
    );

    wire [39:0]w;

    and a1(w[0],a[0],b[0]);
    and a2(w[1],a[1],b[0]);
    and a3(w[2],a[2],b[0]);
    and a4(w[3],a[3],b[0]);

    and a5(w[4],a[0],b[1]);
    and a6(w[5],a[1],b[1]);
    and a7(w[6],a[2],b[1]);
    and a8(w[7],a[3],b[1]);

    and a9(w[8],a[0],b[2]);
    and a10(w[9],a[1],b[2]);
    and a11(w[10],a[2],b[2]);
    and a12(w[11],a[3],b[2]);

    and a13(w[12],a[0],b[3]);
    and a14(w[13],a[1],b[3]);
    and a15(w[14],a[2],b[3]);
    and a16(w[15],a[3],b[3]);

    FA f1(1'b0,w[1],w[4],w[16],w[17]);
    FA f2(1'b0,w[2],w[5],w[18],w[19]);
    FA f3(1'b0,w[3],w[6],w[20],w[21]);
    FA f4(w[8],w[17],w[18],w[22],w[23]);
    FA f5(w[9],w[19],w[20],w[24],w[25]);
    FA f6(w[10],w[7],w[21],w[26],w[27]);
    FA f7(w[12],w[23],w[24],w[28],w[29]);
    FA f8(w[13],w[25],w[26],w[30],w[31]);
    FA f9(w[14],w[11],w[27],w[32],w[33]);
    FA f10(1'b0,w[29],w[30],w[34],w[35]);
    FA f11(w[31],w[32],w[35],w[36],w[37]);
    FA f12(w[15],w[33],w[37],w[38],w[39]);

    assign out[0]=w[0];

    assign out[1]=w[16];
    assign out[2]=w[22];
    assign out[3]=w[28];
    assign out[4]=w[34];
    assign out[5]=w[36];
    assign out[6]=w[38];
    assign out[7]=w[39];

endmodule