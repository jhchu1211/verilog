`timescale 1ns / 1ps

module shift(R, L, Clock, Q);
  input [7:0] R;
  input L, Clock;// w is the serial input, L is the control
  output [7:0] Q; 
  
  muxdff Stage7 (Q[0], R[7], L, Clock, Q[7]);
  muxdff Stage6 (Q[7], R[6], L, Clock, Q[6]);
  muxdff Stage5 (Q[6], R[5], L, Clock, Q[5]);
  muxdff Stage4 (Q[5], R[4], L, Clock, Q[4]);
  muxdff Stage3 (Q[4], R[3], L, Clock, Q[3]);
  muxdff Stage2 (Q[3], R[2], L, Clock, Q[2]);
  muxdff Stage1 (Q[2], R[1], L, Clock, Q[1]);
  muxdff Stage0 (Q[1], R[0], L, Clock, Q[0]);
endmodule

module muxdff (D0, D1, Sel, Clock, Q);
  input D0, D1, Sel, Clock;
  output reg Q;
  wire D;
  assign D = Sel ? D1 : D0;
  always @(posedge Clock)
        Q = D;
        
endmodule