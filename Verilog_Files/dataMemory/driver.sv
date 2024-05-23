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
          @(*)
            tr.print("Driver");
            //vif.clk <= tr.clk;
            vif.memWrite <= tr.memWrite;
            vif.address <= tr.address;
            vif.writedata <= tr.writedata;
          	vif.readdata <= tr.readdata;->drv_done;
        end
    endtask
endclass