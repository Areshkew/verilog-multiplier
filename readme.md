Steps for executing: 

1. Make sure you have installed icarus verilog (https://bleyer.org/icarus/) 
2. Execute the following commands in terminal.
    a. Compile verilog code.
        iverilog -o multiplier_tb.vvp multiplier_tb.v
    b. Execute TestBench
        vvp  multiplier_tb.vvp
    c. After previous step, it will generate a dump file with result signals.
        gtkwave
3. Or use your own Verilog Compiler :D

-------------------------------------------------------------------------

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
