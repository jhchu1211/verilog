`timescale 1ns / 1ps

module sevseg(theNum, DisplayOnes);
    input [2:0] theNum;     // number in binary
    output reg [6:0] DisplayOnes;
    always @(theNum)
    begin

       case (theNum)
            0: DisplayOnes=7'b0000001;   //0
            1: DisplayOnes=7'b1001111;   //1
            2: DisplayOnes=7'b0010010;   //2
            3: DisplayOnes=7'b0000110;   //3
            4: DisplayOnes=7'b1001100;   //4
            5: DisplayOnes=7'b0100100;   //5
            6: DisplayOnes=7'b0100000;   //6
            7: DisplayOnes=7'b0001111;
            //8: DisplayOnes=7'b0000000;
            //9: DisplayOnes=7'b0001100;
       endcase
    end
endmodule