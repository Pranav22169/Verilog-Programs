module not_gate(A, B);
input A;
output B; 
not a1(B, A);
endmodule

module test; 
reg A; 
wire B; 
not_gate i(A, B);
initial 
begin 
    A = 1'b0;
    $monitor("Time: %0t , A= %b , B = %b" , $time , A , B);
    #5 A= 1'b0; 
    #5 A = 1'b1; 
end
endmodule