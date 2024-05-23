class transaction;
    rand bit branch;
    rand bit update;
    bit prediction;

    function void print(string tag="");
    $display("T=%0t %s branch=0x%0h update=0x%0h prediction=0x%0h",
    $time,tag,branch,update,prediction);
    endfunction;
  
    covergroup cg ;
      option.per_instance=1;
        br: coverpoint branch;
        upd: coverpoint update;
        pred: coverpoint prediction;

    endgroup

  function void copy(transaction tr);
        //copy = new();
        this.branch = tr.branch;
        this.update = tr.update;
        this.prediction = tr.prediction;
    endfunction
  
  

    function new();
        cg = new;
    endfunction

endclass
