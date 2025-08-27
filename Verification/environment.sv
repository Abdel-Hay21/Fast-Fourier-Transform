`include "driver.sv"
`include "monitor.sv"
`include "generator.sv"
`include "scoreboard.sv"

class environment;
generator g0;
driver d0;
monitor m0;
scoreboard s0;

mailbox drv_mbx;
mailbox scb_mbx;

virtual fft_interface vif;

event drv_done;


function new();
g0 = new;
d0 = new;
m0 = new;
s0 = new;
drv_mbx = new;
scb_mbx = new;
endfunction



virtual task run();
d0.vif = vif;
m0.vif = vif;

d0.drv_mbx = drv_mbx;
g0.drv_mbx = drv_mbx;

m0.scb_mbx = scb_mbx;
s0.scb_mbx = scb_mbx;

d0.drv_done = drv_done;
g0.drv_done = drv_done;

fork
    s0.run();
    d0.run();
    m0.run();
    g0.run();
join_any
endtask
endclass