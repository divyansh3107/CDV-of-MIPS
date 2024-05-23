// Code your testbench here
// or browse Examples
class Packet;
  rand bit [1:0] ctrl;
  rand bit [31:0] in1;
  rand bit [31:0] in2;
  rand bit [31:0] in3;
  rand bit [31:0] in4;
  bit [31:0] out;

  function void print(string tag = "");
    $display("ctrl=%0h in1=%0h in2=%0h in3=%0h in4=%0h out=%0h", ctrl, in1, in2, in3, in4, out);
  endfunction
	
      covergroup cg ;
      
      ctrl: coverpoint ctrl{
        bins v1 = {[0:2], [3:4]};
        }
      in1: coverpoint in1{
          bins v4 = {[0:65536], [65536:16777216], [16777216:1073741824], [1073741824:32'd4294967295]};
        }
      in2: coverpoint in2{
          bins v5 = {[0:65536], [65536:16777216], [16777216:1073741824], [1073741824:32'd4294967295]};
        }
      in3: coverpoint in3{
          bins v6 = {[0:65536], [65536:16777216], [16777216:1073741824], [1073741824:32'd4294967295]};
        }
       in4: coverpoint in4{
          bins v7 = {[0:65536], [65536:16777216], [16777216:1073741824], [1073741824:32'd4294967295]};
        }
        
 	   out: coverpoint out{
          bins v8 = {[0:65536], [65536:16777216], [16777216:1073741824], [1073741824:32'd4294967295]};
        }
    endgroup
  function void copy(Packet tr);
    this.ctrl = tr.ctrl;
    this.in1 = tr.in1;
    this.in2 = tr.in2;
    this.in3 = tr.in3;
    this.in4 = tr.in4;
    this.out = tr.out;
  endfunction

  function new();
    cg = new;
  endfunction
endclass
