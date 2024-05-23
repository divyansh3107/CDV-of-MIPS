`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "interface.sv"

class environment;
    generator   g0;
    driver      d0;
    monitor     m0;
    scoreboard  s0;
    mailbox     scb_mbx;
    virtual inf vif;

    event drv_done;
    mailbox drv_mbx;

    function new();
        d0 = new;
        g0 = new;
        s0 = new;
        m0 = new;
        scb_mbx = new;
        drv_mbx = new;

    endfunction


    virtual task run();
        d0.vif = vif;
        m0.vif = vif;

        d0.drv_done = drv_done;
        d0.drv_mbx = drv_mbx;

        
        g0.drv_done = drv_done;
        g0.drv_mbx = drv_mbx;

        s0.scb_mbx = scb_mbx;
        m0.scb_mbx = scb_mbx;

        fork
            d0.run();
            m0.run();
            s0.run();
            g0.run();
            g0.displayCov();
        join_any
    endtask
endclass