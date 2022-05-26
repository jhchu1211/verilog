`timescale 1ns / 1ps


module slowClock(clk, outsignal);    
 input clk;   
 output reg outsignal;
 reg [26:0] counter;    
 always @ (posedge clk)    
 begin
        counter = counter +1;  
        if (counter == 100_000_000) //why is this a 0.5 Hz?
        begin
            outsignal=~outsignal;
            counter =0;
        end   
 end
 endmodule
