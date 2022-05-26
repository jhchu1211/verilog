`timescale 1ns / 1ps


module slowClock(clk, outsignal, fast);    
 input clk;   
  
 output reg outsignal;
 output reg fast;
 reg [26:0] counter;    
 reg [26:0] count;
 always @ (posedge clk)    
 begin
        counter = counter +1;  
        count = count +1;
        if (counter == 50_000_000) //1Hz
        begin
            outsignal=~outsignal;
            counter =0;
        end 
        if (count == 125_000) //400Hz
        begin
            fast = ~fast;
            count = 0;
        end
 end
 endmodule