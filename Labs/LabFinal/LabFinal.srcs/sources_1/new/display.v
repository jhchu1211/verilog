`timescale 1ns / 1ps

module display(clock, a2, A, C);
input clock;
input [3:0] a2;
output [1:0] A;
output [6:0] C;
wire fClock;
wire [3:0] display;
wire [9:0] sev;
wire Q;
slowClock displayStage0(clock, fClock);
sevSegController displayStage1(fClock, A, Q);
mux2 displayStage2(Q, a2, a2, display);
decoder displayStage3(display, sev);
seg displayStage4(sev, C);
endmodule

module slowClock(clk, fast);    
 input clk;   
 output reg fast;  
 reg [26:0] count;
 always @ (posedge clk)    
 begin
        count = count +1;
        if (count == 125_000) //400Hz
        begin
            fast = ~fast;
            count = 0;
        end
 end
 endmodule

module sevSegController(sClock, A, Q);
input sClock;
output [1:0] A;
output Q;
wire [1:0] y;
segCounter sCount(sClock, Q);
twoDecoder dee(Q, y);
realDecoder deeDee(y,A);
endmodule

    module segCounter(Clock, Q);
input Clock;
output reg Q;
always @(posedge Clock)
    begin
        begin
            Q <= Q + 1;
        end
    end
endmodule

    module twoDecoder(input data,  output reg [1:0] y );
    always @(data)
        begin
            y=0;
            y[data]=1;
        end
endmodule

    module realDecoder(input [1:0] y, output reg [1:0] C);
    always @*
        case(y)
            2'b01:
                C=2'b10;
            2'b10:
                C=2'b10;
            default: 
                C=2'b11;
        endcase
endmodule 

module mux2(select, A, B,
dis);
input select;
input [3:0] A, B;

output reg [3:0] dis;
always @(select or A or B)
if(select==1'b0) dis = A;
else if(select==1'b1) dis = B;
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

/*
module display(octave, clock, A, C);
input [4:0] octave;
input clock;
output [7:0] A;
output [6:0] C;

wire [6:0] lower, upper;
//wire sClock;
wire [1:0] Q;
//slowClock displayStage0(clock, sClock);
number displayStage1(octave, lower, upper);
clockSegController displayStage2(clock, A, Q);
mux2 displayStage3(Q, lower, upper, C);
endmodule

module number(input [4:0] octave, output reg [6:0] C, reg [6:0] D);
integer upper;
integer lower;
always@(octave)
begin
lower = octave%10;
upper = octave/10;
upper= upper%10;
begin
case(lower)
0 : C=7'b0000001;
1 : C=7'b1001111;
2 : C=7'b0010010;
3 : C=7'b0000110;
4 : C=7'b1001100;
5 : C=7'b0100100;
6 : C=7'b0100000;
7 : C=7'b0001111;
8 : C=7'b0000000;
9 : C=7'b0000100;
default: C = 7'b0000001;
endcase
begin
case(upper)
0 : D =7'b0000001;
1 : D =7'b1001111;
2 : D =7'b0010010;
3 : D =7'b0000110;
4 : D =7'b1001100;
5 : D =7'b0100100;
6 : D =7'b0100000;
7 : D =7'b0001111;
8 : D = 7'b0000000;
9 : D =7'b0000100;
default: D = 7'b0000001;
endcase
    end
    end
    end


endmodule

module clockSegController(sClock, A, Q);
input sClock;
output [7:0] A;
output [1:0]Q;
wire [7:0] y;
segCounter sCount(sClock, Q);
twoDecoder dee(Q, y);
realDecoder deeDee(y,A);
endmodule

    module segCounter(Clock, Q);
input Clock;
output reg Q;
always @(posedge Clock)
    begin
        begin
            Q <= Q + 1;
        end
    end
endmodule
    module twoDecoder(input data,  output reg [1:0] y );
    always @(data)
        begin
            y=0;
            y[data]=1;
        end
endmodule
    module realDecoder(input [1:0] y, output reg [1:0] C);
    always @*
        case(y)
            2'b01:
                C=2'b10;
            2'b10:
                C=2'b01;
            default: 
                C=8'b00000000;
        endcase
endmodule 

module mux2(select, lower, upper, dis);
input [1:0] select;
input [6:0] lower, upper;
output reg [6:0] dis;
always @(select or lower or upper)
begin
if(select==2'b01) dis = lower;
else if(select==2'b10) dis = upper;
end

endmodule*/
/*
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
 endmodule*/