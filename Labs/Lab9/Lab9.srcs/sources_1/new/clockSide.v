`timescale 1ns / 1ps


module clockSide(Clock, E, R, a1, a2, a3, a4,AE, AN, C, go);
input Clock, E, R;
input [3:0] a1, a2, a3, a4;
input AE;
output [7:0] AN;
output [6:0] C;
output go;
wire [3:0] S; // checker
wire sClock, fClock, go1, go2;
wire [3:0] lowerSec, upperMin;
wire [3:0] upperSec;
wire [3:0] lowerMin;
wire [7:0] Q;
wire [3:0] display;
wire [9:0] seven;
slowClock clockStage0(Clock, sClock, fClock);
second clockStage1(sClock, R, E, upperSec, lowerSec, upperMin, lowerMin, S);
compare clockStageCheck(sClock,AE, a1, a2, a3, a4, upperMin, lowerMin, upperSec, lowerSec, go);
clockSegController clockStage2(fClock, AN, Q);
mux4 clockStage3(Q, lowerSec, upperSec, lowerMin, upperMin, a4, a3, a2, a1, display);
decoder clockStage4(display, seven);
seg clockStage5(seven, C);
endmodule

module slowClock(clk, outsignal, fast);    
 input clk;   
 output reg outsignal;
 output reg fast;
 reg [26:0] counter;    
 reg [26:0] count;
 always @ (posedge clk)    
 begin
        counter = counter +1;  
        count = count +1;
        if (counter == 50_000_000) //1Hz
        begin
            outsignal=~outsignal;
            counter =0;
        end 
        if (count == 125_000) //400Hz
        begin
            fast = ~fast;
            count = 0;
        end
 end
 endmodule
 
module second(Clock,Reset, E, upSec, lowSec, upMin, lowMin, checker);
input Clock,Reset, E;
output [3:0]upSec;
output [3:0]lowSec;
output [3:0]upMin;
output [3:0]lowMin;
output [3:0]checker; // juan
lowlowerSec low(Reset,Clock, E, lowSec, upSec, lowMin, upMin, checker);
endmodule

    module lowlowerSec(Reset, Clock, E, Q1,Q2,Q3,Q4,check);
input  Reset, Clock, E;
output reg [3:0] Q1;
output reg [3:0] Q2;
output reg [3:0] Q3;
output reg [3:0] Q4;
output reg [3:0] check; //juan
reg go, go2;
reg advance;
reg [1:0] start;
always@(E)
check = Q1;
always @(posedge Reset, posedge Clock)
begin
      if((Q1==4'b0000&&Q2==4'b0000&&Q3==4'b0000&&Q4==4'b0000)&&start!=2'b10)
      begin
        Q2=4'b0101;
        Q3=4'b1001;
        Q4=4'b0001;
        start=2'b01;
      end
      go = 1'b0;
      go2 = 1'b0;
      advance = 1'b0;
      if (E)
        begin
            Q1 <= Q1 + 1;
            start = 2'b10;

        end
        if (Q1[3:0]==4'b1001)
        begin
            Q1 <= 0;
            go = 1'b1;
        end   
        if (go==1'b1)
        begin
            Q2 <= Q2 + 1;
            if(Q2[3:0]==4'b0101)
            begin 
                Q2 <= 0;
                advance = 1'b1;
            end
        end
        if (advance==1'b1)
        begin
            Q3 <= Q3+ 1;
            if(Q3[3:0]==4'b1001)
            begin 
                Q3 <= 0;
                go2 = 1'b1;
            end
        end
        if (go2==1'b1)
        begin
            Q4 <= Q4 + 1;
            
            if(Q4[3:0]==4'b0101)
            begin 
                Q4 <= 0;
            end
        end    
        if(Reset)
        begin 
            Q1 <= 0;
            Q2 <= 0;
            Q3 <= 0;
            Q4 <= 0;
        end       
end    
endmodule

module compare(clock, alEn, alarmUpMin, alarmLowMin, alarmUpSec, alarmLowSec, clockUpMin,
clockLowMin,clockUpSec, clockLowSec, go);
input clock;
input alEn;
input [3:0] alarmUpMin, alarmLowMin,alarmUpSec, alarmLowSec, clockUpMin;
input [3:0] clockLowMin,clockUpSec, clockLowSec;
output reg go = 0;
always@(posedge clock)
begin
    if(alEn)
    begin
        if(alarmUpMin==clockUpMin && alarmLowMin==clockLowMin && alarmUpSec==clockUpSec && alarmLowSec==clockLowSec)
        go = 1;
    end
    else
    go = 0;
end
endmodule

module clockSegController(sClock, A, Q);
input sClock;
output [7:0] A;
output [2:0]Q;
wire [7:0] y;
segCounter sCount(sClock, Q);
twoDecoder dee(Q, y);
realDecoder deeDee(y,A);
endmodule

    module segCounter(Clock, Q);
input Clock;
output reg [2:0] Q;
always @(posedge Clock)
    begin
        begin
            Q <= Q + 1;
        end
    end
endmodule

    module twoDecoder(input [2:0] data,  output reg [7:0] y );
    always @(data)
        begin
            y=0;
            y[data]=1;
        end
endmodule

    module realDecoder(input [7:0] y, output reg [7:0] C);
    always @*
        case(y)
            8'b00000001:
                C=8'b11111110;
            8'b00000010:
                C=8'b11111101;
            8'b00000100:
                C=8'b11111011;
            8'b00001000:
                C=8'b11110111; // here split
            8'b00010000:
                C=8'b11101111;
            8'b00100000:
                C=8'b11011111;
            8'b01000000:
                C=8'b10111111;
            8'b10000000:
                C=8'b01111111;
            default: 
                C=8'b00000000;
        endcase
endmodule 

module mux4(select, A, B, C, D, 
E, F, G, H,
dis);
input [2:0] select;
input [3:0] A, B, C ,D;
input [3:0] E, F, G, H;
output reg [3:0] dis;
always @(select or A or B or C or D or E or F or G or H)
if(select==3'b000) dis = A;
else if(select==3'b001) dis = B;
else if(select==3'b010) dis = C;
else if(select==3'b011) dis = D;
else if(select==3'b100) dis = E;
else if(select==3'b101) dis = F;
else if(select==3'b110) dis = G;
else if(select==3'b111) dis = H;
endmodule

module decoder(input [3:0] data,  output reg [9:0] y );
    always @(data)
        begin
            y=0;
            y[data]=1;
        end
endmodule

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