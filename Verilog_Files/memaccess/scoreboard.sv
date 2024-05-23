class scoreboard;
    mailbox scb_mbx;
    task run();
        forever begin
            Packet tr, ref_tr;
            scb_mbx.get(tr);
            tr.print("Scoreboard");

            ref_tr = new;
            ref_tr.copy(tr);

            //always@(posedge ref_tr.clk)
                //begin
                  if(ref_tr.execute && ref_tr.clk)
                        begin
                            ref_tr.memaccess=1;
                            ref_tr.d=ref_tr.c;
                        end
                //end

            if(ref_tr.c != tr.c) begin
                $display("[%0t] Scoreboard Error! c mismatch ref_tr=0x%0h tr=0x%0h", $time, ref_tr.c, tr.c);
            end
            if(ref_tr.d != tr.d) begin
                $display("[%0t] Scoreboard Error! d mismatch ref_tr=0x%0h tr=0x%0h", $time, ref_tr.d, tr.d);
            end
            if(ref_tr.execute != tr.execute) begin
                $display("[%0t] Scoreboard Error! execute mismatch ref_tr=0x%0h tr=0x%0h", $time, ref_tr.execute, tr.execute);
            end
            if(ref_tr.memaccess != tr.memaccess) begin
                $display("[%0t] Scoreboard Error! memaccess mismatch ref_tr=0x%0h tr=0x%0h", $time, ref_tr.memaccess, tr.memaccess);
            end
        end
    endtask
endclass
                


                
