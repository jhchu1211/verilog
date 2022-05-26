`timescale 1ns / 1ps


module inp(clock, ready, index_set, tape_set,
tape_reg, index, turing_state);
//, done_reg);
input clock, ready;
input [2:0] index_set;
input [7:0] tape_set;
output reg [7:0] tape_reg;
output reg [2:0] index;
output reg turing_state;
//output reg done_reg;

localparam [1:0] s1=2'b01, s2=2'b10, s3 = 2'b00;

reg [1:0] state_reg;
//reg done_next;
reg [7:0] tape_reg_next;
reg [1:0] state_next;
reg [2:0] index_next;
reg turing_next;

always @(posedge clock)
begin
if(!ready)
begin
    tape_reg <= tape_set;
    index <= index_set;
    turing_state <= 0;
    //done_reg <= 0;
    state_reg <= s1;
end
else 
begin
    index <= index_next;
    tape_reg <= tape_reg_next;
    //done_reg <= done_next;
    state_reg <= state_next;
    turing_state <= turing_next;
end
end

always@*
begin
    state_next = state_reg;
    tape_reg_next = tape_reg;
    index_next = index;
    turing_next = turing_state;
    //done_next = done_reg;
    case(state_next)
    s1:
    begin
        if(turing_state == 1)
        begin
            state_next = s2;
        end 
        else
        begin
            state_next = s1;
            if(turing_state == 0 && tape_reg_next[index] == 1'b0)
            begin
                tape_reg_next[index] <= 1'b1;
                turing_next = 1;
                //done_next <=1;
                
            end
            if(turing_next ==0)
            index_next <= index_next - 1;
        end
    end
    s2:
    begin
        state_next = s3; //halt
        turing_next = 1;
    end
    default:
    begin
        state_next = s3;
        turing_next = 1;
        if(ready ==0)
        begin
        state_next = s1;
        end
    end
    endcase
end
endmodule
