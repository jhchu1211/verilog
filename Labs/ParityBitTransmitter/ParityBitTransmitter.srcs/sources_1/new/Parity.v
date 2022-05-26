`timescale 1ns / 1ps


module Parity(load, E, clock, in, out, serial);
input load, E, clock;
input [7:0] in;
output [7:0]out;
output serial;
//output [7:0] dis;
wire switch, pair, s, D;
//assign dis = {pair, in};
wire wi;
wire [2:0] c;
SlowCLKGen main0(E, clock, switch);
shift_reg main1(in, load, switch, out);
assign wi = out;
//count_select main3(switch, load, s);
pair main2(s, switch, load, wi, pair);

mux2 main4(s, wi, pair, D);
Dff main5(D, switch, load, serial);

endmodule

module shift_reg(R, L, Clock, Q);
  input [7:0] R;
  input L, Clock;// w is the serial input, L is the control
  output [7:0] Q; 
  
  shift Stage7 (Q[0], R[7], L, Clock, Q[7]);
  shift Stage6 (Q[7], R[6], L, Clock, Q[6]);
  shift Stage5 (Q[6], R[5], L, Clock, Q[5]);
  shift Stage4 (Q[5], R[4], L, Clock, Q[4]);
  shift Stage3 (Q[4], R[3], L, Clock, Q[3]);
  shift Stage2 (Q[3], R[2], L, Clock, Q[2]);
  shift Stage1 (Q[2], R[1], L, Clock, Q[1]);
  shift Stage0 (Q[1], R[0], L, Clock, Q[0]);
endmodule

module shift(shiftedW, pInput, load, Clock, W) ;
    input shiftedW, pInput, load, Clock , load ;
    output reg W ;
    wire D ;
    assign D = load ? pInput : shiftedW ;
    
	always @ (posedge Clock)
        W = D ;

endmodule


//
/*

module parity(Clock, L, w, p) ;
	input wire Clock;
	input L ;
	input w ;
	output reg p ;
	
	localparam even = 1'b1 , odd = 1'b0 ;
	//reg state_reg , state_next ;
	reg [2:0] counter; reg [16:0] pcount;

always @(posedge Clock)
begin    
   if (!L)
   begin
      p <= 0 ; 
      counter <= 0;
      pcount <=0;
   end
   if(L)
   begin
        if(counter != 3'b111)
        begin
            counter <= counter + 1;
            if(w == 1'b1)
            begin
                pcount <= pcount + 1;
            end
        end
        else if(counter==3'b111)
        begin
            if(pcount[0]==1)
            begin
                p<=0;
            end
            else
                p<=1;
        end
   end
 end
endmodule */

module pair(select, clk, reset, parallel_input, parity);
    input select;
    input wire clk;
    input reset;
    input parallel_input;
    output reg parity;
    
    localparam [1:0] even = 1'b1,  odd = 1'b0;
    reg state_reg , state_next ;
    
    always @ ( posedge clk or posedge reset)
    begin
        if (!reset)
            state_reg <= even;
        else
            state_reg <= state_next ; 
    end    
        
    always @(posedge clk)
    begin
    if(!select)
    begin
        state_next = state_reg; // default state: the same
        parity <= 1'b0;
        case (state_reg)
            even:   // case when number of 1s is even
            begin
                //parity <= 1'b1; // output a 1 if even
                if (parallel_input) // if parallel serial input is 1,
                begin
                    state_next = odd;  // We are now in odd state
                    parity <= 1'b0;
                end
                else
                begin
                    state_next = even;
                end
            end
            odd:
            begin
                parity <= 1'b0;     // serial output is now 0 because odd number of 1s
                if (parallel_input)  // Move to even if new input is 1
                begin
                    state_next = even;
                    //parity <= 1'b1;
                end
                else
                begin
                    state_next=odd;
                end
            end
            default : state_next = odd; // Otherwise, stay in odd if input is 0

        endcase
    end
    if(select)
    begin
    case(state_reg)
        even:
            begin
            parity<=1'b0;
            state_next=even;
            end
        odd:
            begin
            parity<=1'b1;
            state_next=odd;
            end
    endcase
    end
    end
endmodule

module mux2(select, A, B, dis);
input select;
input A, B;
output reg dis;

always @(select or A or B)
if(select==1'b0) dis = A;
else if(select==1'b1) dis = B;

endmodule

module Dff(D,clk,sync_reset,Q);
input D; // Data input 
input clk; // clock input 
input sync_reset; // synchronous reset 
output reg Q; // output Q 
always @(posedge clk) 
begin
 if(!sync_reset)
  Q <= 1'b0; 
 else 
  Q <= D; 
end 
endmodule 


module SlowCLKGen( clkEnable, Clock, SecCLK );
    input clkEnable;
	input Clock;    
    output reg SecCLK; 
reg [26:0] SecCNTR;
always @ (posedge Clock)     
    begin
		if (clkEnable)
			begin
			SecCNTR = SecCNTR + 1;
			if (SecCNTR == 50_000_000)                     
				begin           
                SecCLK=~SecCLK ;
                SecCNTR = 0      ;        
				end 
			end
        else
			SecCLK = 0 ;
    end 
             
endmodule
