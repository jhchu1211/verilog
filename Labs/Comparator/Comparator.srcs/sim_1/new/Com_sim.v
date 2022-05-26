`timescale 1ns / 1ps

module Com_sim;
reg [7:0] test_x;
reg [7:0] test_y; //fix below tests
wire test_v, test_n, test_z;

Comparator uut(.X(test_X), .Y(test_Y), .V(test_v), .N(test_n), .Z(test_z));
initial begin
    test_x=4'b00000000;
    test_y=4'b00011111; //x<y
    #1 test_x=4'b00111111; test_y=4'b00010000;//x>y; z=0; v=0
    #1 test_x=4'b01100000; test_y=4'b01100000;//x=y; z=1
    #1 test_x=4'b01111111; test_y=4'b11111110;//127-(-2); v=1; n=0; z=0
    
    
end
endmodule
