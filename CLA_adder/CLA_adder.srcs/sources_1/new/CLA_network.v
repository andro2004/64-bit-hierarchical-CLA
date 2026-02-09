`timescale 1ns / 1ps
module CLA_network(G,P,p,g,Cin,C);
    input[3:0] p,g;
    input Cin;
    output G,P;
    output[4:0] C;
    
    assign C[0] = Cin;
    assign C[1] = g[0] | (p[0]&C[0]);
    assign C[2] = g[1] | (g[0]&p[1]) | (p[1]&p[0]&C[0]);
    assign C[3] = g[2] | (g[1]&p[2]) | (g[0]&p[1]&p[2]) | (p[2]&p[1]&p[0]&C[0]);
    assign G = g[3] | (g[2]&p[3]) | (g[1]&p[2]&p[3]) | (g[0]&p[1]&p[2]&p[3]);
    assign P = (p[3]&p[2]&p[1]&p[0]&C[0]);
    assign C[4] = g[3] | (g[2]&p[3]) | (g[1]&p[2]&p[3]) | (g[0]&p[1]&p[2]&p[3]) | (p[3]&p[2]&p[1]&p[0]&C[0]);
endmodule
