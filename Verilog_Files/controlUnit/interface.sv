interface inf();
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

//   	initial clk <=0;
//     always #10 clk = ~clk;
  
endinterface