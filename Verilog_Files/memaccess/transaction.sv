class Packet;
    bit clk;
    rand bit[1:0] c;
    rand bit execute;

    bit[1:0] d;
    bit memaccess;
        
    function void print(string tag="");
      $display("T=%0t %s c=0x%0h execute=0x%0h d=0x%0h memaccess=0x%0h",$time,tag,c, execute, d, memaccess);
    endfunction

    covergroup cg;
        C: coverpoint c;
        exe: coverpoint execute;
        D: coverpoint d;
        mema: coverpoint memaccess;
    endgroup

    function void copy(Packet tr);
        this.clk = tr.clk;
        this.c = tr.c;
        this.execute = tr.execute;
        this.d = tr.d;
        this.memaccess = tr.memaccess;
    endfunction

    function new();
        cg = new;
    endfunction
endclass