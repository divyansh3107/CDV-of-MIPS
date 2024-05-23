class scoreboard;
    mailbox scb_mbx;
    bit [31:0]localreg[11:0];
  

    task run();
        forever begin
            registerFilePacket tr, ref_tr;
            scb_mbx.get(tr);
            tr.print("Scoreboard");

            ref_tr = new;
            ref_tr.copy(tr);

          if((ref_tr.WBregWrite)&& (ref_tr.clk)) begin
            localreg[ref_tr.WBwriteReg]<=ref_tr.WBresult;
            end
          
          if(ref_tr.clk==0)begin
            ref_tr.idregA <=localreg[ref_tr.idRs];
            ref_tr.idregB <=localreg[ref_tr.idRt];
			end


          if(ref_tr.idregA != tr.idregA) begin
            $display("[%0t] Scoreboard Error! idregA mismatch ref_tr=0x%0h tr=0x%0h", $time, ref_tr.idregA, tr.idregA);
            end
          if(ref_tr.idregB != tr.idregB) begin
            $display("[%0t] Scoreboard Error! idregB mismatch ref_tr=0x%0h tr=0x%0h", $time, ref_tr.idregB, tr.idregB);
            end
            
        end
    endtask
endclass
                


                