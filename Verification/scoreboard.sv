import fft_pkg::*;

class scoreboard;
mailbox scb_mbx;

task run();
integer fd; 
integer fd_real; 
integer fd_image; 
integer number_of_iteration=1;
real error_in_real, error_in_image;
parameter error= 0.32;

integer x=0;
fd = $fopen("fft_outputs.txt", "r");
fd_real = $fopen("error_RTL_MATLAB_real.txt", "w");
fd_image = $fopen("error_RTL_MATLAB_image.txt", "w");

forever begin
    transaction observed, ref_observed;
    scb_mbx.get(observed);
         if(!observed.FFT_FINISH)
         begin
           continue;
         end
            ref_observed = new();
            $display("test= %0d",number_of_iteration);
            number_of_iteration = number_of_iteration+1;
            for (int i=0; i<8 ; i++)
            begin
                observed.signal_in_freq_in_decimal_real[i] = 0.0625*observed.signal_in_frequency_real[i][0] + 0.125*observed.signal_in_frequency_real[i][1] + 0.25*observed.signal_in_frequency_real[i][2] + 0.5*observed.signal_in_frequency_real[i][3] + 1*observed.signal_in_frequency_real[i][4] + 2*observed.signal_in_frequency_real[i][5] + 4*observed.signal_in_frequency_real[i][6] + 8*observed.signal_in_frequency_real[i][7] + 16*observed.signal_in_frequency_real[i][8] + 32*observed.signal_in_frequency_real[i][9] + 64*observed.signal_in_frequency_real[i][10] - 128*observed.signal_in_frequency_real[i][11];
                observed.signal_in_freq_in_decimal_image[i] = 0.0625*observed.signal_in_frequency_image[i][0] + 0.125*observed.signal_in_frequency_image[i][1] + 0.25*observed.signal_in_frequency_image[i][2] + 0.5*observed.signal_in_frequency_image[i][3] + 1*observed.signal_in_frequency_image[i][4] + 2*observed.signal_in_frequency_image[i][5] + 4*observed.signal_in_frequency_image[i][6] + 8*observed.signal_in_frequency_image[i][7] + 16*observed.signal_in_frequency_image[i][8] + 32*observed.signal_in_frequency_image[i][9] + 64*observed.signal_in_frequency_image[i][10] - 128*observed.signal_in_frequency_image[i][11];
                $fscanf(fd, "%f %f", ref_observed.signal_in_freq_in_decimal_real[i] , ref_observed.signal_in_freq_in_decimal_image[i]);
                
                error_in_real=(observed.signal_in_freq_in_decimal_real[i]-ref_observed.signal_in_freq_in_decimal_real[i]);

                error_in_image=(observed.signal_in_freq_in_decimal_image[i]-ref_observed.signal_in_freq_in_decimal_image[i]);

                $fdisplay(fd_real, "%f", error_in_real);
                $fdisplay(fd_image, "%f", error_in_image);
                //$display("matlab real[%0d]= %f     RTL real[i]= %f",i, ref_observed.signal_in_freq_in_decimal_real[i], observed.signal_in_freq_in_decimal_real[i]);
                //$display("matlab image[%0d]= %f     RTL image[i]= %f",i, ref_observed.signal_in_freq_in_decimal_image[i], observed.signal_in_freq_in_decimal_image[i]);
 
                if(observed.signal_in_freq_in_decimal_real[i] >= ref_observed.signal_in_freq_in_decimal_real[i])
                begin
                    if(((observed.signal_in_freq_in_decimal_real[i] - ref_observed.signal_in_freq_in_decimal_real[i]) < error))
                     $display("N=%0d Match! (real)", i+1);
                    else
                       $display("N=%0d Not match! (real)      matlab real[%0d]= %f     RTL real[i]= %f", i+1,i, ref_observed.signal_in_freq_in_decimal_real[i], observed.signal_in_freq_in_decimal_real[i]);
                end

                else if(ref_observed.signal_in_freq_in_decimal_real[i] > observed.signal_in_freq_in_decimal_real[i])
                begin
                    if(((ref_observed.signal_in_freq_in_decimal_real[i] - observed.signal_in_freq_in_decimal_real[i]) < error))
                       $display("N=%0d Match! (real)", i+1);
                    else
                       $display("N=%0d Not match! (real)      matlab real[%0d]= %f     RTL real[i]= %f", i+1,i, ref_observed.signal_in_freq_in_decimal_real[i], observed.signal_in_freq_in_decimal_real[i]);
                end



                if(observed.signal_in_freq_in_decimal_image[i] >= ref_observed.signal_in_freq_in_decimal_image[i])
                begin
                    if(((observed.signal_in_freq_in_decimal_image[i] - ref_observed.signal_in_freq_in_decimal_image[i]) < error))
                       $display("N=%0d Match! (image)\n", i+1);
                    else
                       $display("N=%0d Not match! (image)      matlab image[%0d]= %f     RTL image[i]= %f\n", i+1,i, ref_observed.signal_in_freq_in_decimal_image[i], observed.signal_in_freq_in_decimal_image[i]);
                end

                else if(ref_observed.signal_in_freq_in_decimal_image[i] > observed.signal_in_freq_in_decimal_image[i])
                begin
                    if(((ref_observed.signal_in_freq_in_decimal_image[i] - observed.signal_in_freq_in_decimal_image[i]) < error))
                       $display("N=%0d Match! (image)\n", i+1);
                    else
                       $display("N=%0d Not match! (image)      matlab image[%0d]= %f     RTL image[i]= %f\n", i+1,i, ref_observed.signal_in_freq_in_decimal_image[i], observed.signal_in_freq_in_decimal_image[i]);
                end



            end
           $display("\n");
end
$fclose(fd);
$fclose(fd_real);
$fclose(fd_image);
endtask
endclass
