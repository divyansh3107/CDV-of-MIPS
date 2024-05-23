class monitor;
    virtual inf vif;

    mailbox scb_mbx;

    task run();
        $display ("T=%0t [Monitor] starting ...", $time);

        forever begin
            Packet tr;
            tr = new;
            @(posedge vif.clk);
            #5;
            tr.clk <= vif.clk;
            tr.EXaluOut <= vif.EXaluOut;
            tr.EXwritedata <= vif.EXwritedata;
            tr.EXwriteReg <= vif.EXwriteReg;
            tr.EXregWrite <= vif.EXregWrite;
            tr.EXmemtoReg <= vif.EXmemtoReg;
            tr.EXmemWrite <= vif.EXmemWrite;
            tr.MEMaluOut <= vif.MEMaluOut;
            tr.MEMwritedata <= vif.MEMwritedata;
            tr.MEMwriteReg <= vif.MEMwriteReg;
            tr.MEMregWrite <= vif.MEMregWrite;
            tr.MEMmemtoReg <= vif.MEMmemtoReg;
            tr.MEMmemWrite <= vif.MEMmemWrite;
            tr.print("Monitor");
            scb_mbx.put(tr);
        end
    endtask
endclass