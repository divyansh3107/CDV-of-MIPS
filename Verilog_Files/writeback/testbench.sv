// Code your testbench here
// or browse Examples
`include "test.sv"

module tb;
    inf eif();
    
    logic                       clk;

    logic              		      WBmemtoReg;
    logic [31:0]               	WBreaddata;
    logic [31:0]                WBaluOut;

    logic [31:0]					      WBresult;

  writeback   dut(WBresult,WBmemtoReg,WBreaddata,WBaluOut);
    initial begin
    test t0;
    t0 = new();
    t0.e0.vif = eif;
    t0.run();

      $dumpfile("writeback.vcd");
    $dumpvars(0, tb);

    #20 $finish;
  end
endmodule