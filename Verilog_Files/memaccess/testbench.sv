`include "test.sv"

module tb;
    inf eif();
    
    logic clk;

    logic execute;
    logic [1:0]c;
    logic  memaccess;
    logic  [1:0]d;

    memaccess dut(memaccess,execute,clk,d,c);
    initial begin
    test t0;
    t0 = new();
    t0.e0.vif = eif;
    t0.run();

    $dumpfile("memaccess.vcd");
    $dumpvars(0, tb);

    #20 $finish;
    end
endmodule