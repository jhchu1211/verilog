`timescale 1ns / 1ps

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


