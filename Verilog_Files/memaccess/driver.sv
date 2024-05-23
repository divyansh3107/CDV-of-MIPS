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
            vif.c <= tr.c;
            vif.execute <= tr.execute;
            vif.d <= tr.d;
            vif.memaccess <= tr.memaccess;
          ->drv_done;
        end
    endtask
endclass