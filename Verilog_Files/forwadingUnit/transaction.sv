class Packet;
    bit clk;
    bit MEMregWrite,WBregWrite;
    rand bit[4:0] exRs,exRt,MEMwriteReg,WBwriteReg;
    bit[1:0] forwardAE,forwardBE;
    
    
        
    function void print(string tag="");
    $display("T=%0t %s MEMregWrite=0x%0h WBregWrite=0x%0h exRs=0x%0h exRt=0x%0h MEMwriteReg=0x%0h WBwriteReg=0x%0h forwardAE=0x%0h forwardBE=0x%0h",$time,MEMregWrite,WBregWrite,exRs,exRt,MEMwriteReg,WBwriteReg,forwardAE,
    forwardBE)
    endfunction

    covergroup cg;
        memregw: coverpoint regWrite{
            bins v1 = {[0:65536], [65536:16777216], [16777216:1073741824], [1073741824:32'd4294967295]};
        }
        wbrergw: coverpoint regDst{
            bins v2 = {[0:65536], [65536:16777216], [16777216:1073741824], [1073741824:32'd4294967295]};
        }
        ctr: coverpoint ctrl;
        fwdAE: coverpoint forwardAE{
            bins v3 = {[0:65536], [65536:16777216], [16777216:1073741824], [1073741824:32'd4294967295]};
        }
        fwdBE: coverpoint forwardBE;
    endgroup

    function void copy(Packet tr);
        this.clk = tr.clk;
        this.MEMregWrite = tr.MEMregWrite;
        this.WBregWrite = tr.WBregWrite;
        this.exRs = tr.exRs;
        this.exRt = tr.exRt;
        this.MEMwriteReg = tr.MEMwriteReg;
        this.WBwriteReg = tr.WBwriteReg;
        this.forwardAE = tr.forwardAE;
        this.forwardBE = tr.forwardBE;
    endfunction

    function new();
        cg = new;
    endfunction
endclass