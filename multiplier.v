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

`include "models/registers.v"
`include "models/MUX.v"
`include "models/4_bit_adder.v"

module MULTIPLIER(
    input [3:0] A,
    input [3:0] B,
    input clk,
    input reset,
    input ready,
    input SL,
    output [7:0] R);

    // Step 1, Load the numbers
    wire [3:0] PIPO0_out;
    PIPO pipo0(A, clk, reset, PIPO0_out); 

    wire PISO0_out;
    PISO piso0(B, SL, clk, reset, PISO0_out);

    // Step 2, Bit wise X operation
    wire [3:0] Bit_Wise_X_Out;
    MUX bitwise0(PIPO0_out, PISO0_out, Bit_Wise_X_Out);

    // Step 3, Adder process
    wire [3:0] Selector_Out;
    wire [3:0] Adder_Out;
    wire [3:0] PIPO1_out;
    wire Carry_Out;
    bit4_adder adder0(Bit_Wise_X_Out, PIPO1_out, Adder_Out, Carry_Out);
    MUX selector0({Carry_Out, Adder_Out[3:1]}, ready, Selector_Out);
    PIPO pipo1(Selector_Out, clk, reset, PIPO1_out);

    // Step 4, Managing result
    wire [2:0] SIPO0_out;
    SIPO sipo0(Adder_Out[0], clk, reset, SIPO0_out);

    // Step 5, Store result
    assign R = {Carry_Out, Adder_Out, SIPO0_out};
endmodule