interface inf();
    logic clk;

    logic [31:0]            opcode;
    logic                   hazardflag; 

    logic [31:0]            ifidOpcode;
 

  	initial clk <=0;
    always #10 clk = ~clk;
  
endinterface