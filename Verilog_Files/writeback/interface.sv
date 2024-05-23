interface inf();
    logic 							clk;

  	logic             			  	WBmemtoReg;
  	logic [31:0]                   	WBreaddata;
  	logic [31:0]                   	WBaluOut;

  	logic [31:0]             	  	WBresult;     

  	initial clk <=0;
    always #10 clk = ~clk;
  
endinterface