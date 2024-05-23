interface inf();
    logic clk;

    logic execute;
    logic [1:0]c;
    logic  memaccess;
    logic  [1:0]d;

  	initial clk <=0;
    always #10 clk = ~clk;
  
endinterface