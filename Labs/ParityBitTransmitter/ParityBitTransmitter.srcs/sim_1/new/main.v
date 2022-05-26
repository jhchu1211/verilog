`timescale 1ns / 1ps

module main;
reg w, Clock, LorS;
reg [7:0] R;
wire [7:0] Q; 
wire serial;
Parity uut(LorS,w, Clock,  R, Q, serial);
initial begin
w=1; Clock=0;LorS=1; R=8'b01000001;
#1 Clock=~Clock;
#1 Clock=~Clock;
#1 Clock=~Clock; LorS=0;
repeat(20) #1 Clock=~Clock;

end
endmodule
