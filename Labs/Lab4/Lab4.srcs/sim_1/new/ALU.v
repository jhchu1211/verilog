`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/18/2021 03:25:40 PM
// Design Name: 
// Module Name: ALU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU(S, A, B, F);
    input[2:0] S;
    input[3:0] A,B;
    output reg[3:0] F;
    
    always @(S,A,B)
        case(S)
            0:F=4'b0000;
            1:F=B-A;
            2:F=A-B;
            3:F=A+B;
            4:F=A^B;
            5:F=A|B;
            6:F=A&B;
            7:F=4'b1111;
        endcase
endmodule
