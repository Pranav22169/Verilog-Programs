module or_gate(A, B, C);
input A, B; 
output C; 
reg C; 
always @(A or B)
begin 
    if(A == 1'b0 && B == 1'b0)
        C= 1'b0;
    else
        C= 1'b1;
end 
endmodule

module test;
reg A, B;
wire C;
or_gate i(A, B, C);
initial
    begin
    
