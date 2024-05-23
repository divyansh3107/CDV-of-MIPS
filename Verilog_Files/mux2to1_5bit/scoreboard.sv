class scoreboard;
    mailbox scb_mbx;
    //bit [31:0]localreg[11:0];
  

    task run();
        forever begin
            Packet tr, ref_tr;
            scb_mbx.get(tr);
            tr.print("Scoreboard");

            ref_tr = new;
            ref_tr.copy(tr);

          if(ref_tr.ctrl==1'b0) begin
               ref_tr.out=ref_tr.in1;
            end
          
          if(ref_tr.ctrl==1'b1) begin
               ref_tr.out=ref_tr.in2;
            end


          if(ref_tr.out != tr.out) begin
            $display("[%0t] Scoreboard Error! out mismatch ref_tr=0x%0h tr=0x%0h", $time, ref_tr.out, tr.out);
            end
            
        end
    endtask
endclass
                


                