interface inf();
    //logic clk;

  logic [4:0]            			 idRs;
  logic [4:0]                   idRt;
  logic [4:0]                   exRt;
  logic 						EXmemtoReg;
  logic [31:0]					ifidOpcode;

  	logic              	  pcwrite;
  	logic				  hazardflag;

//   	initial clk <=0;
//     always #10 clk = ~clk;
  
endinterface