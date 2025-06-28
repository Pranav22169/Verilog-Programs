module fullAdder(A, B, Cin , S , Cout);
input A, B , Cin; 
output S, Cout; 
wire w1, w2, w3; 
xor a1(w1, A, B);
xor a2(S , w1 , Cin); 
and a3(w2, Cin, w1); 
and a4(w3, A, B); 
or a5(Cout , w2, w3); 
endmodule

module test; 
reg A, B, Cin; 
wire S , Cout; 
fullAdder i(A, B, Cin, S, Cout); 
initial 
begin
     A = 1'b0;
    B= 1'b0;
    Cin= 1'b0;
    $display("A     B     Cin     Sum     Carry     Time");
    $display("----------------------------------");
    $monitor(" %b    %b     %b       %b       %b           %0t ", A , B , Cin ,S ,Cout, $time);

    #5 A = 1'b0 ; B = 1'b0 ; Cin = 1'b0;
    #5 A = 1'b0 ; B = 1'b0 ; Cin = 1'b1;
    #5 A = 1'b0 ; B = 1'b1 ; Cin = 1'b0;
    #5 A = 1'b0 ; B = 1'b1 ; Cin = 1'b1;
    #5 A = 1'b1 ; B = 1'b0 ; Cin = 1'b0;
    #5 A = 1'b1 ; B = 1'b0 ; Cin = 1'b1;
    #5 A = 1'b1 ; B = 1'b1 ; Cin = 1'b0;
    #5 A = 1'b1 ; B = 1'b1 ; Cin = 1'b1;

end 
endmodule
