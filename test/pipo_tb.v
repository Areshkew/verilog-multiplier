`include "registers.v"

module PIPO_tb;
    reg [3:0] D;
    reg clk, reset;
    wire [3:0] q;

    PIPO pipo0(D, clk, reset, q);

    // CLK Signal
    initial begin
        clk=0;
        repeat(20) #10 clk = ~clk;
    end 

    // TB Signals
    initial 
        begin
            $dumpfile("PIPO_tb.vcd");
            $dumpvars(0, PIPO_tb);

            reset = 0;

            D = 4'b0101;
            #20;
            D = 4'b0111;
            #20;
            D = 4'b1101;
            #20;
            D = 4'b1111;
            #20
            reset = 1;
        end
endmodule