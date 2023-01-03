`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:22:56 01/03/2023 
// Design Name: 
// Module Name:    FA 
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
module FA(
        input a,  
        input b,  
        input c_in,  
        output c_out,  
        output out
    );
    wire x,y,z;

    HA ha1(.a(a),.b(b),.sum(x),.c_out(y));
    HA ha2(.a(x),.b(c_in),.sum(out),.c_out(z));

    or or1(c_out,y,z);
    
endmodule

            
module HA(
        input a,
        input b,
        output sum,
        output c_out
    );
 
    xor xor1(sum,a,b);
    and and1(c_out,a,b);
endmodule :HA