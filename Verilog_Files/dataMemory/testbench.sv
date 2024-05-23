// Code your testbench here
// or browse Examples
// Code your testbench here
// or browse Examples
`include "test.sv"

module tb;
    inf eif();
    
    //logic clk;

  logic [31:0]            address, writedata;
    logic                   memWrite; 

  logic [31:0]            readdata;



    dataMemory dut(readdata,memWrite,address,writedata);
    initial begin

    test t0;
    t0 = new();
    t0.e0.vif = eif;
    t0.run();

      $dumpfile("dataMemory.vcd");
    $dumpvars(0, tb);
    end
endmodule