module CLA_64_bit(A,B,S,G,P,Cout,Cin);
    
    input [63:0] A,B;
    input Cin;
    output [63:0] S;
    output G,P;
    wire [3:0] g,p;
    output Cout;
    
    wire [4:0] Cinternal;

    CLA_16_bit CLA1(.A(A[15:0]),.B(B[15:0]),.S(S[15:0]),.Cin(Cin),.G(g[0]),.P(p[0]));
    CLA_16_bit CLA2(.A(A[31:16]),.B(B[31:16]),.S(S[31:16]),.Cin(Cinternal[1]),.G(g[1]),.P(p[1]));
    CLA_16_bit CLA3(.A(A[47:32]),.B(B[47:32]),.S(S[47:32]),.Cin(Cinternal[2]),.G(g[2]),.P(p[2]));
    CLA_16_bit CLA4(.A(A[63:48]),.B(B[63:48]),.S(S[63:48]),.Cin(Cinternal[3]),.G(g[3]),.P(p[3]));
    CLA_network cla_network(.g({g[3],g[2],g[1],g[0]}),.p({p[3],p[2],p[1],p[0]}),.Cin(Cin),.C(Cinternal),.G(G),.P(P));
    assign Cout = Cinternal[4];
endmodule