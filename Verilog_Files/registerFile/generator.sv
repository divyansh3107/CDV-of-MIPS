`include "transaction.sv"

class generator;
  mailbox drv_mbx;
  event drv_done;
  event complete;
  rand registerFilePacket tr;
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
    $display("Overall Coverage of ControlUnit Module = %1f", $get_coverage());
    $display("coverage of covergroup = %2f", tr.cg.get_coverage());
    $display("coverage of coverpoint WBregWrite = %1f", tr.cg.WBrw.get_coverage());
    $display("coverage of coverpoint idRs = %1f", tr.cg.idRs.get_coverage());
  $display("coverage of coverpoint idRt = %1f", tr.cg.idRt.get_coverage());
    $display("coverage of coverpoint WBwriteReg = %1f", tr.cg.WBwr.get_coverage());
  $display("coverage of coverpoint WBresult = %1f", tr.cg.WBres.get_coverage());
    $display("coverage of coverpoint idregA = %1f", tr.cg.idrA.get_coverage());
  $display("coverage of coverpoint idregB = %1f", tr.cg.idrB.get_coverage());
endtask

endclass
