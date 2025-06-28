module mux4to1(A0, A1, A2, A3, S0, S1, Y);
input A0, A1, A2, A3, S0, S1; 
output Y;
wire w1 , w2; 

assign w1 = ~S0; 
assign w2 = ~S1; 
assign Y = (w1 & w2 & A0) | (w1 & S1 & A1) | (S0 & w2 & A2) | (S0 & S1 & A3);

endmodule


module testMux;
reg A0, A1, A2, A3, S0, S1; 
wire Y; 
    mux4to1 i(A0, A1, A2, A3, S0, S1, Y);
initial 
begin
        S0 = 1'b0; 
        S1= 1'b0;
        A0 = 1'b0; 
        A1 = 1'b0; 
        A2 = 1'b0; 
        A3 = 1'b0; 

        $monitor("Time = %0t, S1 = %b , S2 = %b , A0 = %b , A1 = %b , A2 = %b , A3 = %b , Y = %b", $time , S0, S1, A0, A1, A2, A3, Y);
        #5 S0=1'b0; S1=1'b0; A0=1'b1;
        #5 S0=1'b0; S1=1'b1; A1=1'b0;
        #5 S0=1'b0; S1=1'b1; A1=1'b1;
        #5 S0=1'b1; S1=1'b0; A2=1'b0;
        #5 S0=1'b1; S1=1'b0; A2=1'b1;
        #5 S0=1'b1; S1=1'b1; A3=1'b0;
        #5 S0=1'b1; S1=1'b1; A3=1'b1;
end
endmodule
    