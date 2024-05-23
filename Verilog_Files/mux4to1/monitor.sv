class monitor;
    virtual inf vif;

    mailbox scb_mbx;

    task run();
        //$display ("T=%0t [Monitor] starting ...", $time);

        forever begin
            Packet tr;
            tr = new;
          @(*);
            //#5;
            //tr.clk <= vif.clk;
            tr.ctrl <= vif.ctrl;
            tr.in1 <= vif.in1;
            tr.in2 <= vif.in2;
          	tr.in3 <= vif.in3;
          	tr.in4 <= vif.in4;
            tr.out <= vif.out;
            //tr.print("Monitor");
            scb_mbx.put(tr);
        end
    endtask
endclass