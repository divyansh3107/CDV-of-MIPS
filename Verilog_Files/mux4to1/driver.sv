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
          @(*)
            //tr.print("Driver");
            //vif.clk <= tr.clk;
            vif.ctrl <= tr.ctrl;
            vif.in1 <= tr.in1;
            vif.in2 <= tr.in2;
          	vif.in3 <= tr.in3;
          	vif.in4 <= tr.in4;
            vif.out <= tr.out;
            ->drv_done;
        end
    endtask
endclass