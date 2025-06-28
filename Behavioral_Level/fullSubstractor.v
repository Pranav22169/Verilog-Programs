// module fullSubstractor(A, B, Bin, Diff, Bout);
// input A, B, Bin; 
// output Diff, Bout; 
// reg Diff, Bout, w1, w2, w3, w4, w5; 
// always @(A or B or Bin);
// begin
//     if( A == B)
//         w1 = 1'b0; 
//     else
        
//         w1 = 1'b1; 
    
//     if( w1 == Bin)
//         Diff = 1'b0; 
//     else
        
//         Diff = 1'b1; 

//     if(w1 == 1'b1)
//         w2 = 1'b0; 
//     else
//         w2= 1'b1;
    
//     if(w2== 1'b1 && Bin== 1'b1)
//         w3= 1'b1;
//     else
//         w3= 1'b0;

//     if(A == 1'b1)
//         w4 = 1'b0; 
//     else
//         w4= 1'b1;

//     if(w4== 1'b1 && B== 1'b1)
//         w5= 1'b1;
//     else
//         w5= 1'b0;

//     if(w3 == 1'b0 && w5 == 1'b0)
//         Bout= 1'b0;
//     else
//         Bout= 1'b1;
// end
// endmodule

// module FullSubstractor;
// reg A, B, Bin; 
// wire Diff, Bout; 
// fullSubstractor i(A, B, Bin, Diff, Bout);
// initial
// begin
//     A= 1'b0;
//     B= 1'b0;
//     Bin= 1'b0;
//     $monitor("time=%0t , A= %b , B = %b ; Bin = %b , Diff = %b , Bout = %b" , $time , A ,B , Bin , Diff , Bout);
//      #5 A = 1'b0 ; B = 1'b0 ; Bin = 1'b0;
//     #5 A = 1'b0 ; B = 1'b0 ; Bin = 1'b1;
//     #5 A = 1'b0 ; B = 1'b1 ; Bin = 1'b0;
//     #5 A = 1'b0 ; B = 1'b1 ; Bin = 1'b1;
//     #5 A = 1'b1 ; B = 1'b0 ; Bin = 1'b0;
//     #5 A = 1'b1 ; B = 1'b0 ; Bin = 1'b1;
//     #5 A = 1'b1 ; B = 1'b1 ; Bin = 1'b0;
//     #5 A = 1'b1 ; B = 1'b1 ; Bin = 1'b1;
// end
// endmodule

module fullSubstractor(
    input A, B, Bin,
    output reg Diff, Bout
);

always @* begin
    if (A == B)
        Diff = 1'b0; 
    else
        Diff = 1'b1; 
    
    if (Diff == Bin)
        Diff = 1'b0; 
    else
        Diff = 1'b1; 

    if (~Diff)
        Bout = 1'b0;
    else
        Bout = (A & ~B & Bin) | (~A & B & ~Bin);
end

endmodule

module FullSubstractor_tb;

reg A, B, Bin; 
wire Diff, Bout; 
fullSubstractor i(A, B, Bin, Diff, Bout);

initial begin
    $monitor("time=%0t, A=%b, B=%b, Bin=%b, Diff=%b, Bout=%b", $time, A, B, Bin, Diff, Bout);
    #5 A = 1'b0; B = 1'b0; Bin = 1'b0;
    #5 A = 1'b0; B = 1'b0; Bin = 1'b1;
    #5 A = 1'b0; B = 1'b1; Bin = 1'b0;
    #5 A = 1'b0; B = 1'b1; Bin = 1'b1;
    #5 A = 1'b1; B = 1'b0; Bin = 1'b0;
    #5 A = 1'b1; B = 1'b0; Bin = 1'b1;
    #5 A = 1'b1; B = 1'b1; Bin = 1'b0;
    #5 A = 1'b1; B = 1'b1; Bin = 1'b1;
    #5 $finish;
end

endmodule
