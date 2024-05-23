`include "test.sv"

module tb;
    inf eif();
    
    logic clk;

    logic [31:0]  EXaluOut,EXwritedata;
    logic [4:0]   EXwriteReg;
    logic         EXregWrite,EXmemtoReg,EXmemWrite;

    logic [4:0]   MEMwriteReg;
    logic [31:0]  MEMaluOut,MEMwritedata;
    logic         MEMregWrite,MEMmemtoReg,MEMmemWrite;

    exmemPipeline dut(EXaluOut, Exwritedata, EXwriteReg, EXregWrite, EXmemWrite, MEMaluOut, MEMwritedata, MEMwriteReg, MEMregWrite, MEMmemtoReg, MEMmemWrite, clk);
    initial begin
    test t0;
    t0 = new();
    t0.e0.vif = eif;
    t0.run();

    $dumpfile("exmemPipeline.vcd");
    $dumpvars(0, tb);

    #20 $finish;
  end
endmodule