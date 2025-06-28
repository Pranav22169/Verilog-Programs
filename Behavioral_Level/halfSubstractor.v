module halfSubstractor(A, B, Diff, Borrow); 
input A, B; 
output Diff, Borrow; 
reg Diff, Borrow , w1; 

always @(A or B)
begin 
    if( A == B)
        Diff = 1'b0; 
    else
        
        Diff = 1'b1; 

    if(A == 1'b1)
        w1 = 1'b0; 
    else
        w1= 1'b1;

    if(A== 1'b1 && B== 1'b1)
        Borrow= 1'b1;
    else
        Borrow= 1'b0;
end
endmodule

module halfSubstractor_tb;
reg A, B;
wire Diff, Borrow; 
halfSubstractor i(A, B, Diff, Borrow);
initial 
begin 
        A = 1'b0;
        B = 1'b0; 
        $monitor("time=%0t, a = %b, b = %b, Diff = %b, Carry = %b" , $time, A , B , Diff , Borrow);
        #5 A=1'b0; B=1'b0;
        #5 A=1'b0; B=1'b1;
        #5 A=1'b1; B=1'b0;
        #5 A=1'b1; B=1'B1;
end
endmodule
