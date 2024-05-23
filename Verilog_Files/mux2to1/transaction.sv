class Packet;
  rand bit ctrl;
  rand bit [4:0] in1;
  rand bit [4:0] in2;
  bit [4:0] out;

  function void print(string tag = "");
    $display("ctrl=%0h in1=%0h in2=%0h out=%0h", ctrl, in1, in2, out);
  endfunction
  
    covergroup cg ;
        ctrl: coverpoint ctrl;
      in1: coverpoint in1{bins v1 = {[0:3], [4:7], [8:11], [12:15]};}
      in2: coverpoint in2{bins v2 = {[0:3], [4:7], [8:11], [12:15]};}
      out: coverpoint out{bins v3 = {[0:3], [4:7], [8:11], [12:15]};}

    endgroup

  function void copy(Packet tr);
    this.ctrl = tr.ctrl;
    this.in1 = tr.in1;
    this.in2 = tr.in2;
    this.out = tr.out;
  endfunction

  function new();
    cg = new;
  endfunction
endclass
