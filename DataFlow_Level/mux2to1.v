module mux2to1(A0, A1, S, Y);
input A0, A1, S; 
output Y; 
wire w1, w2, w3; 

assign w1 = ~S; 
assign w2 = A0 & w1; 
assign w3 = A1 & S; 
assign Y = w2 | w3; 

endmodule

module testMux2to1; 
reg A0, A1, S; 
wire Y; 
mux2to1 i(A0, A1, S, Y); 

initial 
    begin
        A0 = 1'b0 ; A1 = 1'b0 ; S = 1'b0 ; 
        $monitor("Time = %0t, S = %b , A = %b , B = %b , Y = %b", $time, S, A0, A1, Y);
        #5 S= 1'b0 ; A0 = 1'b0 ; A1 = 1'b0; 
        #5 S= 1'b0 ; A0 = 1'b0 ; A1 = 1'b1; 
        #5 S = 1'b1 ; A0 = 1'b1 ; A1 = 1'b0; 
        #5 S = 1'b1 ; A0 = 1'b1 ; A1 = 1'b1; 

    end
endmodule