`include "test.sv"

module tb;
    inf eif();
    
    //logic clk;

    logic [31:0]            instcode;
    logic                   PCSelectD;
    logic                   PCSelectE;

    logic                   regWrite;
    logic                   regDst;
    logic                   memWrite;
    logic                   aluSrc;     //output
    logic                   memtoReg;
    logic                   branchD;
    logic [1:0]             ALUcontrolD; 

  controlUnit   dut(instcode,PCSelectD,PCSelectE,regWrite,regDst,memWrite,aluSrc,memtoReg,branchD,ALUcontrolD);
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