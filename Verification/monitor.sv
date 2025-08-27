import fft_pkg::*;

class monitor;

virtual fft_interface vif;
mailbox scb_mbx;

task run();
integer i=0;
forever begin
    transaction observed= new;
    @(negedge vif.CLK);
    if(i==0)
    begin
    @(negedge vif.CLK);
    @(negedge vif.CLK);
    @(negedge vif.CLK);
    @(negedge vif.CLK);
    i=i+1;
    end
    observed.nRESET = vif.nRESET;
    observed.ENABLE = vif.ENABLE;
    observed.signal_in_time = vif.signal_in_time;
    observed.signal_in_frequency_real = vif.signal_in_frequency_real;
    observed.signal_in_frequency_image = vif.signal_in_frequency_image;
    observed.FFT_FINISH = vif.FFT_FINISH;
    scb_mbx.put(observed);
end
endtask
endclass