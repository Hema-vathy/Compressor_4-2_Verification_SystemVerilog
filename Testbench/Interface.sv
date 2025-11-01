/////////////////////*****************INTERFACE FILE*****************/////////////////////
interface signal_intf ();
  
  parameter DEPTH = 5;
  parameter TOTAL_PATTERNS = 1<<DEPTH;

    logic in [DEPTH-1:0];
    logic sum;
    logic carry;
  
endinterface
