module DflipFlop(D, clk , Q); 
input D, clk; 
output Q; 
reg Q; 

always @(negedge clk)
    begin 
        Q = D; 
    end
endmodule

module test_D; 
reg D, clk ;
wire Q; 

DflipFlop i(D, clk, Q); 

initial 
    begin 
        D = 1'b1 ; clk = 1'b1; 
    $monitor("Time = %0t, D = %b , clk = %b , Q = %b", $time , D, clk , Q); 
       #5 D = 1'b0 ; clk = 1'b0; 
       #5 D = 1'b0; clk = 1'b1; 
       #5 D = 1'b0 ; clk = 1'b0; 
       #5 D = 1'b1 ; clk = 1'b1; 
    end
endmodule