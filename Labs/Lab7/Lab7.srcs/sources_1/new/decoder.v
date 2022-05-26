`timescale 1ns / 1ps


module decoder(input [3:0] data,  output reg [9:0] y );
    always @(data)
        begin
            y=0;
            y[data]=1;
        end
endmodule
