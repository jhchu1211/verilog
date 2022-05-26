`timescale 1ns / 1ps


module main(clk, r, ix, tape, duct, i, d);
input clk, r; 
input [2:0] ix;
input [7:0] tape;
output [7:0] duct; //out-tape
output [2:0] i; //out-index
output d; //out-done
wire slow;

slowclkgen main0(clk, slow);
inp main1(slow, r, ix, tape, duct, i, d);
endmodule


module slowclkgen(clk, outsignal);
    input clk;
    output  outsignal;
    reg [26:0] counter;  
    reg outsignal;    
    always @ (posedge clk)   
        begin  
            counter = counter +1;  
            if (counter == 50_000_000)  //why is this a 0.5 Hz?
            begin
            outsignal=~outsignal;
            counter =0;
            end    
        end
endmodule