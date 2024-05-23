class monitor;
    virtual inf vif;

    mailbox scb_mbx;

    task run();
        $display ("T=%0t [Monitor] starting ...", $time);

        forever begin
            Packet tr;
            tr = new;
            @(*)
            #5;
            //tr.clk <= vif.clk;
            tr.aluSrcA <= vif.aluSrcA;
            tr.aluSrcB <= vif.aluSrcB;
            tr.ctrl <= vif.ctrl;
            tr.EXaluOut <= vif.EXaluOut;
            tr.ALUzeroOp <= vif.ALUzeroOp;
            tr.print("Monitor");
            scb_mbx.put(tr);
        end
    endtask
endclass