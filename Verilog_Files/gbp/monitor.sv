class monitor;
    virtual inf vif;

    mailbox scb_mbx;

    task run();
        $display ("T=%0t [Monitor] starting ...", $time);

        forever begin
            transaction tr;
            tr = new;
          @(*);
            //#5;

            vif.branch <= tr.branch;
           // vif.clk <= tr.clk;
            vif.update <= tr.update;
            vif.prediction <= tr.prediction;
            tr.print("Monitor");
            scb_mbx.put(tr);
        end
    endtask
endclass