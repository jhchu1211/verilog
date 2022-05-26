`timescale 1ns / 1ps


module button(on, clock, up, down, LED, a2);
input on, clock, up, down;
output LED;
output [3:0]a2;

wire [3:0] temp_a2;

wire [3:0] a2_inc, a2_dec;


 assign temp_a2 = a2;

octaveSet buttonStage0(temp_a2, clock, on, up, down, a2_inc, 
a2_dec);

choose buttonStage1(up, down, a2_inc,
a2_dec, a2 );

octaveOn buttonStage2(on, LED);

endmodule

module octaveSet( a2, clock,s,minuteI, minuteDec, 
 a2_inc,a2_dec);
//input [4:0] octave;
input [3:0] a2;
input clock;
input s, minuteI, minuteDec;
output reg [3:0] a2_inc,a2_dec;
//output reg [4:0] octave_inc, octave_dec;
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
//a1_inc = a1;
//octave_inc = octave;
  if (incr_detected) begin
      a2_inc = a2 + 1; 
      //octave_inc = octave + 1; 
      end
  if (a2_inc[3:0]== 4'b1001) begin
      a2_inc <= 0;
      //a1_inc <= a1 + 1;
      end
  //if(a1_inc[3:0]==4'b0101) begin
     // a1_inc <= 0;
     // end
  //if(a2_inc[3:0]== 4'b0111 && a1_inc[3:0]==4'b0001 & octave_inc==5'b10001) begin
   // a2_inc <= 0; a1_inc <= 0; octave_inc <=0;
   // end
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
//a1_dec <= a1;
a2_dec <= a2;
//octave_dec <= octave;
    if (dec_detected) begin
    a2_dec <= a2_dec - 1;
    //octave_dec <= octave_dec - 1;
    end
    if (a2_dec[3:0]== 4'b1111) begin
      a2_dec <= 4'b1001;
      //a1_dec <= a1_dec - 1;
      end
      //if(a1_dec[3:0]==4'b1111) begin
      //a1_dec <= 4'b0001;
     // end 
      //if(a2_dec[3:0]== 4'b1001 && a1_dec[3:0]==4'b0001 && octave_dec[4:0]==5'b11110) begin
       // a2_dec <= 4'b0110; a1_dec <= 4'b0001; octave_dec <=5'b10000;
       // end
end

endmodule

module choose(bmi, bmd, a2_I, a2_D, a2, oct);

input bmi, bmd;
input [3:0] a2_I, a2_D;
output reg [3:0] a2;
output reg [4:0] oct;
reg [1:0] select;

always@(*)
begin
    select = {bmi, bmd};
    case(select)
        4'b10: begin
          //  a1 = a1_I;
            a2 = a2_I; 
          //  oct = oUP; 
          end
        4'b01: begin
        //    a1 = a1_D;
            a2 = a2_D; 
            //oct = oDOWN; 
            end
    endcase
   


end
endmodule

module octaveOn(e, eLed);
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
module button(clock, up, down, on, octave,LED);
input clock, up, down, on;
output [4:0] octave;
output reg LED;
wire goUp, goDown;

debounce buttonStage0(clock, on, up, goUp);
debounce buttonStage1(clock, on, down, goDown);
counter buttonStage2(goUp,goDown,octave);

endmodule

module debounce(
input wire clk, reset,
input wire sw,
output reg db
);
// symbolic state declaration
localparam [2:0]
    zero = 3'b000,
    wait1_1 = 3'b001,
    wait1_2 = 3'b010,
    wait1_3 = 3'b011,
    one = 3'b100,
    wait0_1 = 3'b101,
    wait0_2 = 3'b110,
    wait0_3 = 3'b111;
// number of counter bits (2"N * 2Ons = lOms tick)
localparam N =19; 
// signal declaration
reg [N-1:0] q_reg;
wire [N-1 : 0] q_next;
wire m_tick;
reg [2:0] state_reg , state_next ;
// body

// counter to generate 10 ms tick ...............................................
always @ (posedge clk)
q_reg <= q_next;
// next-state logic
assign q_next = q_reg + 1;
// ozrtput tick
assign m_tick = (q_reg==0) ? 1'b1 : 1'b0;
// debouncing FSM ...............................................
// state register
always @ ( posedge clk or negedge reset)
if (~reset)
state_reg <= zero;
else
state_reg <= state_next ;
// next-state logic and output logic
always @*
begin
state_next = state_reg; // default state: the same
db = 1'b0; // default output: 0
case (state_reg)
zero:
if (sw)
state_next = wait1_1 ;
wait1_1:
if (~sw)
state_next = zero;
else
if (m_tick)
state_next = wait1_2 ;
wait1_2:
if (~sw)
state_next = zero;
else
if (m_tick)
state_next = wait1_3;
wait1_3:
if (~sw)
state_next = zero; 
else
if (m_tick)
state_next = one;
one:
begin
db = 1'b1;
if (~sw)
state_next = wait0_1;
end
wait0_1:
begin
db = 1'b1;
if (sw)
state_next = one;
else
if (m_tick)
state_next = wait0_2;
end
wait0_2:
begin
db = 1'b1;
if (sw)
state_next = one;
else
if (m_tick)
state_next = wait0_3;
end
wait0_3:
begin
db = 1'b1;
if (sw)
state_next = one;
else
if (m_tick)
state_next = zero;
end
default : state_next = zero;
endcase
end
endmodule

module counter(input button,input down,output reg [4:0] d);
always@(button or down)
begin
if(button)
d <= d + 1;
else if(down)
d<= d - 1;

begin
if (d==17)
d<=0;
else if(d==5'b11110)
d<=16;
end
end
endmodule*/

/*module minuteSet(a1, a2, clock,s,minuteI, minuteDec, 
a1_inc, a1_dec, a2_inc,a2_dec);
input [3:0] a1, a2; //initials
input clock;
input s, minuteI, minuteDec; //switch plus buttons
output reg [3:0] a1_inc, a1_dec, a2_inc,a2_dec;
//reg [3:0] a1_inc, a1_dec, a2_inc,a2_dec;


//for increment BEGIN


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

// for decrement BEGIN

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
endmodule */