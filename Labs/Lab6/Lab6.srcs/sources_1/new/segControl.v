`timescale 1ns / 1ps

module seg(input [7:0] y, output reg [6:0] C);
    always @*
        case(y)
            8'b00000001:
                C=7'b0000001;
            8'b00000010:
                C=7'b1001111;
            8'b00000100:
                C=7'b0010010;
            8'b00001000:
                C=7'b0000110;
            8'b00010000:
                C=7'b1001100;
            8'b00100000:
                C=7'b0100100;
            8'b01000000:
                C=7'b0100000;
            8'b10000000:
                C=7'b0001111;
            default: 
                C=7'b0000000;
        endcase
endmodule 