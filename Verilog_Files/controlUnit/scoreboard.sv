class scoreboard;
    mailbox scb_mbx;
    task run();
        forever begin
            Packet tr, ref_tr;
            scb_mbx.get(tr);
            //tr.print("Scoreboard");

            ref_tr = new;
            ref_tr.copy(tr);

          if((ref_tr.PCSelectD == 1'b1) || (ref_tr.PCSelectE == 1'b1)) begin
                ref_tr.regWrite=1'bx;
                ref_tr.regDst=1'bx;
                ref_tr.memWrite=1'bx;
                ref_tr.aluSrc=1'bx;
                ref_tr.memtoReg=1'bx;
                ref_tr.ALUcontrolD=2'bxx;
                ref_tr.branchD=1'bx;
            end
            else begin
                case(ref_tr.instcode[31:26]) 
                    6'b100011:
                        begin
                            ref_tr.regWrite=1;
                            ref_tr.regDst=0;
                            ref_tr.memWrite=0;
                            ref_tr.aluSrc=1;
                            ref_tr.memtoReg=1;
                            ref_tr.ALUcontrolD=2'b00;
                            ref_tr.branchD=0;
                        end
                    6'b100000:
                        begin
                            ref_tr.regWrite=1;
                            ref_tr.regDst=1;
                            ref_tr.memWrite=1'bx;
                            ref_tr.aluSrc=0;
                            ref_tr.memtoReg=0;
                            ref_tr.branchD=0;
                            case(ref_tr.instcode[5:0])
                                6'b100000:
                                ref_tr.ALUcontrolD=2'b00;
                                6'b100010:
                                ref_tr.ALUcontrolD=2'b01;
                            endcase
                        end
                    6'b001000:
                        begin
                            ref_tr.regWrite=1;
                            ref_tr.regDst=1;
                            ref_tr.memWrite=1'bx;
                            ref_tr.aluSrc=1;
                            ref_tr.memtoReg=0;
                            ref_tr.ALUcontrolD=2'b00;
                            ref_tr.branchD=0;
                        end
                    6'b101011:
                        begin
                            ref_tr.regWrite=0;
                            ref_tr.regDst=0;
                            ref_tr.memWrite=1;
                            ref_tr.aluSrc=1;
                            ref_tr.memtoReg=0;
                            ref_tr.ALUcontrolD=2'b00;
                            ref_tr.branchD=0;
                        end
                    6'b000100:
                        begin
                            ref_tr.regWrite=0;
                            ref_tr.regDst=1'bx;
                            ref_tr.memWrite=0;
                            ref_tr.aluSrc=0;
                            ref_tr.memtoReg=1'bx;
                            ref_tr.ALUcontrolD=2'b10;
                            ref_tr.branchD=1;
                        end
                    6'b000101:
                        begin
                            ref_tr.regWrite=1;
                            ref_tr.regDst=0;
                            ref_tr.memWrite=0;
                            ref_tr.aluSrc=1;
                            ref_tr.memtoReg=1;
                            ref_tr.ALUcontrolD=2'b00;
                            ref_tr.branchD=0;
                        end
                endcase
            end

            if(ref_tr.regWrite != tr.regWrite) begin
                $display("[%0t] Scoreboard Error! regWrite mismatch ref_tr=0x%0h tr=0x%0h", $time, ref_tr.regWrite, tr.regWrite);
            end
            if(ref_tr.regDst != tr.regDst) begin
                $display("[%0t] Scoreboard Error! regDst mismatch ref_tr=0x%0h tr=0x%0h", $time, ref_tr.regDst, tr.regDst);
            end
            if(ref_tr.memWrite != tr.memWrite) begin
                $display("[%0t] Scoreboard Error! memWrite mismatch ref_tr=0x%0h tr=0x%0h", $time, ref_tr.memWrite, tr.memWrite);
            end
            if(ref_tr.aluSrc != tr.aluSrc) begin
                $display("[%0t] Scoreboard Error! aluSrc mismatch ref_tr=0x%0h tr=0x%0h", $time, ref_tr.aluSrc, tr.aluSrc);
            end
            if(ref_tr.memtoReg != tr.memtoReg) begin
                $display("[%0t] Scoreboard Error! memtoReg mismatch ref_tr=0x%0h tr=0x%0h", $time, ref_tr.memtoReg, tr.memtoReg);
            end
            if(ref_tr.ALUcontrolD != tr.ALUcontrolD) begin
                $display("[%0t] Scoreboard Error! ALUcontrolD mismatch ref_tr=0x%0h tr=0x%0h", $time, ref_tr.ALUcontrolD, tr.ALUcontrolD);
            end
            if(ref_tr.branchD != tr.branchD) begin
                $display("[%0t] Scoreboard Error! branchD mismatch ref_tr=0x%0h tr=0x%0h", $time, ref_tr.branchD, tr.branchD);
            end
        end
    endtask
endclass
                


                