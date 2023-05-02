/* SIPO Declaration*/
module SIPO(
    input I,
    input clk,
    input reset,
    output [2:0] Q);

    FF_D ffd0(I, clk, reset, Q[2]);
    FF_D ffd1(Q[2], clk, reset, Q[1]);
    FF_D ffd2(Q[1], clk, reset, Q[0]);
    // FF_D ffd3(Q[1], clk, reset, Q[0]);
endmodule

/* PISO Declaration 
    Shift = 0
    Note: Shift first value is setted in 0.
    -> In class we see that we use the first value of the Input. In this case I[0]
    -> This PISO set the shiffting first value always in 0 for multiplier purposes.
    --------
    Load = 1 
*/
module PISO(
    input [3:0] I,
    input SL,
    input clk,
    input reset,
    output Q_out);

    reg [3:0] Q;

    assign Q_out = Q[0];

    always @(posedge clk) begin
        if (reset)
            Q <= 4'b0000;
        else if(SL && !reset) begin
            Q <= I;
        end else if(!SL && !reset) begin
            Q <= {Q[3], Q[3:1]};
            Q[3] <= 1'b0;  
        end
    end
endmodule

/* Legacy PISO code
Note: Timing diagrams reverse the array slots resulting in inverse Shifting.
      -> This Legacy PISO only works for Loading but not for shifting.
*/
// module PISO(
//     input [3:0] I,
//     input SL,
//     input clk,
//     input reset,
//     output [3:0] Q);

//     wire [2:0] m_Out;
//     wire [3:0] Q;

//     FF_D ff0(I[0], clk, reset, Q[0]);

//     MUX mux0(I[1], Q[0], SL, m_Out[0]);
//     FF_D ff1(m_Out[0], clk, reset, Q[1]);

//     MUX mux1(I[2], Q[1], SL, m_Out[1]);
//     FF_D ff2(m_Out[1], clk, reset, Q[2]);

//     MUX mux2(I[3], Q[2], SL, m_Out[2]);
//     FF_D ff3(m_Out[2], clk, reset, Q[3]);
// endmodule

/* PIPO Declaration */
module PIPO(
    input [3:0] D,
    input clk,
    input reset,
    output [3:0] Q);
    
    wire [3:0] Q;

    FF_D ff0(D[0], clk, reset, Q[0]);
    FF_D ff1(D[1], clk, reset, Q[1]);
    FF_D ff2(D[2], clk, reset, Q[2]);
    FF_D ff3(D[3], clk, reset, Q[3]);
endmodule


/* FF D Declaration */
module FF_D(
    input D,
    input clk,
    input reset,
    output q);

    reg q;

    always @(posedge clk) begin
        if(reset == 1) begin
            q <= 0;
        end else begin
            q <= D;
        end
    end 

endmodule