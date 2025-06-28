module encoder4to2(w3, w2, w1, w0, y1, y0);
input w3, w2, w1, w0; 
output y1, y0; 

or a1(y1, w2, w3);
or a2(y0, w1 , w3);

endmodule

module test4to2; 
reg w3, w2, w1, w0; 
wire y1, y0; 

encoder4to2 i(w3, w2, w1, w0, y1, y0);

initial
 begin
    w3 = 1'b0; w2 = 1'b0 ; w1 = 1'b0; w0 = 1'b0;
    $monitor ("Time= %0t, w3 = %b , w2 = %b , w1 = %b , w0 = %b , y1 = %b , y0 = %b", $time, w3, w2, w1, w0, y1, y0);
    #5   w3 = 1'b0; w2 = 1'b0 ; w1 = 1'b0; w0 = 1'b1;  
    #5   w3 = 1'b0; w2 = 1'b0 ; w1 = 1'b1; w0 = 1'b0;  
    #5   w3 = 1'b0; w2 = 1'b1 ; w1 = 1'b0; w0 = 1'b0;  
    #5   w3 = 1'b1; w2 = 1'b0 ; w1 = 1'b0; w0 = 1'b0;  
end
endmodule
