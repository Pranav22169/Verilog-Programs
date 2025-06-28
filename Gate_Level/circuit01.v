module circuit01(A, B, C, D);
input A, B, C; 
output D; 
wire w1 , w2; 
not a1(w1 , A);
or a2(w2 , B, C);
nand a3(D, w1 , w2); 
endmodule

module test; 
reg A, B, C; 
wire D;
circuit01 i(A, B, C , D);
initial 
begin 
    A = 1'b0;
    B= 1'b0;
    C= 1'b0;

    $monitor("Time= %0t , a= %b, b= %b , c = %b , x = %b", $time , A , B , C , D);

    #5 A = 1'b0 ; B = 1'b0 ; C = 1'b0;
    #5 A = 1'b0 ; B = 1'b0 ; C = 1'b1;
    #5 A = 1'b0 ; B = 1'b1 ; C = 1'b0;
    #5 A = 1'b0 ; B = 1'b1 ; C = 1'b1;
    #5 A = 1'b1 ; B = 1'b0 ; C = 1'b0;
    #5 A = 1'b1 ; B = 1'b0 ; C = 1'b1;
    #5 A = 1'b1 ; B = 1'b1 ; C = 1'b0;
    #5 A = 1'b1 ; B = 1'b1 ; C = 1'b1;

end 
endmodule