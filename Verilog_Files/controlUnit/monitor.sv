class monitor;
    virtual inf vif;

    mailbox scb_mbx;

    task run();
        //$display ("T=%0t [Monitor] starting ...", $time);

        forever begin
            Packet tr;
            tr = new;
          @(*);
            //#5;
            //tr.clk <= vif.clk;
            tr.instcode <= vif.instcode;
            tr.PCSelectE <= vif.PCSelectE;
            tr.PCSelectD <= vif.PCSelectD;
            tr.regWrite <= vif.regWrite;
            tr.regDst <= vif.regDst;
            tr.memWrite <= vif.memWrite;
            tr.aluSrc <= vif.aluSrc;
            tr.memtoReg <= vif.memtoReg;
            tr.branchD <= vif.branchD;
            tr.ALUcontrolD <= vif.ALUcontrolD;
            //tr.print("Monitor");
            scb_mbx.put(tr);
        end
    endtask
endclass