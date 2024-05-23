interface inf();
    logic clk;

    logic                   MEMregWrite,
    logic                   WBregWrite;
    logic [4:0]             exRs;
    logic [4:0]             exRt;
    logic [4:0]             MEMwriteReg; 
    logic [4:0]             WBwriteReg;

    logic [1:0]             forwardAE;
    logic [1:0]             forwardBE;

  	initial clk <=0;
    always #10 clk = ~clk;
  
endinterface