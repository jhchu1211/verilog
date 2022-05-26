`timescale 1ns / 1ps
module counter (Resetn, Clock, E, Q);

input Resetn, Clock, E;
output reg [2:0] Q;
always @(negedge Resetn, posedge Clock)
    begin
    if (Resetn)
        Q <= 0;
    else 
    begin
    if (E)
        Q <= Q + 1;
    end
    end
endmodule