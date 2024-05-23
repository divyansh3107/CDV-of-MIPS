class scoreboard;
    mailbox scb_mbx;
  bit [31:0]localmem[15:0];
  

    task run();
        forever begin
            Packet tr, ref_tr;
            scb_mbx.get(tr);
            tr.print("Scoreboard");

            ref_tr = new;
            ref_tr.copy(tr);

          if(ref_tr.memWrite) begin
            localmem[ref_tr.address]<=ref_tr.writedata;
            end
          
          if(ref_tr.memWrite==0)begin
            ref_tr.readdata <=localmem[ref_tr.address];
          
			end


          if(ref_tr.readdata != tr.readdata) begin
            $display("[%0t] Scoreboard Error! readdata mismatch ref_tr=0x%0h tr=0x%0h", $time, ref_tr.readdata, tr.readdata);
            end
            
        end
    endtask
endclass
                


                