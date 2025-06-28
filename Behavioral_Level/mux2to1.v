module mux2to1(A, B, S, Y);
input A, B, S; 
output Y; 
reg Y; 

always @(A or B)
begin 
    if(S == 1'b0) begin
        Y = A;     
    end
    else begin
        Y = B; 
    end    
end
endmodule

module muxTest;
reg A, B, S;
wire Y; 

mux2to1 i(A, B, S, Y);
initial
begin 
    A= 1'b1; 
    B=1'b1; 
    S= 1'b0 ; 
    $monitor ("Time= %0t , S= %b , A = %b , B = %b , Y = %b", $time ,S ,A ,B, Y);
end
endmodule
