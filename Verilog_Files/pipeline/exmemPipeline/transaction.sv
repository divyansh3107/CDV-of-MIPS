class Packet;
    bit clk;
  rand bit[31:0] EXaluOut, EXwritedata;
    rand bit[4:0] EXwriteReg;
    rand bit EXregWrite, EXmemtoReg, EXmemWrite;

    bit[4:0] MEMwriteReg;
    bit[31:0] MEMaluOut, MEMwritedata;
    bit MEMregWrite, MEMmemtoReg, MEMmemWrite;
        
    function void print(string tag="");
      $display("T=%0t EXregWrite=0x%0h EXmemtoReg=0x%0h EXmemWrite=0x%0h MEMregWrite=0x%0h MEMmemtoReg=0x%0h MEMmemWrite=0x%0h",$time,EXregWrite,EXmemtoReg,EXmemWrite,MEMregWrite,MEMmemtoReg,MEMmemWrite);
    endfunction

    covergroup cg;
        EXa: coverpoint EXaluOut{
            bins v1 = {[0:65536], [65536:16777216], [16777216:1073741824], [1073741824:32'd4294967295]};
        }
        EXw: coverpoint EXwritedata{
            bins v2 = {[0:65536], [65536:16777216], [16777216:1073741824], [1073741824:32'd4294967295]};
        }
        EXwR: coverpoint EXwriteReg{
            bins v3 = {[0:16], [16:32]};
        }
        EXrW: coverpoint EXregWrite;
        EXmtR: coverpoint EXmemtoReg;
        EXmW: coverpoint EXmemWrite;

        MEMa: coverpoint MEMaluOut{
            bins v1 = {[0:65536], [65536:16777216], [16777216:1073741824], [1073741824:32'd4294967295]};
        }
        MEMw: coverpoint MEMwritedata{
            bins v2 = {[0:65536], [65536:16777216], [16777216:1073741824], [1073741824:32'd4294967295]};
        }
        MEMwR: coverpoint MEMwriteReg{
            bins v3 = {[0:16], [16:32]};
        }

        MEMrW: coverpoint MEMregWrite;
        MEMmtR: coverpoint MEMmemtoReg;
        MEMmW: coverpoint MEMmemWrite;
    endgroup

    function void copy(Packet tr);
        this.clk = tr.clk;
        this.EXaluOut = tr.EXaluOut;
        this.EXwritedata = tr.EXwritedata;
        this.EXwriteReg = tr.EXwriteReg;
        this.EXregWrite = tr.EXregWrite;
        this.EXmemtoReg = tr.EXmemtoReg;
        this.EXmemWrite = tr.EXmemWrite;

        this.MEMaluOut = tr.MEMaluOut;
        this.MEMwritedata = tr.MEMwritedata;
        this.MEMwriteReg = tr.MEMwriteReg;
        this.MEMregWrite = tr.MEMregWrite;
        this.MEMmemtoReg = tr.MEMmemtoReg;
        this.MEMmemWrite = tr.MEMmemWrite;
    endfunction

    function new();
        cg = new;
    endfunction
endclass