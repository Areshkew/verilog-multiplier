/* 4 Bit adder */
module bit4_adder(
    input [3:0] a,
    input [3:0] b,
    output [3:0] sum,
    output carry_out);

    wire [2:0] carry;

    half_adder add1(a[0], b[0], sum[0], carry[0]);
    full_adder add2(a[1], b[1], carry[0], sum[1], carry[1]);
    full_adder add3(a[2], b[2], carry[1], sum[2], carry[2]);
    full_adder add4(a[3], b[3], carry[2], sum[3], carry_out);
endmodule

/* Full Adder Declaration */
module full_adder(
    input a, 
    input b, 
    input cin, 
    output sum, 
    output carry);

    assign sum = a ^ b ^ cin;
    assign carry = (a & b) | (cin & (a ^ b));
endmodule

/* Half Adder Declaration */
module half_adder(
    input a, 
    input b, 
    output sum, 
    output carry);

    assign sum = a ^ b;
    assign carry = a & b;
endmodule