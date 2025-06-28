module norGate(A, B, C); 
input A, B;
output C; 
assign C = ~(A | B); 
endmodule

module test; 
reg A, B; 
wire C; 
norGate i(A, B, C); 
initial 
begin 
    A= 1'b0; B= 1'b0;
    $monitor("Time= %0t, A= %b , B= %b, C= %b" , $time , A, B, C);
    #5 A= 1'b0; B= 1'b1;
    #5 A= 1'b1; B= 1'b0;
    #5 A= 1'b1; B= 1'b1;
end
endmodule