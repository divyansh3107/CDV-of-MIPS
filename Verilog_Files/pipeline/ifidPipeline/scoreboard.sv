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

          if(ref_tr.hazardflag) begin
               ref_tr.ifidOpcode<=32'b0;
            end
          
          if(ref_tr.hazardflag==0)begin
            ref_tr.ifidOpcode<=ref_tr.opcode;
			end


          if(ref_tr.ifidOpcode != tr.ifidOpcode) begin
            $display("[%0t] Scoreboard Error! ifidOpcode mismatch ref_tr=0x%0h tr=0x%0h", $time, ref_tr.ifidOpcode, tr.ifidOpcode);
            end
            
        end
    endtask
endclass
                


                