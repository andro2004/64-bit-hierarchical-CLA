`timescale 1ns / 1ps
module CLA_tb();

    localparam DATA_WIDTH = 64;
    
    reg [DATA_WIDTH-1:0] A,B;
    reg Cin;
    wire [DATA_WIDTH-1:0] S;
    wire Cout;
    
    CLA_64_bit DUT(.A(A),.B(B),.S(S),.Cout(Cout),.Cin(Cin));
    integer i,passed=0,failed=0;
    initial begin
        
        for (i=0;i<90;i=i+1) begin
            A = $unsigned($urandom_range(2**DATA_WIDTH-1,0));
            B = $unsigned($urandom_range(2**DATA_WIDTH-1,0));
            Cin = $unsigned($urandom_range(1,0));
            #10;
            $display("A =%d, B=%d, Cin=%b Sum =%d",A,B,Cin,{Cout,S});
            if ({Cout,S}!= A+B+Cin )begin 
                $display("Test failed");
                failed = failed+1;
            end
            else begin
                $display("Test Passed");
                passed =passed +1;
            end
        end
    $display("Testing 16-bit adding:");
    A = 16'b1111111111111111;
    B = 16'b1111111111111111;
    Cin = 1'b1;
    #10;
    $display("A =%d, B=%d, Cin=%b Sum =%d",A,B,Cin,{Cout,S});
    if ({Cout,S}!= A+B+Cin )begin 
        $display("Test failed");
        failed = failed+1;
    end
    else begin
        $display("Test Passed");
        passed =passed +1;
    end
    
    Cin = 1'b0;
    #10;
    $display("A =%d, B=%d, Cin=%b Sum =%d",A,B,Cin,{Cout,S});
    if ({Cout,S}!= A+B+Cin )begin 
        $display("Test failed");
        failed = failed+1;
    end
    else begin
        $display("Test Passed");
        passed =passed +1;
    end
    
    $display("Testing 32-bit adding:");
    A = 32'b11111111111111111111111111111111;
    B = 32'b11111111111111111111111111111111;
    Cin = 1'b1;
    #10;
    $display("A =%d, B=%d, Cin=%b Sum =%d",A,B,Cin,{Cout,S});
    if ({Cout,S}!= A+B+Cin )begin 
        $display("Test failed");
        failed = failed+1;
    end
    else begin
        $display("Test Passed");
        passed =passed +1;
    end
    
    Cin = 1'b0;
    #10;
    $display("A =%d, B=%d, Cin=%b Sum =%d",A,B,Cin,{Cout,S});
    if ({Cout,S}!= A+B+Cin )begin 
        $display("Test failed");
        failed = failed+1;
    end
    else begin
        $display("Test Passed");
        passed =passed +1;
    end
    
    $display("Testing 48-bit adding:");
    A = 48'b111111111111111111111111111111111111111111111111;
    B = 48'b111111111111111111111111111111111111111111111111;
    Cin = 1'b1;
    #10;
    $display("A =%d, B=%d, Cin=%b Sum =%d",A,B,Cin,{Cout,S});
    if ({Cout,S}!= A+B+Cin )begin 
        $display("Test failed");
        failed = failed+1;
    end
    else begin
        $display("Test Passed");
        passed =passed +1;
    end
    
    Cin = 1'b0;
    #10;
    $display("A =%d, B=%d, Cin=%b Sum =%d",A,B,Cin,{Cout,S});
    if ({Cout,S}!= A+B+Cin )begin 
        $display("Test failed");
        failed = failed+1;
    end
    else begin
        $display("Test Passed");
        passed =passed +1;
    end
    
    $display("Testing 64-bit adding:");
    A = 64'b1111111111111111111111111111111111111111111111111111111111111111;
    B = 64'b1111111111111111111111111111111111111111111111111111111111111111;
    Cin = 1'b1;
    #10;
    $display("A =%d, B=%d, Cin=%b Sum =%d",A,B,Cin,{Cout,S});
    if ({Cout,S}!= A+B+Cin )begin 
        $display("Test failed");
        failed = failed+1;
    end
    else begin
        $display("Test Passed");
        passed =passed +1;
    end
    
    Cin = 1'b0;
    #10;
    $display("A =%d, B=%d, Cin=%b Sum =%d",A,B,Cin,{Cout,S});
    if ({Cout,S}!= A+B+Cin )begin 
        $display("Test failed");
        failed = failed+1;
    end
    else begin
        $display("Test Passed");
        passed =passed +1;
    end
    
    if (passed!=98)begin 
        $display("%d,Test Failed",failed); 
        $display("%d,Test Passed",passed);
    end
    else begin
        $display("All Test passed");
    end
    end
endmodule
