`include "4_bit_adder.v"

module bit4_adder_tb;
    reg [3:0] a;
    reg [3:0] b;
    wire [3:0] sum;
    wire carry_out;
    
    bit4_adder adder4(a, b, sum, carry_out);
     
    initial 
        begin
            $dumpfile("4_bit_adder_tb.vcd");
            $dumpvars(0, bit4_adder_tb);

            a = 4'b1010; b = 4'b1011;
            #5
            $display("Suma(%b + %b) | Resultado: %b%b", a, b, carry_out, sum);
        end
endmodule