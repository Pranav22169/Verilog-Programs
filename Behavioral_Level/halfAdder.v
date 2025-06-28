module halfAdder(A, B, Sum, Carry); 
input A, B; 
output Sum, Carry; 
reg Sum, Carry; 

always @(A or B)
begin 
    if(A  == B)
        Sum = 1'b0; 
    else
        Sum = 1'b1; 
    
    if(A == 1'b1 && B == 1'b1)
        Carry = 1'b1;
    else
        Carry = 1'b0; 
end
endmodule

module test; 
reg A, B ; 
wire Sum, Carry; 
halfAdder i(A, B, Sum, Carry);
initial
begin 
    A = 1'b0 ; B = 1'b0; 
    $monitor("Time = %0t , A = %b , B = %b , Sum = %b , Carry = %b" , $time, A, B, Sum, Carry);
    #5 A = 1'b0 ; B = 1'b0; 
    #5 A = 1'b0 ; B = 1'b1; 
    #5 A = 1'b1 ; B = 1'b0; 
    #5 A = 1'b1 ; B = 1'b1;
end
endmodule 
