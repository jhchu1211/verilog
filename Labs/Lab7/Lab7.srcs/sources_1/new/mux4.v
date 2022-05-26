`timescale 1ns / 1ps


module mux4(select, A, B, C, D, dis);
input [1:0] select;
input [3:0] A, B, C ,D;
output reg [3:0] dis;
always @(select or A or B or C or D)
if(select==2'b00) dis = A;
else if(select==2'b01) dis = B;
else if(select==2'b10) dis = C;
else if(select==2'b11) dis = D;
endmodule
