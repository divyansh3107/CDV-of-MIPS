class scoreboard;
    mailbox scb_mbx;
    //bit [31:0]localreg[11:0];
  

    task run();
        forever begin
            transaction tr, ref_tr;
            scb_mbx.get(tr);
            tr.print("Scoreboard");

            ref_tr = new;
            ref_tr.copy(tr);


            if((ref_tr.update == 1'b0)) begin
              if((ref_tr.branch == 1'b1)) begin
                ref_tr.prediction = 1'b0;
            	end
            end
          
          if((ref_tr.update == 1'b1)) begin
                ref_tr.prediction = !ref_tr.prediction;
            	end
            

            if(ref_tr.prediction != tr.prediction) begin
                $display("[%0t] Scoreboard Error! regWrite mismatch ref_tr=0x%0h tr=0x%0h", $time, ref_tr.prediction, tr.prediction);
            end
          
        end
    endtask
endclass










