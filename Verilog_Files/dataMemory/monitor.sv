class monitor;
    virtual inf vif;

    mailbox scb_mbx;

    task run();
        $display ("T=%0t [Monitor] starting ...", $time);

        forever begin
            Packet tr;
            tr = new;
          @(*);
            //#5;
            //tr.clk <= vif.clk;

            tr.memWrite <=  vif.memWrite;
           tr.address  <= vif.address;
          tr.writedata <=   vif.writedata;
          tr.readdata  <=	vif.readdata;
            tr.print("Monitor");
            scb_mbx.put(tr);
        end
    endtask
endclass