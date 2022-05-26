`timescale 1ns / 1ps


module Lab5(x, y, A, D, C, sum);

  input [3:0] x;
  input [3:0] y;
  output reg[7:0] A = 8'b11111110;
  output reg D = 1'b1;
  output [6:0] C;
  output wire[3:0] sum;
  add addition(.x(x),.y(y),.sum(sum));
  convert segment(.sum(sum), .C(C));
  
endmodule

