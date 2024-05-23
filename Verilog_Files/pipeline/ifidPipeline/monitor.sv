class monitor;
    virtual inf vif;

    mailbox scb_mbx;

    task run();
        $display ("T=%0t [Monitor] starting ...", $time);

        forever begin
            Packet tr;
            tr = new;
            @(posedge vif.clk);
            //#5;
            tr.clk <= vif.clk;
            tr.opcode <= vif.opcode;
            tr.hazardflag <= vif.hazardflag;
            tr.ifidOpcode <= vif.ifidOpcode;
            tr.print("Monitor");
            scb_mbx.put(tr);
        end
    endtask
endclass