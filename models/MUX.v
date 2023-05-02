/* BitWiseX MUX Declaration */
module MUX(
    input [3:0] A,
    input SEL,
    output [3:0] Out);

    reg [3:0] O;
    assign Out = O;

    always @(A, SEL) begin 
        case(SEL)
            1'b0: O = 4'b0000; 
            1'b1: O = A; 
        endcase
    end
endmodule