`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2021 02:03:42 PM
// Design Name: 
// Module Name: Fulladd
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


module Fulladd(Cin, x, y, s, Cout);
    input Cin, x, y;
    output s, Cout;
    assign s=x^y^Cin;
    assign Cout=(x&y)|(x&Cin)|(y&Cin);

endmodule
