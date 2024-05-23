class driver;
    virtual inf vif;
    event drv_done;
    mailbox drv_mbx;

    task run();
        $display ("T=%0t [Driver] starting ...", $time);

        forever begin
            transaction tr;
            $display ("T=%0t [Driver] waiting for item ...", $time);
            drv_mbx.get(tr);
          @(*)
            tr.print("Driver");
            vif.branch <= tr.branch;
           // vif.clk <= tr.clk;
            vif.update <= tr.update;
            vif.prediction <= tr.prediction;
            ->drv_done;
        end
    endtask
endclass