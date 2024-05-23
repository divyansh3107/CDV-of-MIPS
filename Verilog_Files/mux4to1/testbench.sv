// Code your testbench here
// or browse Examples
`include "test.sv"

module tb;
    inf eif();
    
    logic clk;

  logic [1:0]             		ctrl;
  logic [31:0]               	in1;
  logic [31:0]                  in2;
  logic [31:0]					in3;
  logic [31:0]					in4;

  logic [31:0]                   out; 

  mux4to1   dut(out,ctrl,in1,in2,in3,in4);
    initial begin
    test t0;
    t0 = new();
    t0.e0.vif = eif;
    t0.run();

      $dumpfile("mux2to1.vcd");
    $dumpvars(0, tb);

    #20 $finish;
  end
endmodule