`timescale 1ns / 1ps

module counter(Clock, Clear,  Q);
    input Clock;
    input Clear;
    output reg [2:0] Q;
    always @( posedge Clock, posedge Clear)
    begin
        if(Clear)
        begin
            Q <= 3'b000;
        end
        else
        begin
            Q <= Q + 1;
        end
        
    end
endmodule


