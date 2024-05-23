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
            tr.MEMregWrite <= vif.MEMregWrite;
            tr.WBregWrite <= vif.WBregWrite;
            tr.exRs <= vif.exRs;
            tr.exRt <= vif.exRt;
            tr.MEMwriteReg <= vif.MEMwriteReg;
            tr.WBwriteReg <= vif.WBwriteReg;
            tr.forwardAE <= vif.forwardAE;
            tr.forwardBE <= vif.forwardBE;
            tr.print("Monitor");
            scb_mbx.put(tr);
        end
    endtask
endclass