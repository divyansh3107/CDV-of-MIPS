`include "test.sv"

module tb;
    inf eif();
    
    logic clk;

    logic                   MEMregWrite,
    logic                   WBregWrite;
    logic [4:0]             exRs;
    logic [4:0]             exRt;
    logic [4:0]             MEMwriteReg; 
    logic [4:0]             WBwriteReg;

    logic [1:0]             forwardAE;
    logic [1:0]             forwardBE;

    execute dut(MEMregWrite, WBregWrite, exRs, exRt, MEMwriteReg, WBwriteReg, forwardAE, forwardBE);
    initial begin
    test t0;
    t0 = new();
    t0.e0.vif = eif;
    t0.run();

    $dumpfile("forwardingUnit.vcd");
    $dumpvars(0, tb);

    #20 $finish;
  end
