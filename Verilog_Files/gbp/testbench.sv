// Code your testbench here
// or browse Examples
// Code your testbench here
// or browse Examples
`include "test.sv"

module tb;
    inf eif();
    
   // logic clk;

  logic  branch;
  logic update;
  logic prediction;

 globalBranchPredictor dut (branch,update,prediction);
    initial begin
    test t0;
    t0 = new();
    t0.e0.vif = eif;
    t0.run();

    $dumpfile("registerFile.vcd");
    $dumpvars(0, tb);

    #200 $finish;
  end
endmodule