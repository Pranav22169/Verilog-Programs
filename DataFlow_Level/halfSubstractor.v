module halfSubstractor(A, B, Diff, Bor); 
input A, B; 
output Diff, Bor; 
wire w1; 

assign Diff = A ^ B; 
assign w1 = ~A; 
assign Bor = w1 & B; 

endmodule

module halfSubstractor_tb;
reg A, B;
wire diff, Borrow; 
halfSubstractor i(A, B, diff, Borrow);
initial 
begin 
        A = 1'b0;
        B = 1'b0; 
$monitor("time=%0t, a = %b, b = %b, Diff = %b, Carry = %b" , $time, A , B , diff , Borrow);
#5 A=1'b0; B=1'b0;
#5 A=1'b0; B=1'b1;
#5 A=1'b1; B=1'b0;
#5 A=1'b1; B=1'B1;
end
endmodule
