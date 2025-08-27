import fft_pkg::*;

class driver;

virtual fft_interface vif;
event drv_done;
mailbox drv_mbx;

task run;
forever begin
    transaction item;
    drv_mbx.get(item);
    @(negedge vif.CLK);
    vif.nRESET = item.nRESET;
    vif.ENABLE = item.ENABLE;
    vif.signal_in_time = item.signal_in_time;

    ->drv_done;
end
endtask


endclass