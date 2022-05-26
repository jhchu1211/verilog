`timescale 1ns / 1ps


module main(up, down, clock,
pianoOn, soundOn,
c, cs, d, ds, e, f, fs, g, gs, a, as, b,
audioOut, aud_sd, 
AN, C, A,
pianoLED, soundLED,oct
);
input up, down; //buttons for adjusting octave
input clock; //clock
input pianoOn, soundOn; //ENABLE for piano adjust and sound
input c, cs, d, ds, e, f, fs, g, gs, a, as, b; //keys for piano
output audioOut; output wire aud_sd; //for sound
output [1:0] AN; output [6:0] C; //for display
output [7:2] A;
output pianoLED;
output soundLED;
output [4:0] oct;

assign A = 6'b111111;
//wire [19:0] o; //for octave
wire [3:0] a2;
assign oct = a2;
button mainStage0(pianoOn, clock, up, down, pianoLED, a2);
display mainStage1(clock, a2, AN, C);
sound mainStage2(a2, clock, soundOn, c, cs, d, ds, e, f, fs, g, gs, a, as, b, audioOut, aud_sd, soundLED);
endmodule
