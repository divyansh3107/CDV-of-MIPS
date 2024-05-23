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
  $display("Overall Coverage of ControlUnit Module = %1f", $get_coverage());
    $display("coverage of covergroup = %2f", tr.cg.get_coverage());
    $display("coverage of coverpoint aluSrcA = %1f", tr.cg.aluA.get_coverage());
    $display("coverage of coverpoint aluSrcB = %1f", tr.cg.aluB.get_coverage());
    $display("coverage of coverpoint ctrl = %1f", tr.cg.ctr.get_coverage());
    $display("coverage of coverpoint EXaluOut = %1f", tr.cg.EX.get_coverage());
    $display("coverage of coverpoint ALUzeroOp = %1f", tr.cg.ALUz.get_coverage());
endtask

endclass
