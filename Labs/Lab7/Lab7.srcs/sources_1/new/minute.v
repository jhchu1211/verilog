`timescale 1ns / 1ps

module minute(forward, forward2, Clock, Reset, upMin, lowMin);
input forward, forward2, Clock, Reset;
output [3:0] upMin, lowMin;
wire g;
lowlowerMin(forward, forward2, Reset, Clock+20, lowMin, g);
upupperMin(g, forward, forward2, Reset, Clock, upMin);

endmodule


module lowlowerMin(advance, advance2, Reset, Clock, Q, go);
input advance, advance2;
input Reset;
input Clock;
output reg [3:0] Q = 4'b0000;
output reg go;

always @(posedge Clock)
begin
        go=1'b0;
        if (advance==1'b1&&advance2==1'b1)
        begin
            Q <= Q + 1;
            if(Q[3:0]==4'b1001)
            begin 
                Q <= 0;
                go = 1'b1;
            end
        end
        if(Reset)
        begin 
            Q <= 0;
        end
        
end
endmodule


module upupperMin(advance,advance2, advance3, Reset, Clock, Q);
input advance, advance2, advance3;
input Reset;
input Clock;
output reg [3:0] Q = 4'b0000;

always @(posedge Clock)
begin
        if (advance==1'b1 && advance2==1'b1 && advance3==1'b1)
        begin
            Q <= Q + 1;
            
            if(Q[3:0]==4'b1001)
            begin 
                Q <= 0;
            end
        end
        if(Reset)
        begin 
            Q <= 0;
        end
        end
endmodule


