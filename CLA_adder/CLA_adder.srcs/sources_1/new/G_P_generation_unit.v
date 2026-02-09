module G_P_generation_unit#(parameter DATA_WIDTH=16)(A,B,g,p);
    
    //DATA_WIDTH: parameter defining the number of bits for inputs and outputs
    
    //A,B: input numbers to be added
    input [DATA_WIDTH-1:0] A,B;
    //G: generate signal output
    //P: propate signal output
    output [DATA_WIDTH-1:0] g,p;
    
    assign g = A & B;
    assign p = A ^ B;
endmodule