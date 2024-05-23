class Packet;
    
    bit clk;
        
    function void print(string tag="");
    $display("T=%0t %s instcode=0x%0h PCselectD=0x%0h PCSelectE=0x%0h regWrite=0x%0h regDst=0x%0h memWrite=0x%0h aluSrc=0x%0h memtoReg=0x%0h branchD=0x%0h ALUcontrolD=0x%0h",$time,tag,instcode,PCSelectD,PCSelectE, regWrite, regDst, memWrite, aluSrc, memtoReg, branchD,ALUcontrolD);
    endfunction

  covergroup cg;
        clk: coverpoint clk;
    endgroup

    function void copy(Packet tr);
        this.clk = tr.clk;
    endfunction

    function new();
        cg = new;
    endfunction
endclass