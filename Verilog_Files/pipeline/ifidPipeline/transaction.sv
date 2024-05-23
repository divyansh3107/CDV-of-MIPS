class Packet;
    bit clk;
    rand bit[31:0] opcode;
    rand bit hazardflag;
    bit[31:0] ifidOpcode;

    
        
    function void print(string tag="");
      $display("T=%0t opcode=0x%0h hazardflag=0x%0h ifidOpcode=0x%0h",$time,opcode,hazardflag,ifidOpcode);
    endfunction

    covergroup cg;
        opc: coverpoint opcode{
            bins v1 = {[0:65536], [65536:16777216], [16777216:1073741824], [1073741824:32'd4294967295]};
        }
        hflag: coverpoint hazardflag;
        ifidc: coverpoint ifidOpcode{
            bins v3 = {[0:65536], [65536:16777216], [16777216:1073741824], [1073741824:32'd4294967295]};
        }
        
    endgroup

    function void copy(Packet tr);
        this.clk = tr.clk;
        this.opcode = tr.opcode;
        this.hazardflag = tr.hazardflag;
        this.ifidOpcode = tr.ifidOpcode;
    endfunction

    function new();
        cg = new;
    endfunction
endclass