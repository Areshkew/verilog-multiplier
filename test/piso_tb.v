`include "registers.v"

module PISO_tb;
    reg [3:0] I;
    reg clk, reset, SL;
    wire q;

    PISO piso0(I, SL, clk, reset, q);

    // CLK Signal
    initial begin
        clk=0;
        repeat(20) #10 clk = ~clk;
    end 

    // TB Signals
    initial 
        begin
            $dumpfile("PISO_tb.vcd");
            $dumpvars(0, PISO_tb);

            reset = 1;
            #20
            reset = 0;
            SL = 1; I = 4'b1001;
            #20
            I = 4'b1011;
            #20
            I = 4'b1000;
            #30
            SL = 0;  I = 4'b0001;

        end
endmodule