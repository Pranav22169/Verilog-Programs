module halfAdder(A, B, Sum , Carry); 
input A, B; 
output Sum , Carry; 
xor a1(Sum , A, B); 
and a2(Carry, A, B); 
endmodule

module fullAdder(A, B, Cin, Sum, Carry);
input A, B, Cin; 
output Sum, Carry; 
wire c, s , c1;

halfAdder i(A, B, s ,c );
halfAdder i1(s, Cin,Sum , c1 );
or i3(Carry , c , c1);

endmodule

module test; 
reg A, B, Cin; 
wire S , Carry; 
fullAdder i(A, B, Cin, S, Carry); 
initial 
begin
     A = 1'b0;
    B= 1'b0;
    Cin= 1'b0;
    $display("A     B     Cin     Sum     Carry     Time");
    $display("----------------------------------");
    $monitor(" %b    %b     %b       %b       %b           %0t ", A , B , Cin ,S ,Carry, $time);

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

