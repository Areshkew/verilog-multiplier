/*
    ███╗   ███╗██╗   ██╗██╗  ████████╗██╗██████╗ ██╗     ██╗███████╗██████╗ 
    ████╗ ████║██║   ██║██║  ╚══██╔══╝██║██╔══██╗██║     ██║██╔════╝██╔══██╗
    ██╔████╔██║██║   ██║██║     ██║   ██║██████╔╝██║     ██║█████╗  ██████╔╝
    ██║╚██╔╝██║██║   ██║██║     ██║   ██║██╔═══╝ ██║     ██║██╔══╝  ██╔══██╗
    ██║ ╚═╝ ██║╚██████╔╝███████╗██║   ██║██║     ███████╗██║███████╗██║  ██║
    ╚═╝     ╚═╝ ╚═════╝ ╚══════╝╚═╝   ╚═╝╚═╝     ╚══════╝╚═╝╚══════╝╚═╝  ╚═╝
    Title: 
        -> Verilog Multiplier.

    Students:
        -> Miguel Angel Osorio Hernandez
        -> Gustavo Andrés Ramirez Lopez
        -> Oscar Julian Cardenas
    
    Subject: 
        "Electronica Digital"
    
    Teacher: 
        Ramiro Andrés Barrios Valencia

    Logic Components used:
        -> REGISTERS:
            -PIPO
            -SIPO
            -PISO
        -> 4 BIT ADDER
        -> MUX
        -> FLIPFLOP D
*/

`include "multiplier.v"

// NOTE: RESET = 1, will reset all data, use with precaution
module MULTIPLIER_tb;
    reg [3:0] A, B;
    reg clk, ready, SL, reset;
    wire [7:0] Result;

    MULTIPLIER multiplier(A, B, clk, reset, ready, SL, Result);
 
    // CLK Signal
    initial begin
        clk=0;
        repeat(9) #1 clk = ~clk;
    end 

    // TB Signals
    initial 
        begin
            $dumpfile("MULTIPLIER_tb.vcd");
            $dumpvars(0, MULTIPLIER_tb);

            // Insert Here your Input values for multiply
            A = 4'b1111;
            B = 4'b1111;
            reset = 0; // Initialize reset input.

            // Load Data
            SL = 1; // B input, PISO LOAD
            ready = 0;

            // Start doing calculations
            #2
            SL = 0; // Shift Input B Values 
            ready = 1; // MUX start receiving Adder Signals
            
            // RESET if Needed
            // #7 
            // reset = 1;

        end
endmodule