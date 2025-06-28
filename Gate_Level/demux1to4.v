module demux(i, s0, s1, i0, i1, i2, i3);
input i, s0, s1; 
output i0, i1, i2, i3; 
wire w1, w2; 

assign w1 = ~s0; 
assign w2 = ~s1; 

assign i0 = w1 & w2 & i; 
assign i1 = w1 & s1 & i; 
assign i2 = s0 & w2 & i; 
assign i3 = s0 & s1 & i; 

endmodule

module test; 
reg i , s0, s1; 
wire i0, i1, i2, i3; 

demux i34(i, s0, s1, i0, i1, i2, i3);

initial 
    begin 
        i = 1'b1; s0 = 1'b0 ; s1 = 1'b0; 
        $monitor("Time= %0t  i = %b  s0 = %b  s1 = %b  i0 = %b i1 = %b i2 = %b i3 = %b", $time, i, s0, s1, i0, i1, i2, i3);
       #5 i = 1'b1; s0 = 1'b0 ; s1 = 1'b1; 
       #5 i = 1'b1; s0 = 1'b1 ; s1 = 1'b0; 
       #5 i = 1'b1; s0 = 1'b1 ; s1 = 1'b1; 
    end
endmodule