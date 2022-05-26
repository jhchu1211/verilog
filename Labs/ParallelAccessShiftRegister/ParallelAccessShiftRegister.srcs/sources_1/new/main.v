`timescale 1ns / 1ps
module main(R, L, w, Clock, Q);

  input [3:0] R;

  input L, w, Clock;// w is the serial input, L is the control

  output [3:0] Q;

  wire [3:0] Q;
  wire sClock;
  
  
  slowClock tim(Clock, sClock);

  muxdff Stage3 (w, R[3], L, sClock, Q[3]);

  muxdff Stage2 (Q[3], R[2], L, sClock, Q[2]);

  muxdff Stage1 (Q[2], R[1], L, sClock, Q[1]);

  muxdff Stage0 (Q[1], R[0], L, sClock, Q[0]);

endmodule



module muxdff (D0, D1, Sel, Clock, Q);

  input D0, D1, Sel, Clock;

  output reg Q;

  wire D;

  assign D = Sel ? D1 : D0;

  always @(posedge Clock)

        Q = D;

endmodule
