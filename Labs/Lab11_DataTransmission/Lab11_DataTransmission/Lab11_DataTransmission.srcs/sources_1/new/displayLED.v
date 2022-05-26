`timescale 1ns / 1ps
module displayLED(counter, load, D, clk, LED);
    input D, load;
    input clk;
    input [2:0] counter;
    output reg [7:0] LED;

    always@(posedge clk, posedge load)
    begin
        if(load)
        begin
            LED = 8'b00000000;
        end
        else
        begin
            case(counter)
            3'b000: LED[0] = D ;
            3'b001: LED[1] = D ;
            3'b010: LED[2] = D ;
            3'b011: LED[3] = D ;
            3'b100: LED[4] = D ;
            3'b101: LED[5] = D ;
            3'b110: LED[6] = D ;
            3'b111: LED[7] = D ;
            default: LED = 8'b00000000 ;
            endcase

        end
    end

endmodule
