`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2021 02:01:12 PM
// Design Name: 
// Module Name: Adder4bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Adder4bit(X, Y, S, carryout);
    input [7:0] X, Y;
    output [7:0] S;
    output carryout;
    wire [7:1] C;
    Fulladd stage0 (X[0], Y[0], 0, S[0], C[1]);
    Fulladd stage1 (C[1], X[1], Y[1], S[1], C[2]);
    Fulladd stage2 (C[2], X[2], Y[2], S[2], C[3]);
    Fulladd stage3 (C[3], X[3], Y[3], S[3], C[4]);
    Fulladd stage4 (C[4], X[4], Y[4], S[4], C[5]);
    Fulladd stage5 (C[5], X[5], Y[5], S[5], C[6]);
    Fulladd stage6 (C[6], X[6], Y[6], S[6], C[7]);
    Fulladd stage7 (C[7], X[7], Y[7], S[7], carryout);
endmodule


