class Packet;
    bit clk;
    rand bit[31:0] aluSrcA, aluSrcB;
    rand bit [1:0] ctrl;
    bit[31:0] EXaluOut;
    bit ALUzeroOp;
    
        
    function void print(string tag="");
    $display("T=%0t %s aluSrcA=0x%0h aluSrcB=0x%0h ctrl=0x%0h EXaluOut=0x%0h ALUzeroOp=0x%0h",$time,tag,aluSrcA,aluSrcB,ctrl,EXaluOut,ALUzeroOp);
    endfunction

    covergroup cg;
        aluA: coverpoint aluSrcA{
            bins v1 = {[0:65536], [65536:16777216], [16777216:1073741824], [1073741824:32'd4294967295]};
        }
        aluB: coverpoint aluSrcB{
            bins v2 = {[0:65536], [65536:16777216], [16777216:1073741824], [1073741824:32'd4294967295]};
        }
        ctr: coverpoint ctrl;
        EX: coverpoint EXaluOut{
            bins v3 = {[0:65536], [65536:16777216], [16777216:1073741824], [1073741824:32'd4294967295]};
        }
        ALUz: coverpoint ALUzeroOp;
    endgroup

    function void copy(Packet tr);
        //this.clk = tr.clk;
        this.aluSrcA = tr.aluSrcA;
        this.aluSrcB = tr.aluSrcB;
        this.ctrl = tr.ctrl;
        this.EXaluOut = tr.EXaluOut;
        this.ALUzeroOp = tr.ALUzeroOp;
    endfunction

    function new();
        cg = new;
    endfunction
endclass