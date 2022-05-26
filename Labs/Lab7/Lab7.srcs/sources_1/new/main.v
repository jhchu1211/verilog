`timescale 1ns / 1ps


module main(Clock, E, R, AN,A, C);
input Clock, E, R;
output [3:0] AN;
output reg [7:4] A = 4'b1111;
output [6:0] C;
wire [3:0] S; // checker
wire sClock, fClock, go1, go2;
wire [3:0] lowerSec, upperMin;;
wire [3:0] upperSec;
wire [3:0] lowerMin;
wire [1:0] Q;
wire [3:0] display;
wire [9:0] seven;
slowClock slowed(Clock, sClock, fClock);
second timTimmy(sClock, R, E, upperSec, lowerSec, upperMin, lowerMin, S);
segController segSeg(fClock, AN, Q);
mux4 muck(Q, lowerSec, upperSec, lowerMin, upperMin, display);
decoder uut(display, seven);
seg displayControl(seven, C);

endmodule
