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
        tr.randomize();
      $display ("T=%0t [Generator] Loop:%0d/%0d create next item", $time, i+1, num);
        tr.cg.sample();
      drv_mbx.put(tr);
        $display ("T=%0t [Generator] Wait for driver to be done", $time);
        @(drv_done);
    end
    ->complete;
  endtask

task displayCov();
    wait(complete.triggered);
  $display("Overall Coverage of memaccess Module = %1f", $get_coverage());
    $display("coverage of covergroup = %2f", tr.cg.get_coverage());
    $display("coverage of coverpoint c = %1f", tr.cg.C.get_coverage());
    $display("coverage of coverpoint execute = %1f", tr.cg.exe.get_coverage());
  $display("coverage of coverpoint d = %1f", tr.cg.D.get_coverage());
    $display("coverage of coverpoint memaccess = %1f", tr.cg.mema.get_coverage());
endtask

endclass
