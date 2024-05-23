class registerFilePacket;
  rand bit WBregWrite;
  rand bit [4:0] idRs;
  rand bit [4:0] idRt;
  rand bit [4:0] WBwriteReg;
  rand bit [31:0] WBresult;
  bit [31:0] idregA;
  bit [31:0] idregB;
  bit clk;

  function void print(string tag = "");
    $display("WBregWrite=%0h idRs=%0h idRt=%0h WbwriteReg=%0h WBresult=%0h idregA=%0h idregB=%0h", WBregWrite, idRs, idRt, WBwriteReg, WBresult, idregA, idregB);
  endfunction
  
  
    covergroup cg @(posedge clk);
      WBrw: coverpoint WBregWrite;
      idRs: coverpoint idRs{
        bins v1 = {[0:3], [4:7], [8:11], [12:15]};
        }
      idRt: coverpoint idRt{
        bins v2 = {[0:3], [4:7], [8:11], [12:15]};
        }
      WBwr: coverpoint WBwriteReg{
        bins v3 = {[0:7], [4:7], [8:15], [12:15]};
        }
      WBres: coverpoint WBresult{
          bins v4 = {[0:65536], [65536:16777216], [16777216:1073741824], [1073741824:32'd4294967295]};
        }
      idrA: coverpoint idregA{
          bins v5 = {[0:65536], [65536:16777216], [16777216:1073741824], [1073741824:32'd4294967295]};
        }
      idrB: coverpoint idregB{
          bins v6 = {[0:65536], [65536:16777216], [16777216:1073741824], [1073741824:32'd4294967295]};
        }
    endgroup

  function void copy(registerFilePacket tr);
    this.clk = tr.clk;
    this.WBregWrite = tr.WBregWrite;
    this.idRs = tr.idRs;
    this.idRt = tr.idRt;
    this.WBwriteReg = tr.WBwriteReg;
    this.WBresult = tr.WBresult;
    this.idregA = tr.idregA;
    this.idregB = tr.idregB;
  endfunction

    function new();
        cg = new;
    endfunction
  
endclass
