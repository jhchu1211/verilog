`timescale 1ns / 1ps



module segController(sClock, A, Q);
input sClock;
output [3:0] A;
output [1:0]Q;
wire [3:0] y;
segCounter sCount(sClock, Q);
twoDecoder dee(Q, y);
realDecoder deeDee(y,A);
endmodule

module segCounter(Clock, Q);
input Clock;
output reg [1:0] Q;
always @(posedge Clock)
    begin
        begin
            Q <= Q + 1;
        end
    end
endmodule

module twoDecoder(input [1:0] data,  output reg [3:0] y );
    always @(data)
        begin
            y=0;
            y[data]=1;
        end
endmodule

module realDecoder(input [3:0] y, output reg [3:0] C);
    always @*
        case(y)
            4'b0001:
                C=4'b1110;
            4'b0010:
                C=4'b1101;
            4'b0100:
                C=4'b1011;
            4'b1000:
                C=4'b0111;
            default: 
                C=4'b0000;
        endcase
endmodule  
