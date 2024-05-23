class driver;
    virtual inf vif;
    event drv_done;
    mailbox drv_mbx;

    task run();
        //$display ("T=%0t [Driver] starting ...", $time);

        forever begin
            hazardUnitPacket tr;
            //$display ("T=%0t [Driver] waiting for item ...", $time);
            drv_mbx.get(tr);
          @(*)
            //tr.print("Driver");
            //vif.clk <= tr.clk;
            vif.idRs <= tr.idRs;
            vif.idRt <= tr.idRt;
            vif.exRt <= tr.exRt;
            vif.EXmemtoReg <= tr.EXmemtoReg;
          	vif.ifidOpcode <= tr.ifidOpcode;
          	vif.pcwrite <= tr.pcwrite;
          	vif.hazardflag <= tr.hazardflag;
            ->drv_done;
        end
    endtask
endclass