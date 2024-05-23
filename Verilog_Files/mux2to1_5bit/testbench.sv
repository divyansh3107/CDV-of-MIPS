// Code your testbench here
// or browse Examples
// Code your testbench here
// or browse Examples
`include "test.sv"

module tb;
    inf eif();
    
    logic clk;

    logic             				ctrl;
  	logic [4:0]               		in1;
  	logic [4:0]                   	in2;

  logic [4:0]                   out; 

  mux2to1_5bit   dut(out,ctrl,in1,in2);
    initial begin
    test t0;
    t0 = new();
    t0.e0.vif = eif;
    t0.run();

      $dumpfile("mux2to1_5bit.vcd");
    $dumpvars(0, tb);

    #20 $finish;
  end
endmodule