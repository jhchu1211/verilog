`timescale 1ns / 1ps

module shift_reg(in, clock,Load, ww);
input [6:0] in;
input clock;
input Load;
output reg ww;
wire [6:0] w;
    
    shift Stage6 ( w[0], in[6], Load, clock, w[6] ) ;
    shift Stage5 ( w[6], in[5], Load, clock, w[5] ) ;
	shift Stage4 ( w[5], in[4], Load, clock, w[4] ) ;
    shift Stage3 ( w[4], in[3], Load, clock, w[3] ) ;
    shift Stage2 ( w[3], in[2], Load, clock, w[2] ) ;
    shift Stage1 ( w[2], in[1], Load, clock, w[1] ) ;
    shift Stage0 ( w[1], in[0], Load, clock, w[0] ) ;
 always@*
 case (w[0])
    1'b0:
        ww = 0;
    1'b1:
        ww = 1;
    endcase
endmodule

    module shift(shiftedW, pInput, load, Clock, W) ;
    input shiftedW, pInput, load, Clock , load ;
    output reg W ;
    wire D ;
    assign D = load ? pInput : shiftedW ;
    
	always @ (posedge Clock)
        W = D ;

    endmodule //*/