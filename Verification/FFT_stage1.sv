module FFT_stage1(
input CLK,nRESET,ENABLE,
input wire signed [11:0] signal_in_time [0:7], //5 integer   7 fraction
output reg signed [11:0] x_stage1_real  [0:7],  //6 integer   6 fraction
output reg signed [11:0] x_stage1_image [0:7],  //6 integer   6 fraction
output reg stage1_done
);


parameter W1_real= 12'sb00000_1011011;
parameter W1_image=12'sb11111_0100101;


parameter W3_real=12'sb11111_0100101;
parameter W3_image=12'sb11111_0100101;

reg signed [12:0] signal_in_time_ex [0:7];

reg signed [23:0] signal_temp1, signal_temp2, signal_temp3, signal_temp4;

always@(posedge CLK or negedge nRESET)
begin
    if(stage1_done)
       stage1_done <= 1'b0;

    if(!nRESET)
    begin
        stage1_done<=1'b0;
        for(int i=0; i<8; i=i+1)
        begin
            x_stage1_real[i] <=12'sd0;
            x_stage1_image[i] <=12'sd0;
        end
    end
    else if(ENABLE) begin

    for(int i=0; i<8 ; i=i+1)
        signal_in_time_ex[i]= {signal_in_time[i][11], signal_in_time[i]};


    x_stage1_real[0] <= ((signal_in_time_ex[0] + signal_in_time_ex[4]) >> 1);
    x_stage1_image[0] <= 12'sd0;

    x_stage1_real[1] <= ((signal_in_time_ex[1] + signal_in_time_ex[5]) >> 1);
    x_stage1_image[1] <= 12'sd0;

    x_stage1_real[2] <= ((signal_in_time_ex[2] + signal_in_time_ex[6]) >> 1);
    x_stage1_image[2] <= 12'sd0;

    x_stage1_real[3] <= ((signal_in_time_ex[3] + signal_in_time_ex[7]) >> 1);
    x_stage1_image[3] <= 12'sd0;




    x_stage1_real[4] <= ((signal_in_time_ex[0] - signal_in_time_ex[4]) >> 1);
    x_stage1_image[4] <= 12'sd0;

    signal_temp1 = ((signal_in_time_ex[1] - signal_in_time_ex[5]) * W1_real);
    x_stage1_real[5] <= (signal_temp1 >> 8);
    signal_temp2 = ((signal_in_time_ex[1] - signal_in_time_ex[5]) * W1_image);
    x_stage1_image[5] <= (signal_temp2 >> 8);

    x_stage1_real[6] <= 12'sd0;
    x_stage1_image[6] <= ((signal_in_time_ex[6] - signal_in_time_ex[2]) >> 1);

    signal_temp3 = ((signal_in_time_ex[3] - signal_in_time_ex[7]) * W3_real);
    x_stage1_real[7] <= (signal_temp3 >> 8);
    signal_temp4 = ((signal_in_time_ex[3] - signal_in_time_ex[7]) * W3_image);
    x_stage1_image[7] <= (signal_temp4 >> 8);

    stage1_done<=1'b1;      
    end
end

endmodule