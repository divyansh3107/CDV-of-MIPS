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
  $display("Overall Coverage of dataMemory Module = %1f", $get_coverage());
    $display("coverage of covergroup = %2f", tr.cg.get_coverage());
  $display("coverage of coverpoint memWrite = %1f", tr.cg.memWrite.get_coverage());
  $display("coverage of coverpoint address = %1f", tr.cg.address.get_coverage());
  $display("coverage of coverpoint writedata = %1f", tr.cg.writedata.get_coverage());
  $display("coverage of coverpoint readdata = %1f", tr.cg.readdata.get_coverage());

endtask

endclass
