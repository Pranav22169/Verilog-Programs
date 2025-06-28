module fullAdder(A, B, Cin, S, Cout); 
input A, B, Cin; 
output S, Cout; 
reg S, Cout, w1, w2, w3; 

always @(A or B or Cin)
begin
    if( A == B)
        w1 = 1'b0; 
    else
        
        w1 = 1'b1;

    if( w1 == Cin)
        S = 1'b0; 
    else
        
        S = 1'b1; 

    if(w1== 1'b1 && Cin== 1'b1)
        w2= 1'b1;
    else
        w2= 1'b0;
    
    if(A== 1'b1 && B== 1'b1)
        w3= 1'b1;
    else
        w3= 1'b0;

    if(w2 == 1'b0 && w3 == 1'b0)
        Cout= 1'b0;
    else
        Cout= 1'b1;
end
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