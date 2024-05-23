class Packet;
    rand bit[31:0] instcode;
    rand bit PCSelectD, PCSelectE;
    bit regWrite, regDst, memWrite, aluSrc, memtoReg, branchD;
    bit [1:0] ALUcontrolD;
    //bit clk;
        
    function void print(string tag="");
    $display("T=%0t %s instcode=0x%0h PCselectD=0x%0h PCSelectE=0x%0h regWrite=0x%0h regDst=0x%0h memWrite=0x%0h aluSrc=0x%0h memtoReg=0x%0h branchD=0x%0h ALUcontrolD=0x%0h",$time,tag,instcode,PCSelectD,PCSelectE, regWrite, regDst, memWrite, aluSrc, memtoReg, branchD,ALUcontrolD);
    endfunction

  covergroup cg;
        rW: coverpoint regWrite;
        rD: coverpoint regDst;
        mW: coverpoint memWrite;
        aS: coverpoint aluSrc;
        mtR: coverpoint memtoReg;
        bD: coverpoint branchD;
        AcD: coverpoint ALUcontrolD{
            bins v1 = {[0:2], [2:3]};
        }
        PCD: coverpoint PCSelectD;
        PCE: coverpoint PCSelectE;
        inst: coverpoint instcode{
          bins v2 = {[0:65536], [65536:16777216], [16777216:1073741824], [1073741824:32'd4294967295]};
        }
    endgroup

    function void copy(Packet tr);
        //this.clk = tr.clk;
        this.regWrite = tr.regWrite;
        this.regDst = tr.regDst;
        this.memWrite = tr.memWrite;
        this.aluSrc = tr.aluSrc;
        this.memtoReg = tr.memtoReg;
        this.branchD = tr.branchD;
        this.ALUcontrolD = tr.ALUcontrolD;
        this.PCSelectE = tr.PCSelectE;
        this.PCSelectD = tr.PCSelectD;
        this.instcode = tr.instcode;
    endfunction

    function new();
        cg = new;
    endfunction
endclass