`include "test.sv"

module tb;
    inf eif();
    
    logic clk;

    logic [31:0]            opcode;
    logic                   hazardflag; 

    logic [31:0]            ifidOpcode;



    ifidPipeline dut(ifidOpcode,hazardflag,opcode,clk);
    initial begin
    test t0;
    t0 = new();
    t0.e0.vif = eif;
    t0.run();

    $dumpfile("ifidPipeline.vcd");
    $dumpvars(0, tb);

    #200 $finish;
  end
endmodule
