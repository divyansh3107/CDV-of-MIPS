class driver;
    virtual inf vif;
    event drv_done;
    mailbox drv_mbx;

    task run();
        //$display ("T=%0t [Driver] starting ...", $time);

        forever begin
            Packet tr;
            //$display ("T=%0t [Driver] waiting for item ...", $time);
            drv_mbx.get(tr);
            @(posedge vif.clk)
            //tr.print("Driver");
            vif.clk <= tr.clk;
            vif.WBmemtoReg <= tr.WBmemtoReg;
            vif.WBreaddata <= tr.WBreaddata;
            vif.WBaluOut <= tr.WBaluOut;
            vif.WBresult <= tr.WBresult;
            ->drv_done;
        end
    endtask
endclass