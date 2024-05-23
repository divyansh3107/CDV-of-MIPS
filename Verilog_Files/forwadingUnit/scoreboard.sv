class scoreboard;
    mailbox scb_mbx;
    task run();
        forever begin
            Packet tr, ref_tr;
            scb_mbx.get(tr);
            tr.print("Scoreboard");

            ref_tr = new;
            ref_tr.copy(tr);

            case(ref_tr.ctrl)
                2'b00:
                    begin
                      ref_tr.EXaluOut = (ref_tr.aluSrcA + ref_tr.aluSrcB);
                        ref_tr.ALUzeroOp = 1'b0;
                    end
                2'b01:
                    begin
                      ref_tr.EXaluOut = (ref_tr.aluSrcA - ref_tr.aluSrcB);
                        ref_tr.ALUzeroOp = 1'b0;
                    end
                2'b10:
                    begin
                        if(ref_tr.aluSrcA==ref_tr.aluSrcB)
                            ref_tr.ALUzeroOp = 1;
                        else
                            ref_tr.ALUzeroOp = 0;
                        ref_tr.EXaluOut=32'b0;
                    end
                2'b11:
                    begin
                        if(ref_tr.aluSrcA!=ref_tr.aluSrcB)
                            ref_tr.ALUzeroOp = 1;
                        else
                            ref_tr.ALUzeroOp = 0;
                        ref_tr.EXaluOut=32'b0;
                    end
            endcase

            if(ref_tr.EXaluOut != tr.EXaluOut) begin
                $display("[%0t] Scoreboard Error! EXaluOut mismatch ref_tr=0x%0h tr=0x%0h", $time, ref_tr.EXaluOut, tr.EXaluOut);
            end
            if(ref_tr.ALUzeroOp != tr.ALUzeroOp) begin
                $display("[%0t] Scoreboard Error! ALUzeroOp mismatch ref_tr=0x%0h tr=0x%0h", $time, ref_tr.ALUzeroOp, tr.ALUzeroOp);
            end
        end
    endtask
endclass
                


                