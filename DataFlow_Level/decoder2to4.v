module encoder2to4(E, i0, i1, y0, y1, y2, y3);
input E, i0, i1; 
output y0, y1, y2, y3; 
wire w1, w2;

assign w1 = ~i0;
assign w2 = ~i1;
assign y0 = w1 & w2 & E; 
assign y1 = w1 & i1 & E; 
assign y2 = i0 & w2 & E; 
assign y3 = i0 & i1 & E;
endmodule

module testEncoder; 
reg E, i0, i1; 
wire y0, y1, y2, y3; 

encoder2to4 i(E, i0, i1, y0, y1, y2, y3);

initial 
begin 
    E = 1'b0; i0 = 1'b0; i1 = 1'b0; 
    $monitor("Time = %0t E = %b , i0 = %b, i1 = %b , y0 = %b , y1 = %b , y2 = %b , y3 = %b", $time,E, i0, i1, y0, y1, y2, y3 );
    #5 E = 1'b1; i0 = 1'b0; i1 = 1'b0; 
    #5 E = 1'b1; i0 = 1'b0; i1 = 1'b1; 
    #5 E = 1'b1; i0 = 1'b1; i1 = 1'b0; 
    #5 E = 1'b1; i0 = 1'b1; i1 = 1'b1;
end
endmodule 

