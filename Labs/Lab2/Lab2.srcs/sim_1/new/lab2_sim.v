`timescale 1ns / 1ps

module lab2_sim;
reg x1, x2, x3;
wire f;

example uut(.x1(x1), .x2(x2), .x3(x3));
initial begin
 x1=0; x2=0; x3=0;
 #1 x1=0; x2=0; x3=1; 
 #1 x1=0; x2=1; x3=0; 
 #1 x1=0; x2=1; x3=1;
 #1 x1=1; x2=0; x3=0;
 #1 x1=1; x2=0; x3=1; 
 #1 x1=1; x2=1; x3=0; 
 #1 x1=1; x2=1; x3=1;
 end
endmodule
