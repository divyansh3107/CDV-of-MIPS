`include "transaction.sv"

class generator;
  mailbox drv_mbx;
  event drv_done;
  event complete;
  rand hazardUnitPacket tr;
  int num=15;

  task run();
    for(int i =0;i<num;i++)begin
        tr = new;
        tr.randomize();
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
  $display("Overall Coverage of HazardUnit Module = %1f", $get_coverage());
    $display("coverage of covergroup = %2f", tr.cg.get_coverage());
    $display("coverage of coverpoint EXmemtoReg = %1f", tr.cg.EXmr.get_coverage());
    $display("coverage of coverpoint pcwrite = %1f", tr.cg.pcr.get_coverage());
    $display("coverage of coverpoint hazardflag = %1f", tr.cg.hzf.get_coverage());
  $display("coverage of coverpoint idRs = %1f", tr.cg.idRs.get_coverage());
  $display("coverage of coverpoint idRt = %1f", tr.cg.idRt.get_coverage());
  $display("coverage of coverpoint exRt = %1f", tr.cg.exRt.get_coverage());
  $display("coverage of coverpoint ifidOpcode = %1f", tr.cg.ifidOp.get_coverage());

endtask

endclass



