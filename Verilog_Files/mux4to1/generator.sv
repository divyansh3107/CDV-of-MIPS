`include "transaction.sv"

class generator;
  mailbox drv_mbx;
  event drv_done;
  event complete;
  rand Packet tr;
  int num=15;

  task run();
    for(int i =0;i<num;i++)begin
        tr = new;
        tr.randomize;
        //$display ("T=%0t [Generator] Loop:%0d/%0d create next item", $time, i+1, loop);
        tr.cg.sample();
        drv_mbx.put(tr);
        //$display ("T=%0t [Generator] Wait for driver to be done", $time);
        @(drv_done);
    end
    ->complete;
  endtask

task displayCov();
    wait(complete.triggered);
  $display("Overall Coverage of mux4to1 Module = %1f", $get_coverage());
    $display("coverage of covergroup = %2f", tr.cg.get_coverage());
  $display("coverage of coverpoint ctrl = %1f", tr.cg.ctrl.get_coverage());
  $display("coverage of coverpoint in4 = %1f", tr.cg.in1.get_coverage());
  $display("coverage of coverpoint in4 = %1f", tr.cg.in2.get_coverage());
  $display("coverage of coverpoint in4 = %1f", tr.cg.in3.get_coverage());
  $display("coverage of coverpoint in4 = %1f", tr.cg.in4.get_coverage());
  $display("coverage of coverpoint out = %1f", tr.cg.out.get_coverage());
endtask

endclass
