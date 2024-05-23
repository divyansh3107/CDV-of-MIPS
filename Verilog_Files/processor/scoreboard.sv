class scoreboard;
    mailbox scb_mbx;
    task run();
        forever begin
            Packet tr, ref_tr;
            scb_mbx.get(tr);
            //tr.print("Scoreboard");

            ref_tr = new;
            ref_tr.copy(tr);
            initial begin
		    // Initialize Inputs
		    clk = 0;
		    forever #20 clk=~clk;
	        end

          if(ref_tr.clk!=clk) begin
           $display("Scoreboard Error!");
            end
        end
    endtask
endclass
                


                