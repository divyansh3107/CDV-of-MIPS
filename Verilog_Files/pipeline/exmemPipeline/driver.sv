class driver;
    virtual inf vif;
    event drv_done;
    mailbox drv_mbx;

    task run();
        $display ("T=%0t [Driver] starting ...", $time);

        forever begin
            Packet tr;
            $display ("T=%0t [Driver] waiting for item ...", $time);
            drv_mbx.get(tr);
            @(posedge vif.clk)
            vif.EXaluOut <= tr.EXaluOut;
            vif.EXwritedata <= tr.EXwritedata;
            vif.EXwriteReg <= tr.EXwriteReg;
            vif.EXregWrite <= tr.EXregWrite;
            vif.EXmemtoReg <= tr.EXmemtoReg;
            vif.EXmemWrite <= tr.EXmemWrite;
            vif.MEMaluOut <= tr.MEMaluOut;
            vif.MEMwritedata <= tr.MEMwritedata;
            vif.MEMwriteReg <= tr.MEMwriteReg;
            vif.MEMregWrite <= tr.MEMregWrite;
            vif.MEMmemtoReg <= tr.MEMmemtoReg;
            vif.MEMmemWrite <= tr.MEMmemWrite; ->drv_done;
        end
    endtask
endclass