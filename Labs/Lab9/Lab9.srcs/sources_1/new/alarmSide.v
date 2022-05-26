`timescale 1ns / 1ps


module alarmSide(aE, aS, Clock, bMI, bMD, bSI, bSD, eLED,
a1, a2, a3, a4);
input aE, aS, Clock;
input bMI, bMD, bSI, bSD;
output eLED;

output [3:0] a1, a2, a3, a4;

wire [9:0] sev;
wire [3:0] temp_a1, temp_a2, temp_a3, temp_a4;
assign temp_a1 = a1; assign temp_a2 = a2; 
assign temp_a3 = a3; assign temp_a4 = a4;
wire [3:0] a1_inc, a1_dec, a2_inc,a2_dec;
wire [3:0] a3_inc, a3_dec, a4_inc,a4_dec;
minuteSet alarmStage0(temp_a1, temp_a2,Clock, aS, 
bMI, bMD,a1_inc, a1_dec, a2_inc,a2_dec);

minuteSet alarmStage1(temp_a3, temp_a4,Clock, aS, 
bSI, bSD,a3_inc, a3_dec, a4_inc,a4_dec);

choose alarmStage2(bMI, bMD, bSI, bSD, a1_inc, a1_dec, a2_inc,a2_dec,
a3_inc, a3_dec, a4_inc,a4_dec, a1, a2, a3, a4);

alarmOn alarmStage6(aE, eLED);
endmodule

module minuteSet(a1, a2, clock,s,minuteI, minuteDec, 
a1_inc, a1_dec, a2_inc,a2_dec);
input [3:0] a1, a2;
input clock;
input s, minuteI, minuteDec;
output reg [3:0] a1_inc, a1_dec, a2_inc,a2_dec;
//reg [3:0] a1_inc, a1_dec, a2_inc,a2_dec;
//for increment


reg incr1=1'b0, incr2=1'b0;
always @(posedge clock) begin
if(s)
begin
  incr1 <= minuteI;
  incr2 <= incr1;
  end
end
wire increment_synched = incr2;

reg [15:0] incrhistory = 16'h0000;
reg incr_detected = 1'b0;
always @(posedge clock) begin
  incrhistory <= { incrhistory[14:0] , increment_synched };
  if (incrhistory == 16'b0011111111111111)
    incr_detected <= 1'b1;
  else
    incr_detected <= 1'b0;
end

always @ (posedge clock) begin
a2_inc = a2;
a1_inc = a1;
  if (incr_detected) begin
      a2_inc = a2 + 1; end
  if (a2_inc[3:0]== 4'b1001) begin
      a2_inc <= 0;
      a1_inc <= a1 + 1;end
  if(a1_inc[3:0]==4'b0101) begin
      a1_inc <= 0;
      end

end

// for decrement
reg dec1=1'b0, dec2=1'b0;
always @(posedge clock) begin
if(s)
begin
  dec1 <= minuteDec;
  dec2 <= dec1;
  end
end
wire decrement_synched = dec2;

reg [15:0] dechistory = 16'h0000;
reg dec_detected = 1'b0;
always @(posedge clock) begin
  dechistory <= { dechistory[14:0] , decrement_synched };
  if (dechistory == 16'b0011111111111111)
    dec_detected <= 1'b1;
  else
    dec_detected <= 1'b0;
end

always @ (posedge clock) begin
a1_dec <= a1;
a2_dec <= a2;
    if (dec_detected) begin
    a2_dec <= a2_dec - 1;
    end
    if (a2_dec[3:0]== 4'b1111) begin
      a2_dec <= 4'b1001;
      a1_dec <= a1_dec - 1;
      end
      if(a1_dec[3:0]==4'b1111) begin
      a1_dec <= 4'b0101;
      end 
      
end

endmodule

module choose(bmi, bmd, bsi, bsd, a1_I, a1_D, a2_I, a2_D,
 a3_I, a3_D, a4_I, a4_D, a1, a2, a3, a4);
input bmi, bmd, bsi, bsd;
input [3:0] a1_I, a1_D, a2_I, a2_D, a3_I, a3_D, a4_I, a4_D;
output reg [3:0] a1, a2, a3, a4;
reg [3:0] select;

always@(*)
begin
    select = {bmi, bmd, bsi, bsd};
    case(select)
        4'b1000: begin
            a1 = a1_I;
            a2 = a2_I; end
        4'b0100: begin
            a1 = a1_D;
            a2 = a2_D; end
        4'b0010: begin
            a3 = a3_I;
            a4 = a4_I; end
        4'b0001: begin
            a3 = a3_D;
            a4 = a4_D; end
    endcase
   


end
endmodule

module alarmOn(e, eLed);
input e;
output reg eLed;
always@(*)
begin
if(e)
eLed = 1;
else 
eLed = 0;
end
endmodule
/*
module secondSet(a1, a2, clock,s,minuteI, minuteDec, 
a1_inc, a1_dec, a2_inc,a2_dec);
input clock,a1, a2, s, minuteI, minuteDec;
output reg [3:0] a1_inc, a1_dec, a2_inc,a2_dec;

//for increment
reg incr1=1'b0, incr2=1'b0;
always @(posedge clock) begin
if(s)
begin
  incr1 <= minuteI;
  incr2 <= incr1;
  end
end
wire increment_synched = incr2;

reg [15:0] incrhistory = 16'h0000;
reg incr_detected = 1'b0;
always @(posedge clock) begin
  incrhistory <= { incrhistory[14:0] , increment_synched };
  if (incrhistory == 16'b0011111111111111)
    incr_detected <= 1'b1;
  else
    incr_detected <= 1'b0;
end

always @ (posedge clock) begin

  if (incr_detected) begin
    if (a2 == 9) begin
      a2 = 0;
      a1 = a1 + 1;
      if(a1==5) begin
      a1 = 0;
      end end
    else
      a2 = a2 + 1;
  end
end

// for decrement
reg dec1=1'b0, dec2=1'b0;
always @(posedge clock) begin
if(s)
begin
  dec1 <= minuteDec;
  dec2 <= dec1;
  end
end
wire decrement_synched = dec2;

reg [15:0] dechistory = 16'h0000;
reg dec_detected = 1'b0;
always @(posedge clock) begin
  dechistory <= { dechistory[14:0] , decrement_synched };
  if (dechistory == 16'b0011111111111111)
    dec_detected <= 1'b1;
  else
    dec_detected <= 1'b0;
end

always @ (posedge clock) begin
a1_dec = a1;
a2_dec = a2;
  if (dec_detected) begin
    if (a2_dec == 0) begin
      a2_dec = 9;
      a1_dec = a1_dec - 1;
      if(a1_dec==0) begin
      a1_dec = 5;
      end end
    else
      a2_dec = a2_dec - 1;
  end
end

endmodule
*/
/*
module fastClock(clk, fast);    
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
 */
/*
module set(clock,s,minuteI, minuteDec, secondI,secondDec, a1, a2, a3, a4);
input clock,s, minuteI, minuteDec, secondI, secondDec;
output reg [3:0] a1, a2, a3, a4;
always@(posedge s)
begin
    if(minuteI)
    begin
        a2 <= a2+1;
        if (a2[3:0]==4'b1010)
        begin
            a2 <= 0;
            a1 <= a1 + 1;
        end
            if (a1[3:0]==4'b0110)
            begin
                    a1 <= 0;
            end
    end    
    
    if(minuteDec)
    begin
        a2 <= a2-1;
        if (a2[3:0]==4'b0000)
        begin
            a2 <= 4'b1001;
            a1 <= a1 - 1;
        end
        if (a1[3:0]==4'b0000)
        begin
            a1 = 4'b0101;
        end
    end
    
    if(secondI)
    begin
        a4 <= a4+1;
        if (a4[3:0]==4'b1010)
            begin
            a4 <= 0;
            a3 <= a3 + 1;
            end
            if (a3[3:0]==4'b0110)
                begin
                    a3 <= 0;
                end
            
    end      
    
    if(secondDec)
    begin
        a4 = a4-1;
        if (a4[3:0]==4'b0000)
            begin
            a4 = 4'b1001;
            a3 = a3 - 1;
            end
            if (a3[3:0]==4'b0000)
                begin
                    a3 = 4'b0101;
                end
            
        end        
end
endmodule
*/
/*
module setAdd(s,minuteI, minuteDec, secondI,secondDec, a1, a2, a3, a4);
input s, minuteI, minuteDec, secondI, secondDec;
output reg [3:0] a1, a2, a3, a4;
always@(posedge minuteI)
begin
    if(s)
    begin
        a2 <= a2+1;
        if (a2[3:0]==4'b1010)
            begin
            a2 <= 0;
            a1 <= a1 + 1;
            end
            if (a1[3:0]==4'b0110)
                begin
                    a1 <= 0;
                end
            
    end
end

always@(posedge secondI)
begin
    if(s)
        begin
        a4 <= a4+1;
        if (a4[3:0]==4'b1010)
            begin
            a4 <= 0;
            a3 <= a3 + 1;
            end
            if (a3[3:0]==4'b0110)
                begin
                    a3 <= 0;
                end
            
        end
end


endmodule
*/
/*
module setMinus(s,minuteI, minuteDec, secondI,secondDec, a1, a2, a3, a4);
input s, minuteI, minuteDec, secondI, secondDec;
output reg [4:0] a1, a2, a3, a4;

always@(posedge minuteDec)
    begin
    if(s)
        begin
        a2 = a2-1;
        if (a2[3:0]==4'b0000)
            begin
            a2 = 4'b1001;
            a1 = a1 - 1;
            end
            if (a1[3:0]==4'b0000)
                begin
                    a1 = 4'b0101;
                end
            
        end
    end

always@(posedge secondDec)
begin
    if(s)
        begin
        a4 = a4-1;
        if (a4[3:0]==4'b0000)
            begin
            a4 = 4'b1001;
            a3 = a3 - 1;
            end
            if (a3[3:0]==4'b0000)
                begin
                    a3 = 4'b0101;
                end
            
        end
end

endmodule
*/
/*
module alarmSegController(sClock, A, Q);
input sClock;
output [3:0] A;
output [1:0]Q;
wire [3:0] y;
segCounter alarmsCount(sClock, Q);
twoDecoder alarmdee(Q, y);
realDecoder alarmdeeDee(y,A);
endmodule
*/


