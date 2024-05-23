interface inf();
    logic clk;

  	logic             			  ctrl;
  	logic [31:0]                   in1;
  	logic [31:0]                   in2;

  	logic [31:0]             	  out;     

  	initial clk <=0;
    always #10 clk = ~clk;
  
endinterface