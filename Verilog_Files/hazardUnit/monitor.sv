class monitor;
    virtual inf vif;

    mailbox scb_mbx;

    task run();
        //$display ("T=%0t [Monitor] starting ...", $time);

        forever begin
            hazardUnitPacket tr;
            tr = new;
            @(*)
            #5;
            //tr.clk <= vif.clk;
            tr.idRs <= vif.idRs;
            tr.idRt <= vif.idRt;
            tr.exRt <= vif.exRt;
            tr.EXmemtoReg <= vif.EXmemtoReg;
          	tr.ifidOpcode <= vif.ifidOpcode;
          	tr.pcwrite <= vif.pcwrite;
          	tr.hazardflag <= vif.hazardflag;
            //tr.print("Monitor");
            scb_mbx.put(tr);
        end
    endtask
endclass