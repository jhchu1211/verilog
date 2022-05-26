`timescale 1ns / 1ps


module main(alarmEnable, alarmSet, clk, minuteInc, minuteDec, secondInc,secondDec, enLED,
clockEnable, Reset, 
AN, C,
audioOut, aud_sd
    );
input alarmEnable, alarmSet, clk, minuteInc, minuteDec, secondInc, secondDec;
input clockEnable, Reset;
output enLED;

output [7:0] AN;
output [6:0] C;
output audioOut;
output wire aud_sd;
wire go; 
wire [3:0] alarmUpMin, alarmLowMin, alarmUpSec, alarmLowSec;

alarmSide mainStage0(alarmEnable, alarmSet, clk, minuteInc, minuteDec, secondInc, secondDec,
enLED, alarmUpMin, alarmLowMin, alarmUpSec, alarmLowSec);

clockSide mainStage1(clk, clockEnable, Reset, alarmUpMin, alarmLowMin, alarmUpSec, alarmLowSec,
alarmEnable, AN, C, go);

soundSide mainStage2(clk, Reset, alarmEnable, go, audioOut, aud_sd);

endmodule
