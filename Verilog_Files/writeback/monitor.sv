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
            tr.WBmemtoReg <= vif.WBmemtoReg;
            tr.WBreaddata <= vif.WBreaddata;
            tr.WBaluOut <= vif.WBaluOut;
            tr.WBresult <= vif.WBresult;
            //tr.print("Monitor");
            scb_mbx.put(tr);
        end
    endtask
endclass