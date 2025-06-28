module decoder3to8(E, i0, i1, i2, y0, y1, y2, y3, y4, y5, y6, y7, y8);
input E, i0, i1, i2; 
output y0, y1, y2, y3, y4, y5, y6, y7, y8;
wire w1, w2, w3; 

not a1(w1, i0);
not a2(w2, i1);
not a3(w3, i2);
and a4(y0, E, w1, w2, w3);
and a5(y1, E, w1, w2, i2);
and a6(y2, E, w1, i1, w3);
and a7(y3, E, w1, i1, i2);
and a8(y4, E, i0, w2, w3);
and a9(y5, E, i0, w2, i2);
and a10(y6, E, i0, i1, w3);
and a11(y7, E, i0, i1, i2);

endmodule

module testDecoder;
reg E, i0, i1, i2; 
wire y0, y1, y2, y3, y4, y5, y6, y7, y8; 

decoder3to8 i(E, i0, i1, i2, y0, y1, y2, y3, y4, y5, y6, y7, y8);

initial 
begin 
    E = 1'b0; 
    i0 = 1'b0; 
    i1 = 1'b0; 
    i2 = 1'b0; 

    $monitor("Time = %0t,E= %b,  i0= %b , i1= %b, i2= %b , y0= %b ; y1= %b , y2= %b , y3= %b , y4= %b , y5= %b , y6= %b , y7= %b", $time,E, i0, i1, i2, y0, y1, y2, y3, y4, y5, y6, y7 );

      #5  E = 1'b1; i0 = 1'b0;  i1 = 1'b0;  i2 = 1'b0;     
      #5  E = 1'b1; i0 = 1'b0;  i1 = 1'b0;  i2 = 1'b1;     
      #5  E = 1'b1; i0 = 1'b0;  i1 = 1'b1;  i2 = 1'b0;     
      #5  E = 1'b1; i0 = 1'b0;  i1 = 1'b1;  i2 = 1'b1;     
      #5  E = 1'b1; i0 = 1'b1;  i1 = 1'b0;  i2 = 1'b0;     
      #5  E = 1'b1; i0 = 1'b1;  i1 = 1'b0;  i2 = 1'b1;     
      #5  E = 1'b1; i0 = 1'b1;  i1 = 1'b1;  i2 = 1'b0;     
      #5  E = 1'b1; i0 = 1'b1;  i1 = 1'b1;  i2 = 1'b1;
end
endmodule     