`include "test.sv"

module tb;
    inf eif();
    
    logic clk;

    

  processor  dut(clk);
    initial begin
    test t0;
    t0 = new();
    t0.e0.vif = eif;
    t0.run();

    $dumpfile("processor.vcd");
    $dumpvars(0, tb);

    #20 $finish;
  end
endmodule