// compressor.sv
`include "full_adder.sv"
module compressor #(parameter DEPTH = 5)(
    input  logic in[DEPTH-1:0],  // in[0] = X1, in[1] = X2, in[2] = X3, in[3] = X4
    //input  logic cin,
    output logic sum,
    output logic carry
    //output logic cout  // output of first FA, optional based on your table
);

    wire sum1,cout;

    // First full adder: X1, X2, X3 → sum1, cout
    full_adder fa1 (
        .a(in[0]),     // X1
        .b(in[1]),     // X2
        .cin(in[2]),   // X3
        .sum(sum1),
        .cout(cout)
    );

    // Second full adder: sum1, X4, Cin → Sum, Carry
    full_adder fa2 (
        .a(sum1),
        .b(in[3]),     // X4
        .cin(in[4]),
        .sum(sum),
        .cout(carry)
    );

endmodule
