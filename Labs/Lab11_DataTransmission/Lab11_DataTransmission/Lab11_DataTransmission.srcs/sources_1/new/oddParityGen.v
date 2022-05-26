`timescale 1ns / 1ps

module oddParityGen(clk, reset, parallel_input, parity);
    input wire clk;
    input reset;
    input parallel_input;
    output reg parity;
    
    localparam [1:0] even = 1'b1,  odd = 1'b0;
    reg state_reg , state_next ;
    
    always @ ( posedge clk or posedge reset)
    begin
        if (reset)
            state_reg <= even;
        else
            state_reg <= state_next ; 
    end    
        
    always @*
    begin
        state_next = state_reg; // default state: the same
        parity <= 1'b1;
        case (state_reg)
            even:   // case when number of 1s is even
            begin
                parity <= 1'b1; // output a 1 if even
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
                    parity <= 1'b1;
                end
                else
                begin
                    state_next=odd;
                end
            end
            default : state_next = odd; // Otherwise, stay in odd if input is 0

        endcase
    end
endmodule
