// Code your testbench here
// or browse Examples
`include "test.sv"

module tb;
    inf eif();
    
    //logic clk;

    logic [31:0]            aluSrcA;
    logic [31:0]            aluSrcB;
    logic [1:0]             ctrl; 

    logic [31:0]            EXaluOut;
    logic                   ALUzeroOp;

    execute dut(aluSrcA, aluSrcB, ctrl, EXaluOut, ALUzeroOp);
    initial begin
    test t0;
    t0 = new();
    t0.e0.vif = eif;
    t0.run();

    $dumpfile("execute.vcd");
    $dumpvars(0, tb);

    #20 $finish;
  end
endmodule