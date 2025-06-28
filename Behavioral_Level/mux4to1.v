module mux4to1(A0, A1, A2, A3, S0, S1, Y);
input A0, A1, A2, A3, S0, S1; 
output Y;
reg Y;

always @*
begin 
    if(S0 == 1'b0 && S1 == 1'b0) begin 
        Y = A0;
    end
    else if(S0 == 1'b0 && S1 == 1'b1) begin 
        Y = A1; 
    end
    else if(S0 == 1'b1 && S1 == 1'b0) begin 
        Y = A2; 
    end
    else begin 
        Y = A3; 
    end

end
endmodule

module testMux4to1;
reg A0, A1, A2, A3, S0,  S1; 
wire Y; 

mux4to1 i(A0, A1, A2, A3, S0, S1, Y);

initial
    begin
        S0 = 1'b0; 
        S1 = 1'b0;
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