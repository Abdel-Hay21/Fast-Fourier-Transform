package fft_pkg;

class transaction;

logic nRESET,ENABLE;
logic signed [11:0] signal_in_time [0:7]; //5 integer   7 fraction    
logic signed [11:0] signal_in_frequency_real [0:7]; //8 integer   4 fraction
logic signed [11:0] signal_in_frequency_image [0:7]; //8 integer   4 fraction
logic FFT_FINISH;
real signal_in_freq_in_decimal_real [0:7];
real signal_in_freq_in_decimal_image [0:7];

endclass

endpackage