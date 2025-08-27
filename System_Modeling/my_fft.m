function FFT_Algorithm= my_fft(x,N,T)   

% initialize the signals 
 W= cast([1, (1/sqrt(2))- 1i * (1/sqrt(2)), -1i, -(1/sqrt(2))- 1i * (1/sqrt(2))], 'like', T.W);

 x_stage1= complex( zeros(1,N, 'like', T.x_stage1) );
 x_stage2= complex( zeros(1,N, 'like', T.x_stage2) );
 x_stage3= complex( zeros(1,N, 'like', T.x_stage3) );
 
 FFT_Algorithm= complex( zeros(1,N, 'like', T.x_stage3) );



%%%%% Stage 1 %%%%%
x_stage1(1)= x(1) + x(5);
x_stage1(5)= (x(1) - x(5)) * W(1);

x_stage1(2)= x(2) + x(6);
x_stage1(6)= (x(2) - x(6)) * W(2);

x_stage1(3)= x(3) + x(7);
x_stage1(7)= (x(3) - x(7)) * W(3);

x_stage1(4)= x(4) + x(8);
x_stage1(8)= (x(4) - x(8)) * W(4);


%%%%% Stage 2 %%%%%
   x_stage2(1)= x_stage1(1) + x_stage1(3);
   x_stage2(3)= (x_stage1(1) - x_stage1(3))*W(1);

   x_stage2(2)= x_stage1(2) + x_stage1(4);
   x_stage2(4)= (x_stage1(2) - x_stage1(4))*W(3);  

   x_stage2(5)= x_stage1(5) + x_stage1(7);
   x_stage2(7)= (x_stage1(5) - x_stage1(7))*W(1);

   x_stage2(6)= x_stage1(6) + x_stage1(8);
   x_stage2(8)= (x_stage1(6) - x_stage1(8))*W(3);


%%%%% Stage 3 %%%%%
   x_stage3(1)= x_stage2(1) + x_stage2(2);
   x_stage3(2)= (x_stage2(1) - x_stage2(2))*W(1);

   x_stage3(3)= x_stage2(3) + x_stage2(4);
   x_stage3(4)= (x_stage2(3) - x_stage2(4))*W(1);

   x_stage3(5)= x_stage2(5) + x_stage2(6);
   x_stage3(6)= (x_stage2(5) - x_stage2(6))*W(1);

   x_stage3(7)= x_stage2(7) + x_stage2(8);
   x_stage3(8)= (x_stage2(7) - x_stage2(8))*W(1);

   
%%%%% rearrange the stage_3 signals to output
   FFT_Algorithm(1)=x_stage3(1);
   FFT_Algorithm(2)=x_stage3(5);

   FFT_Algorithm(3)=x_stage3(3);
   FFT_Algorithm(4)=x_stage3(7);

   FFT_Algorithm(5)=x_stage3(2);
   FFT_Algorithm(6)=x_stage3(6);

   FFT_Algorithm(7)=x_stage3(4);
   FFT_Algorithm(8)=x_stage3(8);
   
end