clear; clc; close all;

% define the data type length
T = fft_types('fixed_point');

% parameters
N=8;
number_of_tests= 100;
error =zeros(1,number_of_tests);
SQNR =zeros(1,number_of_tests);

fid_in  = fopen('fft_inputs.txt', 'w');   % ملف الـ inputs
fid_out = fopen('fft_outputs.txt', 'w');  % ملف الـ outputs


for test =1:1:number_of_tests

    % Randamize inputs
    a = -16;
    b = 15;
    signal_in_time = cast((b-a)*rand(1, N) + a, 'like', T.signal_in_time);

    % build instrumented mex
    if test == 1
        buildInstrumentedMex my_fft -args {signal_in_time, N, T};
    end

    % FFT Algorithm
    FFT_Algorithm= my_fft_mex(signal_in_time,N,T);

    % Golden Model
    FFT_expected=  fft(double(signal_in_time) , N);

    % calculate the error
    error(test) = abs(mean(FFT_expected-double(FFT_Algorithm)));

    signal_power = mean(abs(FFT_expected).^2);
    noise_power  = mean(abs(FFT_expected-double(FFT_Algorithm)).^2);
    SQNR(test) = 10 * log10(signal_power / noise_power);

    for i = 1:N
    int_val = round(double(signal_in_time(i)) * 2^7);
    bin_str = dec2bin(mod(int_val, 2^(12)), 12);
    fprintf(fid_in, '%s ', bin_str);
    end
    fprintf(fid_in, '\n'); % سطر جديد لكل test

    
    for i = 1:N
        fprintf(fid_out, '%f %f ', real(FFT_Algorithm(i)), imag(FFT_Algorithm(i)));
    end
    fprintf(fid_out, '\n');

end

fclose(fid_in);
fclose(fid_out);

% show Instrumentation Results
showInstrumentationResults my_fft_mex -proposeFL -defaultDT numerictype(1,32)

% Plotting
figure;
x= 1:1:number_of_tests;
y= error;
plot(x, y, "linewidth", 2);
grid on;
xlabel("Test Number");
ylabel("error");


% Plot SQNR
figure;
x= 1:1:number_of_tests;
y= SQNR;
semilogy(x, y, "linewidth", 2);
grid on;
xlabel("Test Number");
ylabel("SQNR");
title("SQNR for fixed point and fft build-in function");
