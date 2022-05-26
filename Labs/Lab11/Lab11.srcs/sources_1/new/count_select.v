`timescale 1ns / 1ps


module count_select(clock, load, sel);
input clock, load;
output sel;

wire [2:0] c;
counter count_selectStage0(clock, load, c);
check count_selectStage1(c, sel);

endmodule

module counter(clock, load, c);
input clock, load;
output reg [2:0] c;
reg stop;
//wire reset;
//assign reset = ~load;
always@(posedge clock)
begin

if(c==3'b111 || stop == 1'b1)
begin
stop <= 1;
end
else if(load)
c <= c+1;
if(!load)
begin
c<=0;
stop <=0;
end
end

endmodule

module check(c, sel);
input [2:0] c;
output reg sel;

always@(*)
case(c)
    3'b111:
        sel = 1;
    default:
        sel = 0;
endcase        

endmodule