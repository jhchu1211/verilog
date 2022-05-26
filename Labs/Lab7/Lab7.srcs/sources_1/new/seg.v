`timescale 1ns / 1ps


module seg(input [9:0] y, output reg [6:0] C);
    always @*
        case(y)
            10'b0000000001:
                C=7'b0000001;
            10'b0000000010:
                C=7'b1001111;
            10'b0000000100:
                C=7'b0010010;
            10'b0000001000:
                C=7'b0000110;
            10'b0000010000:
                C=7'b1001100;
            10'b0000100000:
                C=7'b0100100;
            10'b0001000000:
                C=7'b0100000;
            10'b0010000000:
                C=7'b0001111;
            10'b0100000000:
                C=7'b0000000;
            10'b1000000000:
                C=7'b0000100;
            default: 
                C=7'b0000001;
        endcase
endmodule 
