module fullSubstractor(A, B, Bin, Diff, Bout);
input A, B, Bin;
output Diff, Bout; 
wire w1, w2, w3, w4, w5; 
assign w1 = A ^ B; 
assign Diff = w1 ^ Bin; 
assign w2 = ~(w1); 
assign w3 = w2 & Bin; 
assign w4 = ~(A); 
assign w5 = w4 & B; 
assign Bout = w3 | w5; 
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