`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/18/2021 05:51:56 PM
// Design Name: 
// Module Name: main
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


module main(d,clock, A, D, C); 
  input d,clock;
  output reg[7:0] A = 8'b11111110;
  output reg D = 1'b1;
  output [6:0] C;
  wire[7:0] y;
  wire [2:0] data;
  decoder uut(.data(data), .y(y));  
  seg segment(.y(y), .C(C));
  
  // uut stands for “Unit Under Test”, which is declared as an ‘object’ of module “decoder”
 
endmodule

