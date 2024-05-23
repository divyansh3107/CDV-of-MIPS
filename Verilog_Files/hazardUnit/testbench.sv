// Code your testbench here
// or browse Examples
`include "test.sv"

module tb;
    inf eif();
    
    //logic clk;

  logic [4:0]            			 idRs;
  logic [4:0]                   idRt;
  logic [4:0]                   exRt;
  logic 						EXmemtoReg;
  logic [31:0]					ifidOpcode;

  	logic              	  pcwrite;
  	logic				  hazardflag;

  hazardUnit dut (pcwrite,hazardflag,ifidOpcode,idRs,idRt,exRt,EXmemtoReg);
    initial begin
    test t0;
    t0 = new();
    t0.e0.vif = eif;
    t0.run();

    $dumpfile("ControlUnit.vcd");
    $dumpvars(0, tb);

    #20 $finish;
  end
endmodule