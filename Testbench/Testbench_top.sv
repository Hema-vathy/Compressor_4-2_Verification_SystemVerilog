///////////////////*************TESTBENCH TOP FILE*************///////////////////
`include "interface.v"
module compressor_tb_top();
    
  //handle creation
  signal_intf intf();

    // Instantiate the DUT
    compressor compressor_inst(
      .in(intf.in),
      .sum(intf.sum),
      .carry(intf.carry)
    );

    integer i, j;

    // Flattened input vector for enumeration
  logic [intf.DEPTH-1:0] flat_input;

    initial begin
      $display("Starting exhaustive simulation for DEPTH=%0d", intf.DEPTH);
      for (i = 0; i < intf.TOTAL_PATTERNS; i++) begin
        flat_input = i;

            // Assign flattened bits to 2D input array
        for (j = 0; j < intf.DEPTH; j++) begin
          intf.in[j] = flat_input[j];
            end

            #1; // Wait for signals to propagate
        $display("in = %p | out=%b",intf.in, {intf.carry, intf.sum});
        end
        $finish;
    end

endmodule
