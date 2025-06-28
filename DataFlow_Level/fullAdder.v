module fullAdder(A, B, Cin, S , Cout);
input A, B, Cin; 
output S , Cout;
wire w1, w2, w3; 
assign w1 = A ^ B; 
assign S = w1 ^ Cin; 
assign w2 = Cin & w1; 
assign w3 = A & B;
assign Cout = w2 | w3; 
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
