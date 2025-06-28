module mux4to1(A0, A1, A2, A3, S1, S2, Y);
input A0, A1, A2, A3, S1, S2; 
output Y; 
wire w1, w2, w3, w4, w5, w6; 

not a1(w1, S1);
not a2(w2, S2);
and a3(w3, w1, w2, A0);
and a4(w4, w1, S2, A1);
and a5(w5, S1, w2, A2);
and a6(w6, S1, S2, A3);
or a7(Y, w3, w4, w5, w6);

endmodule

module testMux4to1;
reg A0, A1, A2, A3, S1, S2; 
wire Y; 

mux4to1 i(A0, A1, A2, A3, S1, S2, Y);

initial
    begin
        S1 = 1'b0; 
        S2 = 1'b0;
        A0 = 1'b0; 
        A1 = 1'b0; 
        A2 = 1'b0; 
        A3 = 1'b0; 

        $monitor("Time = %0t, S1 = %b , S2 = %b , A0 = %b , A1 = %b , A2 = %b , A3 = %b , Y = %b", $time , S1, S2, A0, A1, A2, A3, Y);
        #5 S1=1'b0; S2=1'b0; A0=1'b1;
        #5 S1=1'b0; S2=1'b1; A1=1'b0;
        #5 S1=1'b0; S2=1'b1; A1=1'b1;
        #5 S1=1'b1; S2=1'b0; A2=1'b0;
        #5 S1=1'b1; S2=1'b0; A2=1'b1;
        #5 S1=1'b1; S2=1'b1; A3=1'b0;
        #5 S1=1'b1; S2=1'b1; A3=1'b1;
    
    end
endmodule 
        
