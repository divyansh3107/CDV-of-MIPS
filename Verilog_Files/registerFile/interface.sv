interface inf();
    logic clk;

  	logic             			  WBregWrite;
  	logic [4:0]                   idRs;
  	logic [4:0]                   idRt;
  	logic [4:0]                   WBwriteReg;
  	logic [31:0]                   WBresult;
  
  	
  	logic [31:0]             	  idregA;
  	logic [31:0]				  idregB;

  	initial clk <=0;
    always #10 clk = ~clk;
  
endinterface