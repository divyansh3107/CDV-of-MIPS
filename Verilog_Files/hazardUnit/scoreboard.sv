class scoreboard;
    mailbox scb_mbx;
    task run();
        forever begin
            hazardUnitPacket tr, ref_tr;
            scb_mbx.get(tr);
            //tr.print("Scoreboard");

            ref_tr = new;
            ref_tr.copy(tr);

          if(((ref_tr.idRs == ref_tr.exRt) || (ref_tr.idRt == ref_tr.exRt)) && (ref_tr.EXmemtoReg)) begin
                ref_tr.pcwrite=1'b0;
                ref_tr.hazardflag=1'b1;
            end
            else begin
				ref_tr.pcwrite=1'b1;
                ref_tr.hazardflag=1'b0;
            end

          if(ref_tr.pcwrite != tr.pcwrite) begin
              $display("[%0t] Scoreboard Error! pcwrite mismatch ref_tr=0x%0h tr=0x%0h", $time, ref_tr.pcwrite, tr.pcwrite);
            end
          if(ref_tr.hazardflag != tr.hazardflag) begin
              $display("[%0t] Scoreboard Error! hazardflag mismatch ref_tr=0x%0h tr=0x%0h", $time, ref_tr.hazardflag, tr.hazardflag);
            end
        end
    endtask
endclass
                


                