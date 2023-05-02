`include "registers.v"

module FF_D_Tb;
    reg D, clk;
    wire q, q_bar;

    FF_D ff0(.D(D), .clk(clk), .q(q), .q_bar(q_bar));

    initial begin
        clk=0;
        #10 clk = ~clk;  
        #10 clk = ~clk;  
        #10 clk = ~clk;  
        #10 clk = ~clk;  
        #10 clk = ~clk;  
        #10 clk = ~clk;  
    end 

    initial 
        begin
            $dumpfile("FF_D_tb.vcd");
            $dumpvars(0, FF_D_Tb);

            D = 0;
            #20;
            D = 1;
            #20;
            D = 0;
            #20;
            D = 1;
        end
endmodule