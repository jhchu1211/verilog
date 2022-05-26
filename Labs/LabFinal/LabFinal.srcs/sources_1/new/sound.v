`timescale 1ns / 1ps


module sound(input [4:0] octave, 
input clock, on,
input c, cs, d, ds, e, f, fs, g, gs, a, as, b, //switches/keys
output reg audioOut, output wire aud_sd, output reg LED );
assign aud_sd = 1'b1;
reg [25:0] topcounter;
wire [25:0] notePeriod;
//wire [19:0] denom;
//wire [19:0] realDenom;

newselect soundStage0(c, cs, d, ds, e, f, fs, g, gs, a, as, b,octave, notePeriod);
//power soundStage1(go,octave, realDenom);
//put soundStage2(go,denom, realDenom, notePeriod);
always@(posedge clock)
begin
if(~on)
begin
    topcounter <=0;
    audioOut <=1;
    LED <= 0;
end
else if(on)
begin
    LED <= 1;
    //counting
    topcounter <= topcounter + 1; 
    if( topcounter >= notePeriod)    
    begin
        topcounter <=0;  
        audioOut <= ~audioOut ;    
    end      //toggle audio output 
end
end
endmodule

module newselect(input c, cs, d, ds, e, f, fs, g, gs, a, as, b,
input [19:0] octave,
output reg [25:0] nut
);
reg [11:0] long;
integer note;
integer oct;
reg [19:0] pow;
reg go;
reg [19:0] counter; 
reg [4:0] sma;
always@(*)
begin
    sma = {octave[4:0]};
    oct = octave;
    case(octave)
    5'b00000: counter = 1;
    5'b00001: counter = 2;
    5'b00010: counter = 4;
    5'b00011: counter = 2*2*2;
    5'b00100: counter = 4*4;
    5'b00101: counter = 2*2*2*2*2;
    6: counter = 4*4*4;
    7: counter = 4*4*4*2;
    8: counter = 4*4*4*4;
    9: counter = 4*4*4*4*2;
    10: counter = 4*4*4*4*4;
    11: counter = 4*4*4*4*4*2;
    12: counter = 4*4*4*4*4*4;
    13: counter = 4*4*4*4*4*4*2;
    14: counter = 4*4*4*4*4*4*4;
    15: counter = 4*4*4*4*4*4*4*2;
    16: counter = 4*4*4*4*4*4*4*4;
    endcase
    pow = counter;
end
    always@*
    begin
    begin
    long <= {c, cs, d, 
             ds, e, f, 
             fs, g, gs, 
             a, as, b};
    case(long)
        12'b100000000000: begin
            note = 50_000_000/523.25; go = 1'b1; end// c
        12'b010000000000: begin
            note = 50_000_000/554.37;go = 1'b1; end // csharp or dminor
        12'b001000000000: begin
            note = 50_000_000/587.33; go = 1'b1; end// d
        12'b000100000000: begin
            note = 50_000_000/622.25; go = 1'b1; end// dsharp or eminor
        12'b000010000000: begin
            note = 50_000_000/659.25; go = 1'b1; end// e
        12'b000001000000: begin
            note = 50_000_000/698.46; go = 1'b1; end// f
        12'b000000100000: begin
            note = 50_000_000/739.99; go = 1'b1; end// fsharp or gminor
        12'b000000010000: begin
            note = 50_000_000/783.99; go = 1'b1; end// g
        12'b000000001000: begin
            note = 50_000_000/830.61; go = 1'b1; end// gsharp or aminor
        12'b000000000100: begin
            note = 50_000_000/880; go = 1'b1; end// a
        12'b000000000010: begin
            note = 50_000_000/(466.16*2); go = 1'b1; end// asharp or bminor
        12'b000000000001:begin
            note = 50_000_000/(493.88*2); go = 1'b1; end// b
        default: begin
            note = 1; go = 1'b0; end
    endcase           
    end
    if(go == 1'b0)
    begin
        nut = 1;
    end
    else if(go==1'b1)
    begin
        nut = 32*note/(pow);
    end
end

endmodule
/*
module select(input c, cs, d, ds, e, f, fs, g, gs, a, as, b,
output reg [19:0] note
);
reg [11:0] long;
integer pow;
always@*
begin
     long <= {c, cs, d, 
             ds, e, f, 
             fs, g, gs, 
             a, as, b};
    case(long)
        12'b100000000000:
            note = 523.25; // c
        12'b010000000000:
            note = 554.37; // csharp or dminor
        12'b001000000000:
            note = 587.33; // d
        12'b000100000000:
            note = 622.25; // dsharp or eminor
        12'b000010000000:
            note = 659.25; // e
        12'b000001000000:
            note = 698.46; // f
        12'b000000100000:
            note = 739.99; // fsharp or gminor
        12'b000000010000:
            note = 783.99; // g
        12'b000000001000:
            note = 830.61; // gsharp or aminor
        12'b000000000100:
            note = 880; // a
        12'b000000000010:
            note = 466.16*2; // asharp or bminor
        12'b000000000001:
            note = 493.88*2; // b
        default:
            note = 1;
    endcase           
    
    
end

endmodule

module power(input go, input [19:0] oct, output reg [19:0] power);
reg [18:0] counter = 0;
reg [19:0] count;
reg [19:0] subPower;
always@*
begin
if(go==1'b1)
begin
    if(power == 0)
    begin
        power = 1;
        count = counter;
    end
    else begin
        subPower = power; end
    if(count == oct)
    begin
        power = subPower;
    end
    else if(count > oct)
    begin
        subPower = subPower / 2;
        count = count - 1;
    end
    else if(count < oct)
    begin
        subPower = subPower*2;
        count = count + 1;
    end
end */
    /*if(counter < oct)
    begin
        counter <= counter + 1;
    end
    else if(counter > oct)
    begin
        counter <= counter - 1;
    end
    else if(counter == oct)*/
    /*
    begin
        counter = 0; //constant reset
        counter[oct] = 1; //constant set
        power <= { counter, 1'b0}; //max at 17th position being 1 or 2^16*
    end */ 
    /*
end
endmodule

module put(input go, input [19:0] base, input [19:0] powe, output reg [19:0] note );
always@*
begin
    if(base ==1 || go == 1'b0)
    begin
        note = 1;
    end
    else if(go == 1'b1)
    begin
        note = 50_000_000/(powe*(base)/32); //incorporates realDenom which is octave BUT drops it by 5 octaves first 
    end
end
endmodule

module parity(select, clk, reset, parallel_input, parity);
    input select;
    input wire clk;
    input reset;
    input parallel_input;
    output reg parity;
    
    localparam [1:0] even = 1'b01,  odd = 1'b00;
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
endmodule */