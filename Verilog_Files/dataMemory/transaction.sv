class Packet;
  rand bit memWrite;
  rand bit[31:0] address, writedata;
  bit [31:0] readdata;

    
        
    function void print(string tag="");
      $display("T=%0t memWrite=0x%0h address=0x%0h writedata=0x%0h readdata=0x%0h",$time,memWrite,address,writedata,readdata);
    endfunction

  covergroup cg;
        address: coverpoint address{
            bins v1 = {[0:65536], [65536:16777216], [16777216:1073741824], [1073741824:32'd4294967295]};
        }
        memWrite: coverpoint memWrite;
        
        writedata: coverpoint writedata{
            bins v2 = {[0:65536], [65536:16777216], [16777216:1073741824], [1073741824:32'd4294967295]};
        }
            readdata: coverpoint readdata{
            bins v3 = {[0:65536], [65536:16777216], [16777216:1073741824], [1073741824:32'd4294967295]};
        }
       
    endgroup


    function void copy(Packet tr);
        this.memWrite = tr.memWrite;
        this.address = tr.address;
        this.writedata = tr.writedata;
        this.readdata = tr.readdata;
    endfunction

    function new();
        cg = new;
    endfunction
endclass