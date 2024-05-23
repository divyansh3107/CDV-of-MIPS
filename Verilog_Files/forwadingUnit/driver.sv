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
            tr.print("Driver");
            vif.clk <= tr.clk;
            vif.MEMregWrite <= tr.MEMregWrite;
            vif.WBregWrite <= tr.WBregWrite;
            vif.exRs <= tr.exRs;
            vif.exRt <= tr.exRt;
            vif.MEMwriteReg <= tr.MEMwriteReg;
            vif.WBwriteReg <= tr.WBwriteReg;
            vif.forwardAE <= tr.forwardAE;
            vif.forwardBE <= tr.forwardBE; ->drv_done;
        end
    endtask
endclass