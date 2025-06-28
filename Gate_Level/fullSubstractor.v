module fullSubstractor(A , B , Bin , Diff , Bout);
input A, B, Bin; 
output Diff , Bout; 
wire w1, w2, w3, w4 , w5 ; 
xor a1(w1, A, B); 
xor a2(Diff, w1, Bin);
not a3(w2, w1);
and a4(w3, w2, Bin);
not a5(w4, A);
and a6(w5, w4, B);
or a7(Bout, w3, w5);
endmodule

module FullSubstractor;
reg A, B, Bin; 
wire Diff, Bout; 
fullSubstractor i(A, B, Bin, Diff, Bout);
initial
begin
    A= 1'b0;
    B= 1'b0;
    Bin= 1'b0;
    $monitor("time=%0t , A= %b , B = %b ; Bin = %b , Diff = %b , Bout = %b" , $time , A ,B , Bin , Diff , Bout);
     #5 A = 1'b0 ; B = 1'b0 ; Bin = 1'b0;
    #5 A = 1'b0 ; B = 1'b0 ; Bin = 1'b1;
    #5 A = 1'b0 ; B = 1'b1 ; Bin = 1'b0;
    #5 A = 1'b0 ; B = 1'b1 ; Bin = 1'b1;
    #5 A = 1'b1 ; B = 1'b0 ; Bin = 1'b0;
    #5 A = 1'b1 ; B = 1'b0 ; Bin = 1'b1;
    #5 A = 1'b1 ; B = 1'b1 ; Bin = 1'b0;
    #5 A = 1'b1 ; B = 1'b1 ; Bin = 1'b1;
end
endmodule