module FFT_tb();
reg CLK_tb,nRESET_tb,ENABLE_tb;
reg  signed [11:0] signal_in_time_tb [0:7]; //5 integer   7 fraction    
wire signed [11:0] signal_in_frequency_real_tb [0:7]; //8 integer   4 fraction
wire signed [11:0] signal_in_frequency_image_tb [0:7]; //8 integer   4 fraction
wire FFT_FINISH_tb;

real signal_in_freq_in_decimal_real [0:7];
real signal_in_freq_in_decimal_image [0:7];

parameter period = 2;

initial begin
reset();
#period

signal_in_time_tb[0] = 12'b01100_1000000; 
signal_in_time_tb[1] = 12'b11100_0000000; 
signal_in_time_tb[2] = 12'b10000_0000000;  
signal_in_time_tb[3] = 12'b00100_1110000; 
 
signal_in_time_tb[4] = 12'b01001_0000000;  
signal_in_time_tb[5] = 12'b01110_0110000;  
signal_in_time_tb[6] = 12'b10001_0000000;  
signal_in_time_tb[7] = 12'b11101_0000000; 
test();

/*signal_in_time_tb[0] = 12'b00001_0000000; 
signal_in_time_tb[1] = 12'b00010_0000000; 
signal_in_time_tb[2] = 12'b10001_0000000;  
signal_in_time_tb[3] = 12'b00111_0000000; 
 
signal_in_time_tb[4] = 12'b01011_0000000;  
signal_in_time_tb[5] = 12'b00101_0000000;  
signal_in_time_tb[6] = 12'b01111_0000000;  
signal_in_time_tb[7] = 12'b11100_0000000; 
test();*/
#(5*period)
$finish;

end

task reset;
begin
    CLK_tb=0; nRESET_tb=0; ENABLE_tb=0;
    #period
    nRESET_tb=1;
end
endtask

task test;
begin
    ENABLE_tb = 1'b1;
    #(period)
    ENABLE_tb = 1'b0;
    #(3*period)
    for(int i=0; i<8; i=i+1)
    begin
        signal_in_freq_in_decimal_real[i] = 0.0625*signal_in_frequency_real_tb[i][0] + 0.125*signal_in_frequency_real_tb[i][1] + 0.25*signal_in_frequency_real_tb[i][2] + 0.5*signal_in_frequency_real_tb[i][3] + 1*signal_in_frequency_real_tb[i][4] + 2*signal_in_frequency_real_tb[i][5] + 4*signal_in_frequency_real_tb[i][6] + 8*signal_in_frequency_real_tb[i][7] + 16*signal_in_frequency_real_tb[i][8] + 32*signal_in_frequency_real_tb[i][9] + 64*signal_in_frequency_real_tb[i][10] - 128*signal_in_frequency_real_tb[i][11];
        signal_in_freq_in_decimal_image[i] = 0.0625*signal_in_frequency_image_tb[i][0] + 0.125*signal_in_frequency_image_tb[i][1] + 0.25*signal_in_frequency_image_tb[i][2] + 0.5*signal_in_frequency_image_tb[i][3] + 1*signal_in_frequency_image_tb[i][4] + 2*signal_in_frequency_image_tb[i][5] + 4*signal_in_frequency_image_tb[i][6] + 8*signal_in_frequency_image_tb[i][7] + 16*signal_in_frequency_image_tb[i][8] + 32*signal_in_frequency_image_tb[i][9] + 64*signal_in_frequency_image_tb[i][10] - 128*signal_in_frequency_image_tb[i][11];
    end
    for(int i=0; i<8; i=i+1)
    begin
        $display("N%0d= %f+%fj", i, signal_in_freq_in_decimal_real[i], signal_in_freq_in_decimal_image[i]);
        //$display("N%0d= %b+%bj", i, signal_in_frequency_real_tb[i], signal_in_frequency_real_tb[i]);
    end
    $display("\n\n");
end
endtask

always#(period/2) CLK_tb=~CLK_tb;
FFT_TOP DUT(
.CLK(CLK_tb), .nRESET(nRESET_tb), .ENABLE(ENABLE_tb),
.signal_in_time(signal_in_time_tb),
.signal_in_frequency_real(signal_in_frequency_real_tb), .signal_in_frequency_image(signal_in_frequency_image_tb),
.FFT_FINISH(FFT_FINISH_tb)
);
endmodule