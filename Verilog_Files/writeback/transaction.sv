class writebackPacket;
  rand bit WBmemtoReg;
  rand bit [31:0] WBreaddata;
  rand bit [31:0] WBaluOut;
  bit [31:0] WBresult;

  function void print(string tag = "");
    $display("WBmemtoReg=%0h WBreaddata=%0h WBaluOut=%0h WBresult=%0h", WBmemtoReg, WBreaddata, WBaluOut, WBresult);
  endfunction

  function void copy(writebackPacket tr);
    this.WBmemtoReg = tr.WBmemtoReg;
    this.WBreaddata = tr.WBreaddata;
    this.WBaluOut = tr.WBaluOut;
    this.WBresult = tr.WBresult;
  endfunction

  function new();
  endfunction
endclass
