class Mux2to132bitPacket;
  rand bit ctrl;
  rand bit [31:0] in1;
  rand bit [31:0] in2;
  bit [31:0] out;

  function void print(string tag = "");
    $display("ctrl=%0h in1=%0h in2=%0h out=%0h", ctrl, in1, in2, out);
  endfunction

  function void copy(Mux2to132bitPacket tr);
    this.ctrl = tr.ctrl;
    this.in1 = tr.in1;
    this.in2 = tr.in2;
    this.out = tr.out;
  endfunction

  function new();
  endfunction
endclass
