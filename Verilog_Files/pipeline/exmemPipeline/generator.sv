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
  $display("Overall Coverage of expipe Module = %1f", tr.cg.get_coverage());
    $display("coverage of covergroup = %2f", tr.cg.get_coverage());
    $display("coverage of coverpoint EXaluOut = %1f", tr.cg.EXa.get_coverage());
    $display("coverage of coverpoint EXwritedata = %1f", tr.cg.EXw.get_coverage());
    $display("coverage of coverpoint EXwriteReg = %1f", tr.cg.EXwR.get_coverage());
    $display("coverage of coverpoint EXregWrite = %1f", tr.cg.EXrW.get_coverage());
    $display("coverage of coverpoint EXmemtoReg = %1f", tr.cg.EXmtR.get_coverage());
    $display("coverage of coverpoint EXmemWrite = %1f", tr.cg.EXmW.get_coverage());

  $display("Overall Coverage of mempipe Module = %1f", tr.cg.get_coverage());
    $display("coverage of covergroup = %2f", tr.cg.get_coverage());
    $display("coverage of coverpoint MEMaluOut = %1f", tr.cg.MEMa.get_coverage());
    $display("coverage of coverpoint MEMwritedata = %1f", tr.cg.MEMw.get_coverage());
    $display("coverage of coverpoint MEMwriteReg = %1f", tr.cg.MEMwR.get_coverage());
    $display("coverage of coverpoint MEMregWrite = %1f", tr.cg.MEMrW.get_coverage());
    $display("coverage of coverpoint MEMmemtoReg = %1f", tr.cg.MEMmtR.get_coverage());
    $display("coverage of coverpoint MEMmemWrite = %1f", tr.cg.MEMmW.get_coverage());
endtask

endclass
