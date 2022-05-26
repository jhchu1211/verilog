`timescale 1ns / 1ps

module main(Clock, reset, E, A, D, C, data);
input Clock=0;
input reset;

input E;
output reg[7:0] A = 8'b11111110;
output reg D = 1'b1;
output [6:0] C;
wire sClock;
output [2:0]data;
wire[7:0] y;

slowClock tim(Clock, reset, sClock); 
counter uut(reset,sClock, E, data);
decoder decode(.data(data), .y(y)); //0 being decoded
seg segment(.y(y), .C(C));//0 here

endmodule
