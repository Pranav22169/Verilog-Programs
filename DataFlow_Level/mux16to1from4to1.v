module mux(a, b, c, d, s0, s1, y);
input a, b, c, d, s0, s1; 
output y; 
wire w1, w2; 

assign w1 = ~s0; 
assign w2 = ~s1;
assign y = (w1 & w2 & a) | (w1 & s1 & b) | (s0 & w2 & c) | (s1 & s2 & d);

endmodule

module mux16to1(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, s0, s1, s2, s3, y);
input a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, s0, s1, s2, s3; 
output y; 
wire w1, w2, w3, w4; 

mux i1(a1, a2, a3, a4, s0, s1, w1);
mux i2(a5, a6, a7, a8, s0, s1, w2);
mux i3(a9, a10, a11, a12, s0, s1, w3);
mux i4(a13, a14, a15, a16, s0, s1, w4);
mux i5(w1, w2, w3, w4, s2, s3, y);

endmodule

module test; 
    reg a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, s0, s1, s2, s3; 
    wire y; 

     mux16to1 i(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, s0, s1, s2, s3, y);

initial 
    begin 
         a1=1'b0; a2=1'b0; a3=1'b0; a4=1'b0; a5=1'b0; a6=1'b0; a7=1'b0; a8=1'b0; a9=1'b0;a10=1'b0; a11=1'b0; a12=1'b0; a13=1'b0; a14=1'b0; a15=1'b0; a16=1'b0; s0=1'b0; s1=1'b0; s2=1'b0; s3=1'b0;
         $monitor("s0=%b  s1=%b  s2=%b  s3=%b  y=%b  Time=%0ts",s0,s1,s2,s3,y,$time);
    end
endmodule