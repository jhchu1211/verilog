`timescale 1ns / 1ps
module add
#(parameter N=4 )    
(input wire [N-1:0] x, y,    output reg [N-1:0] sum   );
reg [N-2:0]  mag_a, mag_b, mag_sum, max, min;   
reg sign_a, sign_b, sign_sum;
always @*   
begin      
// separate magnitude and sign      
    mag_a = x[N-2:0];      
    mag_b = y[N-2:0];      
    sign_a = x[N-1];      
    sign_b = y[N-1];      
    if (mag_a > mag_b)         
        begin            
            max = mag_a;            
            min = mag_b;           
            sign_sum = sign_a;         
        end      
    else         
        begin           
            max = mag_b;            
            min = mag_a;            
            sign_sum = sign_b;         
        end      
    // add/sub magnitude      
    if (sign_a==sign_b)    
        begin     
        mag_sum = max + min;   
        end   
    else         
        mag_sum = max - min;      
        // form output      
    sum = {sign_sum, mag_sum};   
    end
endmodule
