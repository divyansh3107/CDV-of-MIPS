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
            vif.aluSrcA <= tr.aluSrcA;
            vif.aluSrcB <= tr.aluSrcB;
            vif.ctrl <= tr.ctrl;
            vif.EXaluOut <= tr.EXaluOut;
            vif.ALUzeroOp <= tr.ALUzeroOp; ->drv_done;
        end
    endtask
endclass