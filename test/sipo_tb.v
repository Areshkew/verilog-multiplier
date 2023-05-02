`include "registers.v"

module SIPO_tb;
    reg I, clk, reset;
    wire [3:0] q;

    SIPO sipo0(I, clk, reset, q);

    // CLK Signal
    initial begin
        clk=0;
        repeat(20) #10 clk = ~clk;
    end 

    // TB Signals
    initial 
        begin
            $dumpfile("SIPO_tb.vcd");
            $dumpvars(0, SIPO_tb);

            I = 1;

        end
endmodule