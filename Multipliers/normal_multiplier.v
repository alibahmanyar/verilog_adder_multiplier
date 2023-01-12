`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:40:57 01/12/2023 
// Design Name: 
// Module Name:    normal_multiplier 
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
module normal_multiplier
        #(parameter N=4)(
        input clk,
        input [N-1:0] a,
        input [N-1:0] b,
        output reg [2*N-1:0] out
    );


    reg [N-1:0] one = {N{1'b1}};
    reg [N-1:0] zero = {N{1'b0}};

    reg [2*N:0] res = {2*N{1'b0}};
    integer bn = 0; // bit number
    
    
    
    reg cb; //current bit
    
    always @(posedge clk) begin

        if (bn < N) begin
            cb = b[bn];

            if (bn == 0) begin
                case (cb)
                    0: res[2*N-1:N] = (a & zero);
                    1: res[2*N-1:N] = (a & one);
                endcase
            end else begin
                case (cb)
                    0: res[2*N:N] = res[2*N-1:N] + (a & zero);
                    1: res[2*N:N] = res[2*N-1:N] + (a & one);
                endcase

            end
            res = res >> 1;
            bn = bn + 1;
        end

        out = res;
    end
    

endmodule
