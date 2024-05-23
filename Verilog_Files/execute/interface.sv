interface inf();
    //logic clk;

    logic [31:0]            aluSrcA;
    logic [31:0]            aluSrcB;
    logic [1:0]             ctrl; 

    logic [31:0]            EXaluOut;
    logic                   ALUzeroOp;   

//   	initial clk <=0;
//     always #10 clk = ~clk;
  
endinterface