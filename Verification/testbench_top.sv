`include "test.sv"

module testbench_top();
parameter period = 10;
bit CLK;
fft_interface vif(CLK);
test t0= new;

initial begin
    CLK <= 0;
    t0.e0.vif = vif;
    t0.run();

    #(5*period)
    $finish;
end




FFT_TOP DUV (
.CLK(CLK), .nRESET(vif.nRESET), .ENABLE(vif.ENABLE),
.signal_in_time(vif.signal_in_time), .signal_in_frequency_real(vif.signal_in_frequency_real), .signal_in_frequency_image(vif.signal_in_frequency_image),
.FFT_FINISH(vif.FFT_FINISH)
);

always #(period/2) CLK = ~CLK;

endmodule