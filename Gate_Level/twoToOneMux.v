module multiplexer(A0, A1, S, Y);
input A0, A1, S; 
output Y;
wire w1, w2, w3; 

not a1(w1, S);
and a2(w2, A0, w1);
and a3(w3, A1, S);
or a4(Y, w2, w3);

endmodule

module imp_multiplexer;
reg A0, A1, S; 
wire Y; 
multiplexer i(A0, A1, S, Y);
initial
begin
    A0 = 1'b0; 
    A1 = 1'b0;
    S = 1'b0; 

$monitor ("Time= %0t , S= %b , A = %b , B = %b , Y = %b", $time ,S,  A0 , A1 ,  Y);
#5 S= 1'b0 ; A0 = 1'b0 ; A1 = 1'b0; 
#5 S= 1'b0 ; A0 = 1'b0 ; A1 = 1'b1; 
#5 S = 1'b1 ; A0 = 1'b1 ; A1 = 1'b0; 
#5 S = 1'b1 ; A0 = 1'b1 ; A1 = 1'b1; 

end
endmodule 