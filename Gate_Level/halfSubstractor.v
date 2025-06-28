module halfSubstractor(A, B, dif, Bor);
input A, B; 
output dif , Bor; 
xor a1(dif , A, B);
not a2(w1, A);
and a3(Bor, w1, B); 
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