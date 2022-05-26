`timescale 1ns / 1ps

module main(CLK, Load, par_input, LED);
input CLK, Load;
output [7:0] LED;
input [7:0] par_input;
//output reg [7:0] AN = 8'b11111110;
//output reg DP = 1'b1;
// [6:0] C;
wire slowclk;
wire [7:0] W;       //the shifted inputs
wire [2:0] count;  
wire select;
wire d;
wire p;
slowclkgen(CLK, slowclk);
shift(par_input, Load, slowclk, W);
counter(slowclk, Load, count);
oddParityGen(slowclk, Load, W[0], p);
selectD(count, select);
mux(W[0], p, select, d);
displayLED(count, Load, d,slowclk,LED);
//displayLED(Load, p,slowclk,LED);
//sevseg(count, C);
endmodule
