`timescale 1ns / 1ps
module CLA_16_bit(A,B,S,G,P,Cout,Cin);
    
    input [15:0] A,B;
    input Cin;
    output [15:0] S;
    output G,P;
    wire [3:0] g,p;
    output Cout;
    
    wire [4:0] Cinternal;

    CLA_4_bit CLA1(.A(A[3:0]),.B(B[3:0]),.S(S[3:0]),.Cin(Cin),.G(g[0]),.P(p[0]));
    CLA_4_bit CLA2(.A(A[7:4]),.B(B[7:4]),.S(S[7:4]),.Cin(Cinternal[1]),.G(g[1]),.P(p[1]));
    CLA_4_bit CLA3(.A(A[11:8]),.B(B[11:8]),.S(S[11:8]),.Cin(Cinternal[2]),.G(g[2]),.P(p[2]));
    CLA_4_bit CLA4(.A(A[15:12]),.B(B[15:12]),.S(S[15:12]),.Cin(Cinternal[3]),.G(g[3]),.P(p[3]));
    CLA_network cla_network(.g({g[3],g[2],g[1],g[0]}),.p({p[3],p[2],p[1],p[0]}),.Cin(Cin),.C(Cinternal),.G(G),.P(P));
    assign Cout = Cinternal[4];
endmodule
