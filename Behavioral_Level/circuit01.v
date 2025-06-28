module circuit01(A, B, C ,X); 
input A, B, C; 
output X; 
reg X; 
reg w1 , w2; 
always @(A or B or C)
begin 
    if( A == 1'b1)
    begin
        w1 = 1'b0;
    end
    else
    begin
        w1 = 1'b1;  
    end    
    if( B == 1'b0 && C == 1'b0)
    begin
        w2 = 1'b0; 
    end
    else
    begin 
        w2 = 1'b1; 
    end  
    if(w1== 1'b1 && w2 == 1'b1) 
    begin
        X= 1'b0;
    end
    else
    begin
       X= 1'b1;
    end
end
endmodule

module test; 
reg A, B, C; 
wire D;
circuit01 i(A, B, C , D);
initial 
begin 
    A = 1'b0;
    B= 1'b0;
    C= 1'b0;

    $monitor("Time= %0t , a= %b, b= %b , c = %b , x = %b", $time , A , B , C , D);

    #5 A = 1'b0 ; B = 1'b0 ; C = 1'b0;
    #5 A = 1'b0 ; B = 1'b0 ; C = 1'b1;
    #5 A = 1'b0 ; B = 1'b1 ; C = 1'b0;
    #5 A = 1'b0 ; B = 1'b1 ; C = 1'b1;
    #5 A = 1'b1 ; B = 1'b0 ; C = 1'b0;
    #5 A = 1'b1 ; B = 1'b0 ; C = 1'b1;
    #5 A = 1'b1 ; B = 1'b1 ; C = 1'b0;
    #5 A = 1'b1 ; B = 1'b1 ; C = 1'b1;

end 
endmodule