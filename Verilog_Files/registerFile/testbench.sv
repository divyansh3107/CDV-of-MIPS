// Code your testbench here
// or browse Examples
// Code your testbench here
// or browse Examples
`include "test.sv"

module tb;
    inf eif();
    
    logic clk;

  	logic             			  WBregWrite;
  	logic [4:0]                   idRs;
  	logic [4:0]                   idRt;
  	logic [4:0]                   WBwriteReg;
  	logic [31:0]                   WBresult;
  
  	
  	logic [31:0]             	  idregA;
  	logic [31:0]				  idregB;

  registerFile   dut(WBregWrite,clk,idRs,idRt,idregA,idregB,WBwriteReg,WBresult);
    initial begin
    test t0;
    t0 = new();
    t0.e0.vif = eif;
    t0.run();

    $dumpfile("registerFile.vcd");
    $dumpvars(0, tb);

    #20 $finish;
  end
endmodule