module encoder8to3(w7, w6, w5, w4, w3, w2, w1, w0, y2, y1, y0);
input w7, w6, w5, w4, w3, w2, w1, w0; 
output y2, y1, y0;

assign y2 = w4|w5|w6|w7;
assign y1 = w2|w3|w6|w7;
assign y0 = w1|w3|w5|w7;

endmodule

module testEncoder;
reg w7, w6, w5, w4, w3, w2, w1, w0; 
wire y2, y1, y0; 

encoder8to3 i(w7, w6, w5, w4, w3, w2, w1, w0, y2, y1, y0);

initial
begin
   #5 w7= 1'b0; w6=1'b0; w5= 1'b0; w4= 1'b0; w3= 1'b0; w2 = 1'b0; w1 = 1'b0; w0= 1'b0;
    $monitor("Time = %0t w7 = %b, w6 = %b, w5 = %b, w4 = %b, w3 = %b , w2 = %b , w1 = %b , w0 = %b , y2 = %b , y1 = %b , y0 = %b", $time, w7, w6, w5, w4, w3 , w2, w1, w0, y2, y1, y0);
   #5 w7= 1'b0; w6=1'b0; w5= 1'b0; w4= 1'b0; w3= 1'b0; w2 = 1'b0; w1 = 1'b0; w0= 1'b1;
   #5 w7= 1'b0; w6=1'b0; w5= 1'b0; w4= 1'b0; w3= 1'b0; w2 = 1'b0; w1 = 1'b1; w0= 1'b0;
   #5 w7= 1'b0; w6=1'b0; w5= 1'b0; w4= 1'b0; w3= 1'b0; w2 = 1'b1; w1 = 1'b0; w0= 1'b0;
   #5 w7= 1'b0; w6=1'b0; w5= 1'b0; w4= 1'b0; w3= 1'b1; w2 = 1'b0; w1 = 1'b0; w0= 1'b0;
   #5 w7= 1'b0; w6=1'b0; w5= 1'b0; w4= 1'b1; w3= 1'b0; w2 = 1'b0; w1 = 1'b0; w0= 1'b0;
   #5 w7= 1'b0; w6=1'b0; w5= 1'b1; w4= 1'b0; w3= 1'b0; w2 = 1'b0; w1 = 1'b0; w0= 1'b0;
   #5 w7= 1'b0; w6=1'b1; w5= 1'b0; w4= 1'b0; w3= 1'b0; w2 = 1'b0; w1 = 1'b0; w0= 1'b0;
   #5 w7= 1'b1; w6=1'b0; w5= 1'b0; w4= 1'b0; w3= 1'b0; w2 = 1'b0; w1 = 1'b0; w0= 1'b0;
end
endmodule 