class monitor;
    virtual inf vif;

    mailbox scb_mbx;

    task run();
        $display ("T=%0t [Monitor] starting ...", $time);

        forever begin
            registerFilePacket tr;
            tr = new;
            @(posedge vif.clk);
            //#5;
          	tr.WBregWrite <= vif.WBregWrite;
            tr.clk <= vif.clk;
            tr.idRs <= vif.idRs;
            tr.idRt <= vif.idRt;
          	tr.WBwriteReg <= vif.WBwriteReg;
          	tr.WBresult <= vif.WBresult;
          	tr.idregA <= vif.idregA;
            tr.idregB <= vif.idregB;
            tr.print("Monitor");
            scb_mbx.put(tr);
        end
    endtask
endclass