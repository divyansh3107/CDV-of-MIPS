class monitor;
    virtual inf vif;

    mailbox scb_mbx;

    task run();
        //$display ("T=%0t [Monitor] starting ...", $time);

        forever begin
            Packet tr;
            tr = new;
            @(posedge vif.clk);
            #5;
            tr.clk <= vif.clk;
            tr.ctrl <= vif.ctrl;
            tr.in1 <= vif.in1;
            tr.in2 <= vif.in2;
            tr.out <= vif.out;
            //tr.print("Monitor");
            scb_mbx.put(tr);
        end
    endtask
endclass