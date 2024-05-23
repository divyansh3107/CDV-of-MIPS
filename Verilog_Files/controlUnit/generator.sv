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
    $display("coverage of coverpoint regWrite = %1f", tr.cg.rW.get_coverage());
    $display("coverage of coverpoint memWrite = %1f", tr.cg.mW.get_coverage());
    $display("coverage of coverpoint aluSrc = %1f", tr.cg.aS.get_coverage());
    $display("coverage of coverpoint branchD = %1f", tr.cg.bD.get_coverage());
  $display("coverage of coverpoint ALUcontrolD = %1f", tr.cg.AcD.get_coverage());
    $display("coverage of coverpoint PCSelectE = %1f", tr.cg.PCE.get_coverage());
  $display("coverage of coverpoint PCselectD = %1f", tr.cg.PCD.get_coverage());
    $display("coverage of coverpoint instcode = %1f", tr.cg.inst.get_coverage());
endtask

endclass
