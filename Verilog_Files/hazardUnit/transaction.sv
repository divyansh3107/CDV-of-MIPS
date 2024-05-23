class hazardUnitPacket;
  rand bit [4:0] idRs;
  rand bit [4:0] idRt;
  rand bit [4:0] exRt;
  rand bit EXmemtoReg;
  rand bit [31:0] ifidOpcode;
  bit pcwrite;
  bit hazardflag;

  function void print(string tag = "");
    $display("HAZARD DETECTED: idRs=%b idRt=%b exRt=%b",idRs,idRt,exRt);
  endfunction
  
      covergroup cg;
      EXmr: coverpoint EXmemtoReg;
      pcr: coverpoint pcwrite;
      hzf: coverpoint hazardflag;
      idRs: coverpoint idRs{
        bins v1 = {[0:3], [4:7], [8:11], [12:15]};
        }
      idRt: coverpoint idRt{
        bins v2 = {[0:3], [4:7], [8:11], [12:15]};
        }
      exRt: coverpoint exRt{
        bins v3 = {[0:7], [4:7], [8:15], [12:15]};
        }

      ifidOp: coverpoint ifidOpcode{
          bins v4 = {[0:65536], [65536:16777216], [16777216:1073741824], [1073741824:32'd4294967295]};
        }
    endgroup

  function void copy(hazardUnitPacket tr);
    this.idRs = tr.idRs;
    this.idRt = tr.idRt;
    this.exRt = tr.exRt;
    this.EXmemtoReg = tr.EXmemtoReg;
    this.ifidOpcode = tr.ifidOpcode;
    this.pcwrite = tr.pcwrite;
    this.hazardflag = tr.hazardflag;
  endfunction

  function new();
    cg = new;
  endfunction
endclass
