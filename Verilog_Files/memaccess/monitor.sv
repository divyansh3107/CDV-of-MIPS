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
            tr.c <= vif.c;
            tr.d <= vif.d;
            tr.execute <= vif.execute;
            tr.memaccess <= vif.memaccess;
            tr.print("Monitor");
            scb_mbx.put(tr);
        end
    endtask
endclass