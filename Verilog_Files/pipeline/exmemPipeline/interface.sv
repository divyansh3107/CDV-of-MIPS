interface inf();
    logic clk;

    logic [31:0]  EXaluOut,EXwritedata;
    logic [4:0]   EXwriteReg;
    logic         EXregWrite,EXmemtoReg,EXmemWrite;

    logic [4:0]   MEMwriteReg;
    logic [31:0]  MEMaluOut,MEMwritedata;
    logic         MEMregWrite,MEMmemtoReg,MEMmemWrite; 

  	initial clk <=0;
    always #10 clk = ~clk;
  
endinterface