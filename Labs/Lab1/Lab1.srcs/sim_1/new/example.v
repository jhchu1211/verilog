`timescale 1ns / 1ps   //this line should be already included in the default code

module example;  
reg x0, x1, x2;  
wire f;  

lab1_sim uut(.x0(x0), .x1(x1), .x2(x2), .f(f));  // uut stands for "Unit Under Test", which is declared as an 'object' of module "decoder"
initial begin 

x0=0; x1=0; x2=0;
#1 x0=0; x1=0; x2=1; 
#1 x0=0; x1=1; x2=0; 
#1 x0=0; x1=1; x2=1; 
#1 x0=1; x1=0; x2=0; 
#1 x0=1; x1=0; x2=1; 
#1 x0=1; x1=1; x2=0; 
#1 x0=1; x1=1; x2=1; 
end
endmodule