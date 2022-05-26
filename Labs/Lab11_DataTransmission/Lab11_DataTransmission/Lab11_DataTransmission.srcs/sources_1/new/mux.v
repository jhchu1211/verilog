`timescale 1ns / 1ps

module mux(w, p, sel, d);
    input w, p, sel;
    output reg d;
    reg select;
    always@(w, p, sel)
    begin
        case(sel)
            0: d = w;
            1: d = p;
        endcase
    end
endmodule
