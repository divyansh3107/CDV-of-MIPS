class driver;
    virtual inf vif;
    event drv_done;
    mailbox drv_mbx;

    task run();
        $display ("T=%0t [Driver] starting ...", $time);

        forever begin
            registerFilePacket tr;
            $display ("T=%0t [Driver] waiting for item ...", $time);
            drv_mbx.get(tr);
            @(posedge vif.clk)
            tr.print("Driver");
            vif.WBregWrite <= tr.WBregWrite;
            vif.clk <= tr.clk;
            vif.idRs <= tr.idRs;
            vif.idRt <= tr.idRt;
          	vif.WBwriteReg <= tr.WBwriteReg;
          	vif.WBresult <= tr.WBresult;
            vif.idregA <= tr.idregA;
          	vif.idregB <= tr.idregB;
            ->drv_done;
        end
    endtask
endclass