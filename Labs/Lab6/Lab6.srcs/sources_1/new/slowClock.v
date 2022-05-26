`timescale 1ns / 1ps


module slowClock(clk, resetSW, outsignal);    
 input clk;   
 input resetSW;    
 output reg outsignal;
 reg [26:0] counter;    
 always @ (posedge clk)    
 begin
    if (resetSW)  
    begin
        counter=0;
        outsignal=0;  
    end
    else  
    begin  
        counter = counter +1;  
        if (counter == 100_000_000) //why is this a 0.5 Hz?
        begin
            outsignal=~outsignal;
            counter =0;
        end 
    end   
 end
 endmodule