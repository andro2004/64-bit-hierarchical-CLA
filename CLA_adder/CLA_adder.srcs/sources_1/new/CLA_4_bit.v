`timescale 1ns / 1ps

module CLA_4_bit(A,B,S,Cout,Cin,G,P);
    
    input [3:0] A,B;
    input Cin;
    output [3:0] S;
    output G,P;
    output Cout;
    
    wire [3:0] g,p;
    wire [4:0] C;
    G_P_generation_unit#(.DATA_WIDTH(4)) g_p_gen (.A(A),.B(B),.g(g),.p(p));
    CLA_network cla_network(.p(p),.g(g),.Cin(Cin),.C(C),.G(G),.P(P));
    SUM_unit#(.DATA_WIDTH(4))sum_unit(.p(p),.C(C[3:0]),.S(S));
    
    assign Cout = C[4];
endmodule
