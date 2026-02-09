module SUM_unit#(parameter DATA_WIDTH=16)(p,C,S);
    
    //DATA_WIDTH: parameter defining the number of bits for inputs and outputs
    
    //P: propagate signal resulted form the G_P_generation unit
    //C: carry signal resulted form the CLA unit
    input [DATA_WIDTH-1:0] p,C;
    //S: sum output
    output [DATA_WIDTH-1:0] S;
    
    assign S = p ^ C;
endmodule