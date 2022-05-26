`timescale 1ns / 1ps


module checkers(clock,ready,tape_reg, index, turing_state, done_reg, halt );
input clock, ready;
input [7:0] tape_reg;
input [2:0] index;
input turing_state;
input done_reg;
output reg halt;

wire slow;

always@(posedge ready)
begin
slowclkgen(clock, slow);
end

always@(posedge slow)
begin

end

endmodule

module slowclkgen(clk, outsignal);
    input clk;
    output  outsignal;
    reg [26:0] counter;  
    reg outsignal;    
    always @ (posedge clk)   
        begin  
            counter = counter +1;  
            if (counter == 100_000_000)  //why is this a 0.5 Hz?
            begin
            outsignal=~outsignal;
            counter =0;
            end    
        end
endmodule
