module FFT_TOP(
input CLK,nRESET,ENABLE,
input wire signed [11:0] signal_in_time [0:7], //5 integer   7 fraction    
output reg signed [11:0] signal_in_frequency_real [0:7], //8 integer   4 fraction
output reg signed [11:0] signal_in_frequency_image [0:7], //8 integer   4 fraction
output reg FFT_FINISH
);

wire stage1_done,stage2_done,stage3_done;
wire signed [11:0] x_stage1_real  [0:7];  //6 integer   6 fraction
wire signed [11:0] x_stage1_image [0:7];  //6 integer   6 fraction

wire signed [11:0] x_stage2_real [0:7];    //7 integer   5 fraction
wire signed [11:0] x_stage2_image [0:7];   //7 integer   5 fraction

wire signed [11:0] x_stage3_real [0:7];    //8 integer   4 fraction
wire signed [11:0] x_stage3_image [0:7];   //8 integer   4 fraction

always@(posedge CLK or negedge nRESET)
begin
    if(FFT_FINISH)
       FFT_FINISH <= 1'b0;

    if(!nRESET)
    begin
        FFT_FINISH <=0;
        for(int i=0; i<8; i=i+1)
        begin
            signal_in_frequency_real[i] <=12'sd0;
            signal_in_frequency_image[i] <=12'sd0;    
        end 
    end

    else if(stage3_done) begin

            signal_in_frequency_real[0] <= x_stage3_real[0];
            signal_in_frequency_image[0] <= x_stage3_image[0];

            signal_in_frequency_real[1] <= x_stage3_real[4];
            signal_in_frequency_image[1] <= x_stage3_image[4];

            signal_in_frequency_real[2] <= x_stage3_real[2];
            signal_in_frequency_image[2] <= x_stage3_image[2];

            signal_in_frequency_real[3] <= x_stage3_real[6];
            signal_in_frequency_image[3] <= x_stage3_image[6];

            signal_in_frequency_real[4] <= x_stage3_real[1];
            signal_in_frequency_image[4] <= x_stage3_image[1];

            signal_in_frequency_real[5] <= x_stage3_real[5];
            signal_in_frequency_image[5] <= x_stage3_image[5];

            signal_in_frequency_real[6] <= x_stage3_real[3];
            signal_in_frequency_image[6] <= x_stage3_image[3];

            signal_in_frequency_real[7] <= x_stage3_real[7];
            signal_in_frequency_image[7] <= x_stage3_image[7];

            FFT_FINISH <=1;
    end   
end

    FFT_stage1 link1(
    .CLK(CLK), .nRESET(nRESET),
    .signal_in_time(signal_in_time),
    .x_stage1_real(x_stage1_real), .x_stage1_image(x_stage1_image),
    .ENABLE(ENABLE), .stage1_done(stage1_done)
    );


    FFT_stage2 link2(
    .CLK(CLK), .nRESET(nRESET),
    .x_stage1_real(x_stage1_real), .x_stage1_image(x_stage1_image),
    .x_stage2_real(x_stage2_real), .x_stage2_image(x_stage2_image),
    .stage1_done(stage1_done), .stage2_done(stage2_done)
    );


    FFT_stage3 link3(
    .CLK(CLK), .nRESET(nRESET),
    .x_stage2_real(x_stage2_real), .x_stage2_image(x_stage2_image),
    .x_stage3_real(x_stage3_real), .x_stage3_image(x_stage3_image),
    .stage2_done(stage2_done), .stage3_done(stage3_done)
    );     

endmodule