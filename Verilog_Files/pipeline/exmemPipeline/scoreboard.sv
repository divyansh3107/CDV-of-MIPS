class scoreboard;
    mailbox scb_mbx;
    task run();
        forever begin
            Packet tr, ref_tr;
            scb_mbx.get(tr);
            tr.print("Scoreboard");

            ref_tr = new;
            ref_tr.copy(tr);

          if(ref_tr.clk)
            begin
                ref_tr.MEMwriteReg=ref_tr.EXwriteReg;
                ref_tr.MEMaluOut=ref_tr.EXaluOut;
                ref_tr.MEMwritedata=ref_tr.EXwritedata;

                ref_tr.MEMregWrite=ref_tr.EXregWrite;
                ref_tr.MEMmemtoReg=ref_tr.EXmemtoReg;
                ref_tr.MEMmemWrite=ref_tr.EXmemWrite;
            end

            if(ref_tr.EXaluOut != tr.EXaluOut) begin
                $display("[%0t] Scoreboard Error! EXaluOut mismatch ref_tr=0x%0h tr=0x%0h", $time, ref_tr.EXaluOut, tr.EXaluOut);
            end
            if(ref_tr.EXwriteReg != tr.EXwriteReg) begin
                $display("[%0t] Scoreboard Error! EXwriteReg mismatch ref_tr=0x%0h tr=0x%0h", $time, ref_tr.EXwriteReg, tr.EXwriteReg);
            end
            if(ref_tr.EXwritedata != tr.EXwritedata) begin
                $display("[%0t] Scoreboard Error! EXwritedata mismatch ref_tr=0x%0h tr=0x%0h", $time, ref_tr.EXwritedata, tr.EXwritedata);
            end
            if(ref_tr.EXregWrite != tr.EXregWrite) begin
                $display("[%0t] Scoreboard Error! EXregWrite mismatch ref_tr=0x%0h tr=0x%0h", $time, ref_tr.EXregWrite, tr.EXregWrite);
            end
            if(ref_tr.EXmemtoReg != tr.EXmemtoReg) begin
                $display("[%0t] Scoreboard Error! EXmemtoReg mismatch ref_tr=0x%0h tr=0x%0h", $time, ref_tr.EXmemtoReg, tr.EXmemtoReg);
            end
            if(ref_tr.EXmemWrite != tr.EXmemWrite) begin
                $display("[%0t] Scoreboard Error! EXmemWrite mismatch ref_tr=0x%0h tr=0x%0h", $time, ref_tr.EXmemWrite, tr.EXmemWrite);
            end

            if(ref_tr.MEMaluOut != tr.MEMaluOut) begin
                $display("[%0t] Scoreboard Error! MEMaluOut mismatch ref_tr=0x%0h tr=0x%0h", $time, ref_tr.MEMaluOut, tr.MEMaluOut);
            end
            if(ref_tr.MEMwriteReg != tr.MEMwriteReg) begin
                $display("[%0t] Scoreboard Error! MEMwriteReg mismatch ref_tr=0x%0h tr=0x%0h", $time, ref_tr.MEMwriteReg, tr.MEMwriteReg);
            end
            if(ref_tr.MEMwritedata != tr.MEMwritedata) begin
                $display("[%0t] Scoreboard Error! MEMwritedata mismatch ref_tr=0x%0h tr=0x%0h", $time, ref_tr.MEMwritedata, tr.MEMwritedata);
            end
            if(ref_tr.MEMregWrite != tr.MEMregWrite) begin
                $display("[%0t] Scoreboard Error! MEMregWrite mismatch ref_tr=0x%0h tr=0x%0h", $time, ref_tr.MEMregWrite, tr.MEMregWrite);
            end
            if(ref_tr.MEMmemtoReg != tr.MEMmemtoReg) begin
                $display("[%0t] Scoreboard Error! MEMmemtoReg mismatch ref_tr=0x%0h tr=0x%0h", $time, ref_tr.MEMmemtoReg, tr.MEMmemtoReg);
            end
            if(ref_tr.MEMmemWrite != tr.MEMmemWrite) begin
                $display("[%0t] Scoreboard Error! MEMmemWrite mismatch ref_tr=0x%0h tr=0x%0h", $time, ref_tr.MEMmemWrite, tr.MEMmemWrite);
            end
        end
    endtask
endclass
                


                