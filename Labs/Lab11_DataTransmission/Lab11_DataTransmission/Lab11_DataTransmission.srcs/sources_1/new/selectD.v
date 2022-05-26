

module selectD(c, select);

input [2:0]c;
output reg select;

always @(c)
    begin
    if (c == 7)
       begin
	   select = 1 ;
	   end
	else 
		select = 0 ;
    end
endmodule
